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
  String get selectAiProvider => '选择 AI 提供商';

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

  @override
  String get welcomeBack => '欢迎回来！';

  @override
  String get readyToContinue => '准备好继续您的学习之旅了吗？';

  @override
  String get weeklyActivity => '本周活动';

  @override
  String get noResourcesYet => '暂无资源';

  @override
  String get resourcesWillAppearHere => '资源将在这里显示，当您探索学习路线图时';

  @override
  String get searchResources => '搜索资源';

  @override
  String get all => '全部';

  @override
  String get aiTutor => 'AI 导师';

  @override
  String get yourAiLearningTutor => '您的 AI 学习导师';

  @override
  String get askMeAnything => '问我任何问题...';

  @override
  String get explainNeuralNetworks => '解释神经网络';

  @override
  String get quizMeOnPhase => '测试第一阶段';

  @override
  String get suggestNextTask => '建议下一个任务';

  @override
  String get imHereToHelp => '我很乐意帮助您！';

  @override
  String get thatsAGreatQuestion => '这是一个很好的问题！';

  @override
  String get learningTopics => '正在学习：机器学习';

  @override
  String get quizMe => '测试我';

  @override
  String get complete => '完成';

  @override
  String get startLearning => '开始学习';

  @override
  String get continueLearning => '继续';

  @override
  String get yourProgress => '您的进度';

  @override
  String get activeRoadmaps => '进行中的路线图';

  @override
  String get dueForReview => '待复习';

  @override
  String get noRoadmaps => '暂无路线图';

  @override
  String get createFirstRoadmap => '创建您的第一个路线图开始学习！';

  @override
  String get today => '今天';

  @override
  String get thisWeek => '本周';

  @override
  String get thisMonth => '本月';

  @override
  String get minutesPerDay => '分钟/天';

  @override
  String get daysPerWeek => '天/周';

  @override
  String get difficulty => '难度';

  @override
  String get beginner => '初级';

  @override
  String get intermediate => '中级';

  @override
  String get advanced => '高级';

  @override
  String get generateRoadmap => '生成路线图';

  @override
  String get generating => '生成中...';

  @override
  String get createRoadmap => '创建路线图';

  @override
  String get roadmapTitle => '路线图标题';

  @override
  String get roadmapDescription => '路线图描述';

  @override
  String get goal => '目标';

  @override
  String get timeframe => '时间范围';

  @override
  String get dailyMinutes => '每日分钟数';

  @override
  String get flashcards => '闪卡';

  @override
  String get reviewFlashcards => '复习闪卡';

  @override
  String get correct => '正确';

  @override
  String get incorrect => '错误';

  @override
  String get showAnswer => '显示答案';

  @override
  String get nextCard => '下一张';

  @override
  String get reviewComplete => '复习完成！';

  @override
  String get accuracy => '正确率';

  @override
  String get bookmark => '收藏';

  @override
  String get removeBookmark => '取消收藏';

  @override
  String get addResource => '添加资源';

  @override
  String get resourceUrl => '资源链接';

  @override
  String get resourceTitle => '资源标题';

  @override
  String get type => '类型';

  @override
  String get bookmarked => '已收藏';

  @override
  String get appearance => '外观';

  @override
  String get searchProvider => '搜索引擎';

  @override
  String get resourceLibrary => '资源库';

  @override
  String get myRoadmaps => '我的路线图';

  @override
  String get newRoadmap => '新建路线图';

  @override
  String get roadmapNotFound => '路线图不存在';

  @override
  String get learningPhases => '学习阶段';

  @override
  String get progress => '进度';

  @override
  String get completed => '已完成';

  @override
  String get viewTasks => '查看任务';

  @override
  String get noPhasesYet => '暂无阶段';

  @override
  String get phasesWillAppearHere => '路线图生成后阶段将显示在这里';

  @override
  String get aiPoweredRoadmap => 'AI 驱动路线图';

  @override
  String get tellUsYourLearningGoal => '告诉我们您的学习目标，AI 将为您创建个性化学习路径';

  @override
  String get descriptionOptional => '描述（可选）';

  @override
  String get briefDescriptionOfYourLearningGoal => '简要描述您的学习目标';

  @override
  String get learningGoal => '学习目标';

  @override
  String get iWantToBecome => '我想在6个月内成为机器学习工程师';

  @override
  String get difficultyLevel => '难度级别';

  @override
  String dailyCommitment(int minutes) {
    return '每日学习时间：$minutes 分钟';
  }

  @override
  String get generateRoadmapWithAi => '使用 AI 生成路线图';

  @override
  String get generatingWithAi => '正在使用 AI 生成...';

  @override
  String get roadmapCreatedWithAi => '路线图已通过 AI 创建！';

  @override
  String get errorSavingRoadmap => '保存路线图时出错';

  @override
  String get pleaseEnterATitle => '请输入标题';

  @override
  String get searchResourcesTitle => '搜索资源';

  @override
  String get learningTopic => '学习主题';

  @override
  String get learningTopicHint => '例如：Python、机器学习';

  @override
  String get searchQueryOptional => '搜索词（可选）';

  @override
  String get searchQueryHint => '例如：免费教程';

  @override
  String get resourceTypeOptional => '资源类型（可选）';

  @override
  String get pleaseEnterSearchQuery => '请输入搜索词或主题';

  @override
  String get noResultsFound => '没有找到结果';

  @override
  String get cloudSync => '云同步';

  @override
  String get syncYourData => '跨设备同步数据';

  @override
  String get downloadYourLearningData => '下载您的学习数据';

  @override
  String get removeAllLocalData => '清除所有本地数据';

  @override
  String get thisWillDeleteAll => '这将删除您所有的本地路线图、进度和设置。此操作无法撤销。';

  @override
  String get enabled => '已启用';

  @override
  String get disabled => '已禁用';

  @override
  String get learningReminders => '学习提醒';

  @override
  String get dailyRemindersToLearn => '每日学习提醒';

  @override
  String get reviewAlerts => '复习提醒';

  @override
  String get flashcardReviewReminders => '闪卡复习提醒';

  @override
  String get achievements => '成就';

  @override
  String get milestoneCelebrations => '里程碑庆祝';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get termsOfService => '服务条款';

  @override
  String get learner => '学习者';

  @override
  String get learningSinceToday => '从今天开始学习';

  @override
  String get tasksDone => '已完成任务';

  @override
  String get dayStreak => '连续天数';

  @override
  String get apiKeysNotificationsAppearance => 'API 密钥、通知、外观';

  @override
  String get syncBackup => '同步与备份';

  @override
  String get cloudSyncSettings => '云同步设置';

  @override
  String get manageYourData => '管理您的数据';

  @override
  String get helpSupport => '帮助与支持';

  @override
  String get faqsContactUs => '常见问题、联系我们';

  @override
  String get tavilyApiKey => 'Tavily API Key';

  @override
  String get serpapiApiKey => 'SerpAPI Key';

  @override
  String get aiSearch => 'AI 搜索';

  @override
  String get googleSearch => 'Google 搜索';

  @override
  String get tavilyDescription => 'tavily.com — 每月 1000 次免费请求';

  @override
  String get serpapiDescription => 'serpapi.com — 每月 100 次免费搜索';

  @override
  String keySaved(String key) {
    return '$key 已保存';
  }

  @override
  String get exa => 'Exa';

  @override
  String get tavily => 'Tavily';

  @override
  String get serpapi => 'SerpAPI';

  @override
  String get review => '复习';

  @override
  String get end => '结束';

  @override
  String get errorLoadingData => '数据加载失败';

  @override
  String get answer => '答案';

  @override
  String get question => '问题';

  @override
  String get again => '重来';

  @override
  String get hard => '难';

  @override
  String get good => '好';

  @override
  String get easy => '简单';

  @override
  String get minShort => '分钟';

  @override
  String get oneMonth => '1 个月';

  @override
  String get threeMonths => '3 个月';

  @override
  String get sixMonths => '6 个月';

  @override
  String get twelveMonths => '12 个月';
}
