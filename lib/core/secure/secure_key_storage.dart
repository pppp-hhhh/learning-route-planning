import 'dart:io' show File, Directory, Platform;
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:path_provider/path_provider.dart';
import 'key_names.dart';

/// API Key 三层优先级链存储
///
/// 读取优先顺序：dart-define → .env → Secure Storage
/// 高优先级源的值会被自动持久化到 Secure Storage，后续启动无需重复配置。
class SecureKeyStorage {
  final FlutterSecureStorage _secure;

  SecureKeyStorage({FlutterSecureStorage? secure})
      : _secure = secure ?? const FlutterSecureStorage();

  // ── .env 解析（手动，无额外依赖） ──

  Map<String, String>? _envCache;

  /// 搜索 .env 文件的可能位置
  ///
  /// 优先级：工作目录 → 应用文档目录 → 可执行文件目录
  Future<List<File>> _findEnvCandidates() async {
    final candidates = <File>[
      File('.env'),                                          // 1. 当前工作目录（debug 模式）
      File('${Directory.current.path}${Platform.pathSeparator}.env'),
    ];
    // 2. 应用文档目录（release 模式）
    try {
      final docsDir = await getApplicationDocumentsDirectory();
      candidates.add(File('${docsDir.path}${Platform.pathSeparator}.env'));
    } catch (_) {}
    // 3. 可执行文件所在目录
    try {
      final exeDir = File(Platform.resolvedExecutable).parent;
      candidates.add(File('${exeDir.path}${Platform.pathSeparator}.env'));
    } catch (_) {}
    return candidates;
  }

  /// 从 .env 文件加载环境变量（仅非 Web 平台）
  Future<Map<String, String>> _loadDotEnv() async {
    if (_envCache != null) return _envCache!;
    final map = <String, String>{};
    if (kIsWeb) {
      _envCache = map;
      return map;
    }

    File? foundFile;
    final candidates = await _findEnvCandidates();
    for (final file in candidates) {
      try {
        if (await file.exists()) {
          foundFile = file;
          debugPrint('[SecureKeyStorage] 找到 .env: ${file.path}');
          break;
        }
      } catch (_) {}
    }

    if (foundFile == null) {
      debugPrint('[SecureKeyStorage] 未找到 .env 文件（已尝试 ${candidates.length} 个路径）');
      _envCache = map;
      return map;
    }

    try {
      final lines = await foundFile.readAsLines();
      for (final line in lines) {
        final trimmed = line.trim();
        if (trimmed.isEmpty || trimmed.startsWith('#')) continue;
        final eq = trimmed.indexOf('=');
        if (eq <= 0) continue;
        final key = trimmed.substring(0, eq).trim();
        final value = trimmed.substring(eq + 1).trim();
        if (key.isNotEmpty) {
          map[key] = value;
        }
      }
    } catch (e) {
      debugPrint('[SecureKeyStorage] 读取 .env 失败: $e');
    }
    _envCache = map;
    return map;
  }

  // ── 基础读写 ──

  Future<String> read(String key) async {
    try {
      final value = await _secure.read(key: key);
      return value ?? '';
    } catch (_) {
      return '';
    }
  }

  Future<void> write(String key, String value) async {
    if (value.isEmpty) return;
    try {
      await _secure.write(key: key, value: value);
    } catch (_) {
      // 静默失败（安全存储在某些平台上可能抛异常）
    }
  }

  Future<void> delete(String key) async {
    try {
      await _secure.delete(key: key);
    } catch (_) {}
  }

  Future<void> clear() async {
    try {
      await _secure.deleteAll();
    } catch (_) {}
  }

  // ── 优先级链解析 ──

  /// 按优先级链解析单个 key：
  ///   1. dart-define（编译时注入）
  ///   2. .env 文件（运行时加载）
  ///   3. Secure Storage（已持久化）
  ///
  /// 如果 1 或 2 命中，自动持久化到 Secure Storage。
  Future<String> resolve({
    required String key,
    String? dartDefineName,
    String? envName,
  }) async {
    final ddName = dartDefineName ?? KeyNames.envNameFor(key);
    final eName = envName ?? ddName;

    // 1. dart-define
    if (!kIsWeb) {
      final fromDartDefine = String.fromEnvironment(ddName);
      if (fromDartDefine.isNotEmpty) {
        await write(key, fromDartDefine);
        return fromDartDefine;
      }
    }

    // 2. .env
    try {
      final env = await _loadDotEnv();
      final fromDotEnv = env[eName];
      if (fromDotEnv != null && fromDotEnv.isNotEmpty) {
        await write(key, fromDotEnv);
        return fromDotEnv;
      }
    } catch (_) {}

    // 3. Secure Storage
    return read(key);
  }

  /// 对所有已知 key（API keys + provider types）运行 resolve()
  ///
  /// 按优先级链 dart-define → .env → Secure Storage 依次查找，
  /// 高优先级源的值会被自动持久化到 Secure Storage。
  Future<void> resolveAll() async {
    for (final key in KeyNames.allResolvableKeys) {
      await resolve(key: key);
    }
  }

  // ── 批量辅助 ──

  /// 从 SharedPreferences 迁移已有 key 到 Secure Storage
  Future<int> migrateFromPrefs(
    Future<String?> Function(String key) prefsReader,
  ) async {
    int migrated = 0;
    for (final key in KeyNames.allApiKeys) {
      final existing = await read(key);
      if (existing.isNotEmpty) continue; // 已有更安全的副本
      final fromPrefs = await prefsReader(key);
      if (fromPrefs != null && fromPrefs.isNotEmpty) {
        await write(key, fromPrefs);
        migrated++;
      }
    }
    return migrated;
  }
}
