// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appTitle => 'AI 学习路线规划';

  @override
  String get home => '首页';

  @override
  String get roadmaps => '路线图';

  @override
  String get resources => '资源库';

  @override
  String get tutor => '导师';

  @override
  String get profile => '我的';

  @override
  String get settings => '设置';

  @override
  String get darkMode => '深色模式';

  @override
  String get language => '语言';

  @override
  String get notifications => '通知';

  @override
  String get dataPrivacy => '数据与隐私';

  @override
  String get exportData => '导出数据';

  @override
  String get clearData => '清除数据';

  @override
  String get about => '关于';

  @override
  String get version => '版本';

  @override
  String get error => '错误';

  @override
  String get retry => '重试';

  @override
  String get goHome => '返回首页';

  @override
  String get networkError => '网络连接失败';

  @override
  String get serverError => '服务器错误';

  @override
  String get notFound => '内容不存在';

  @override
  String get unknownError => '出了点问题';

  @override
  String get loading => '加载中...';

  @override
  String get save => '保存';

  @override
  String get cancel => '取消';

  @override
  String get confirm => '确认';

  @override
  String get delete => '删除';

  @override
  String get edit => '编辑';

  @override
  String get create => '创建';

  @override
  String get search => '搜索';

  @override
  String get noResults => '没有找到结果';

  @override
  String get apiConfiguration => 'API 配置';

  @override
  String get claudeApiKey => 'Claude API Key';

  @override
  String get exaApiKey => 'Exa API Key';

  @override
  String get searchProvider => '搜索提供商';

  @override
  String get selectAiProvider => '选择 AI 提供商';

  @override
  String get selectSearchProvider => '选择搜索提供商';

  @override
  String get howToGetApiKey => '如何获取 API Key？';

  @override
  String visitToSignUp(String url) {
    return '访问 $url 注册并获取您的 Key';
  }

  @override
  String get verifyAndContinue => '验证并继续';

  @override
  String get verifying => '验证中...';

  @override
  String get pleaseEnterApiKey => '请输入 API Key';

  @override
  String get apiVerificationFailed => 'API 验证失败';

  @override
  String get apiKeyStoredLocally => '您的 API Key 仅存储在本地，不会被分享。';

  @override
  String get optional => '可选';

  @override
  String get forResourceSearch => '用于资源搜索';

  @override
  String get withoutExaKeyBasicSearch => '如不填写 Exa Key 将使用基础搜索功能。';

  @override
  String get configureAiService => '配置 AI 服务';

  @override
  String get chooseAiProvider => '选择一个 AI 提供商并输入 API Key，以启用 AI 驱动的学习功能。';

  @override
  String get getApiKey => '获取 Key';

  @override
  String get enterYourApiKey => '输入您的 API Key';
}
