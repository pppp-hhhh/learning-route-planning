import 'package:flutter/material.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  static final Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appTitle': 'AI Learning Route Planner',
      'home': 'Home',
      'roadmaps': 'Roadmaps',
      'resources': 'Resources',
      'tutor': 'Tutor',
      'profile': 'Profile',
      'settings': 'Settings',
      'darkMode': 'Dark Mode',
      'language': 'Language',
      'notifications': 'Notifications',
      'dataPrivacy': 'Data & Privacy',
      'exportData': 'Export Data',
      'clearData': 'Clear Data',
      'about': 'About',
      'version': 'Version',
      'error': 'Error',
      'retry': 'Retry',
      'goHome': 'Go Home',
      'networkError': 'Network connection failed',
      'serverError': 'Server error',
      'notFound': 'Content not found',
      'unknownError': 'Something went wrong',
      'loading': 'Loading...',
      'save': 'Save',
      'cancel': 'Cancel',
      'confirm': 'Confirm',
      'delete': 'Delete',
      'edit': 'Edit',
      'create': 'Create',
      'search': 'Search',
      'noResults': 'No results found',
      'apiConfiguration': 'API Configuration',
      'claudeApiKey': 'Claude API Key',
      'exaApiKey': 'Exa API Key',
      'selectAiProvider': 'Select AI Provider',
      'howToGetApiKey': 'How to get an API key?',
      'verifyAndContinue': 'Verify & Continue',
      'verifying': 'Verifying...',
      'pleaseEnterApiKey': 'Please enter your API key',
      'apiVerificationFailed': 'API verification failed',
      'apiKeyStoredLocally': 'Your API key is stored locally and never shared.',
      'optional': 'Optional',
      'forResourceSearch': 'for resource search',
      'withoutExaKeyBasicSearch': 'Without Exa key, basic search will be used.',
      'configureAiService': 'Configure AI Service',
      'chooseAiProvider': 'Choose an AI provider and enter your API key to enable AI-powered learning features.',
      'getApiKey': 'Get API Key',
      'enterYourApiKey': 'Enter your API key',
    },
    'zh': {
      'appTitle': 'AI 学习路线规划',
      'home': '首页',
      'roadmaps': '路线图',
      'resources': '资源库',
      'tutor': '导师',
      'profile': '我的',
      'settings': '设置',
      'darkMode': '深色模式',
      'language': '语言',
      'notifications': '通知',
      'dataPrivacy': '数据与隐私',
      'exportData': '导出数据',
      'clearData': '清除数据',
      'about': '关于',
      'version': '版本',
      'error': '错误',
      'retry': '重试',
      'goHome': '返回首页',
      'networkError': '网络连接失败',
      'serverError': '服务器错误',
      'notFound': '内容不存在',
      'unknownError': '出了点问题',
      'loading': '加载中...',
      'save': '保存',
      'cancel': '取消',
      'confirm': '确认',
      'delete': '删除',
      'edit': '编辑',
      'create': '创建',
      'search': '搜索',
      'noResults': '没有找到结果',
      'apiConfiguration': 'API 配置',
      'claudeApiKey': 'Claude API Key',
      'exaApiKey': 'Exa API Key',
      'selectAiProvider': '选择 AI 提供商',
      'howToGetApiKey': '如何获取 API Key？',
      'verifyAndContinue': '验证并继续',
      'verifying': '验证中...',
      'pleaseEnterApiKey': '请输入 API Key',
      'apiVerificationFailed': 'API 验证失败',
      'apiKeyStoredLocally': '您的 API Key 仅存储在本地，不会被分享。',
      'optional': '可选',
      'forResourceSearch': '用于资源搜索',
      'withoutExaKeyBasicSearch': '如不填写 Exa Key 将使用基础搜索功能。',
      'configureAiService': '配置 AI 服务',
      'chooseAiProvider': '选择一个 AI 提供商并输入 API Key，以启用 AI 驱动的学习功能。',
      'getApiKey': '获取 Key',
      'enterYourApiKey': '输入您的 API Key',
    },
  };

  String _t(String key) {
    return _localizedValues[locale.languageCode]?[key] ??
        _localizedValues['en']![key] ??
        key;
  }

  String get appTitle => _t('appTitle');
  String get home => _t('home');
  String get roadmaps => _t('roadmaps');
  String get resources => _t('resources');
  String get tutor => _t('tutor');
  String get profile => _t('profile');
  String get settings => _t('settings');
  String get darkMode => _t('darkMode');
  String get language => _t('language');
  String get notifications => _t('notifications');
  String get dataPrivacy => _t('dataPrivacy');
  String get exportData => _t('exportData');
  String get clearData => _t('clearData');
  String get about => _t('about');
  String get version => _t('version');
  String get error => _t('error');
  String get retry => _t('retry');
  String get goHome => _t('goHome');
  String get networkError => _t('networkError');
  String get serverError => _t('serverError');
  String get notFound => _t('notFound');
  String get unknownError => _t('unknownError');
  String get loading => _t('loading');
  String get save => _t('save');
  String get cancel => _t('cancel');
  String get confirm => _t('confirm');
  String get delete => _t('delete');
  String get edit => _t('edit');
  String get create => _t('create');
  String get search => _t('search');
  String get noResults => _t('noResults');
  String get apiConfiguration => _t('apiConfiguration');
  String get claudeApiKey => _t('claudeApiKey');
  String get exaApiKey => _t('exaApiKey');
  String get selectAiProvider => _t('selectAiProvider');
  String get howToGetApiKey => _t('howToGetApiKey');
  String get verifyAndContinue => _t('verifyAndContinue');
  String get verifying => _t('verifying');
  String get pleaseEnterApiKey => _t('pleaseEnterApiKey');
  String get apiVerificationFailed => _t('apiVerificationFailed');
  String get apiKeyStoredLocally => _t('apiKeyStoredLocally');
  String get optional => _t('optional');
  String get forResourceSearch => _t('forResourceSearch');
  String get withoutExaKeyBasicSearch => _t('withoutExaKeyBasicSearch');
  String get configureAiService => _t('configureAiService');
  String get chooseAiProvider => _t('chooseAiProvider');
  String get getApiKey => _t('getApiKey');
  String get enterYourApiKey => _t('enterYourApiKey');

  String visitToSignUp(String url) {
    if (locale.languageCode == 'zh') {
      return '访问 $url 注册并获取您的 Key。';
    }
    return 'Visit $url to sign up and get your key.';
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    return AppLocalizations(locale);
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}
