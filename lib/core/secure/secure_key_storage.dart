import 'dart:io' show File;
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
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

  /// 从 .env 文件加载环境变量（仅非 Web 平台）
  Future<Map<String, String>> _loadDotEnv() async {
    if (_envCache != null) return _envCache!;
    final map = <String, String>{};
    try {
      if (kIsWeb) {
        _envCache = map;
        return map;
      }
      final file = File('.env');
      if (!await file.exists()) {
        _envCache = map;
        return map;
      }
      final lines = await file.readAsLines();
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
    } catch (_) {
      // 静默失败（文件不存在或不可读）
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

  /// 对所有已知 API Key 运行 resolve()
  Future<void> resolveAll() async {
    for (final key in KeyNames.allApiKeys) {
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
