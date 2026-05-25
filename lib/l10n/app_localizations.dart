import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('zh'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'AI Learning Route Planner'**
  String get appTitle;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @roadmaps.
  ///
  /// In en, this message translates to:
  /// **'Roadmaps'**
  String get roadmaps;

  /// No description provided for @resources.
  ///
  /// In en, this message translates to:
  /// **'Resources'**
  String get resources;

  /// No description provided for @tutor.
  ///
  /// In en, this message translates to:
  /// **'Tutor'**
  String get tutor;

  /// No description provided for @profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @dataPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Data & Privacy'**
  String get dataPrivacy;

  /// No description provided for @exportData.
  ///
  /// In en, this message translates to:
  /// **'Export Data'**
  String get exportData;

  /// No description provided for @clearData.
  ///
  /// In en, this message translates to:
  /// **'Clear Data'**
  String get clearData;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error'**
  String get error;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get retry;

  /// No description provided for @goHome.
  ///
  /// In en, this message translates to:
  /// **'Go Home'**
  String get goHome;

  /// No description provided for @networkError.
  ///
  /// In en, this message translates to:
  /// **'Network connection failed'**
  String get networkError;

  /// No description provided for @serverError.
  ///
  /// In en, this message translates to:
  /// **'Server error'**
  String get serverError;

  /// No description provided for @notFound.
  ///
  /// In en, this message translates to:
  /// **'Content not found'**
  String get notFound;

  /// No description provided for @unknownError.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong'**
  String get unknownError;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get confirm;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get edit;

  /// No description provided for @create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get create;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResults;

  /// No description provided for @apiConfiguration.
  ///
  /// In en, this message translates to:
  /// **'API Configuration'**
  String get apiConfiguration;

  /// No description provided for @claudeApiKey.
  ///
  /// In en, this message translates to:
  /// **'Claude API Key'**
  String get claudeApiKey;

  /// No description provided for @exaApiKey.
  ///
  /// In en, this message translates to:
  /// **'Exa API Key'**
  String get exaApiKey;

  /// No description provided for @selectAiProvider.
  ///
  /// In en, this message translates to:
  /// **'Select AI Provider'**
  String get selectAiProvider;

  /// No description provided for @howToGetApiKey.
  ///
  /// In en, this message translates to:
  /// **'How to get an API key?'**
  String get howToGetApiKey;

  /// No description provided for @visitToSignUp.
  ///
  /// In en, this message translates to:
  /// **'Visit {url} to sign up and get your key.'**
  String visitToSignUp(String url);

  /// No description provided for @verifyAndContinue.
  ///
  /// In en, this message translates to:
  /// **'Verify & Continue'**
  String get verifyAndContinue;

  /// No description provided for @verifying.
  ///
  /// In en, this message translates to:
  /// **'Verifying...'**
  String get verifying;

  /// No description provided for @pleaseEnterApiKey.
  ///
  /// In en, this message translates to:
  /// **'Please enter your API key'**
  String get pleaseEnterApiKey;

  /// No description provided for @apiVerificationFailed.
  ///
  /// In en, this message translates to:
  /// **'API verification failed'**
  String get apiVerificationFailed;

  /// No description provided for @apiKeyStoredLocally.
  ///
  /// In en, this message translates to:
  /// **'Your API key is stored locally and never shared.'**
  String get apiKeyStoredLocally;

  /// No description provided for @optional.
  ///
  /// In en, this message translates to:
  /// **'Optional'**
  String get optional;

  /// No description provided for @forResourceSearch.
  ///
  /// In en, this message translates to:
  /// **'for resource search'**
  String get forResourceSearch;

  /// No description provided for @withoutExaKeyBasicSearch.
  ///
  /// In en, this message translates to:
  /// **'Without Exa key, basic search will be used.'**
  String get withoutExaKeyBasicSearch;

  /// No description provided for @configureAiService.
  ///
  /// In en, this message translates to:
  /// **'Configure AI Service'**
  String get configureAiService;

  /// No description provided for @chooseAiProvider.
  ///
  /// In en, this message translates to:
  /// **'Choose an AI provider and enter your API key to enable AI-powered learning features.'**
  String get chooseAiProvider;

  /// No description provided for @getApiKey.
  ///
  /// In en, this message translates to:
  /// **'Get API Key'**
  String get getApiKey;

  /// No description provided for @enterYourApiKey.
  ///
  /// In en, this message translates to:
  /// **'Enter your API key'**
  String get enterYourApiKey;

  /// No description provided for @welcomeBack.
  ///
  /// In en, this message translates to:
  /// **'Welcome Back!'**
  String get welcomeBack;

  /// No description provided for @readyToContinue.
  ///
  /// In en, this message translates to:
  /// **'Ready to continue your learning journey?'**
  String get readyToContinue;

  /// No description provided for @weeklyActivity.
  ///
  /// In en, this message translates to:
  /// **'Weekly Activity'**
  String get weeklyActivity;

  /// No description provided for @noResourcesYet.
  ///
  /// In en, this message translates to:
  /// **'No resources yet'**
  String get noResourcesYet;

  /// No description provided for @resourcesWillAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Resources will appear here as you explore your learning roadmaps'**
  String get resourcesWillAppearHere;

  /// No description provided for @searchResources.
  ///
  /// In en, this message translates to:
  /// **'Search Resources'**
  String get searchResources;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @aiTutor.
  ///
  /// In en, this message translates to:
  /// **'AI Tutor'**
  String get aiTutor;

  /// No description provided for @yourAiLearningTutor.
  ///
  /// In en, this message translates to:
  /// **'Your AI Learning Tutor'**
  String get yourAiLearningTutor;

  /// No description provided for @askMeAnything.
  ///
  /// In en, this message translates to:
  /// **'Ask me anything...'**
  String get askMeAnything;

  /// No description provided for @explainNeuralNetworks.
  ///
  /// In en, this message translates to:
  /// **'Explain neural networks'**
  String get explainNeuralNetworks;

  /// No description provided for @quizMeOnPhase.
  ///
  /// In en, this message translates to:
  /// **'Quiz me on Phase 1'**
  String get quizMeOnPhase;

  /// No description provided for @suggestNextTask.
  ///
  /// In en, this message translates to:
  /// **'Suggest next task'**
  String get suggestNextTask;

  /// No description provided for @imHereToHelp.
  ///
  /// In en, this message translates to:
  /// **'I\'m here to help!'**
  String get imHereToHelp;

  /// No description provided for @thatsAGreatQuestion.
  ///
  /// In en, this message translates to:
  /// **'That\'s a great question!'**
  String get thatsAGreatQuestion;

  /// No description provided for @learningTopics.
  ///
  /// In en, this message translates to:
  /// **'Learning: Machine Learning'**
  String get learningTopics;

  /// No description provided for @quizMe.
  ///
  /// In en, this message translates to:
  /// **'Quiz me'**
  String get quizMe;

  /// No description provided for @complete.
  ///
  /// In en, this message translates to:
  /// **'complete'**
  String get complete;

  /// No description provided for @startLearning.
  ///
  /// In en, this message translates to:
  /// **'Start Learning'**
  String get startLearning;

  /// No description provided for @continueLearning.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueLearning;

  /// No description provided for @yourProgress.
  ///
  /// In en, this message translates to:
  /// **'Your Progress'**
  String get yourProgress;

  /// No description provided for @activeRoadmaps.
  ///
  /// In en, this message translates to:
  /// **'Active Roadmaps'**
  String get activeRoadmaps;

  /// No description provided for @dueForReview.
  ///
  /// In en, this message translates to:
  /// **'Due for Review'**
  String get dueForReview;

  /// No description provided for @noRoadmaps.
  ///
  /// In en, this message translates to:
  /// **'No roadmaps yet'**
  String get noRoadmaps;

  /// No description provided for @createFirstRoadmap.
  ///
  /// In en, this message translates to:
  /// **'Create your first roadmap to get started!'**
  String get createFirstRoadmap;

  /// No description provided for @today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get today;

  /// No description provided for @thisWeek.
  ///
  /// In en, this message translates to:
  /// **'This Week'**
  String get thisWeek;

  /// No description provided for @thisMonth.
  ///
  /// In en, this message translates to:
  /// **'This Month'**
  String get thisMonth;

  /// No description provided for @minutesPerDay.
  ///
  /// In en, this message translates to:
  /// **'minutes/day'**
  String get minutesPerDay;

  /// No description provided for @daysPerWeek.
  ///
  /// In en, this message translates to:
  /// **'days/week'**
  String get daysPerWeek;

  /// No description provided for @difficulty.
  ///
  /// In en, this message translates to:
  /// **'Difficulty'**
  String get difficulty;

  /// No description provided for @beginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get beginner;

  /// No description provided for @intermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get intermediate;

  /// No description provided for @advanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get advanced;

  /// No description provided for @generateRoadmap.
  ///
  /// In en, this message translates to:
  /// **'Generate Roadmap'**
  String get generateRoadmap;

  /// No description provided for @generating.
  ///
  /// In en, this message translates to:
  /// **'Generating...'**
  String get generating;

  /// No description provided for @createRoadmap.
  ///
  /// In en, this message translates to:
  /// **'Create Roadmap'**
  String get createRoadmap;

  /// No description provided for @roadmapTitle.
  ///
  /// In en, this message translates to:
  /// **'Roadmap Title'**
  String get roadmapTitle;

  /// No description provided for @roadmapDescription.
  ///
  /// In en, this message translates to:
  /// **'Roadmap Description'**
  String get roadmapDescription;

  /// No description provided for @goal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get goal;

  /// No description provided for @timeframe.
  ///
  /// In en, this message translates to:
  /// **'Timeframe'**
  String get timeframe;

  /// No description provided for @dailyMinutes.
  ///
  /// In en, this message translates to:
  /// **'Daily Minutes'**
  String get dailyMinutes;

  /// No description provided for @flashcards.
  ///
  /// In en, this message translates to:
  /// **'Flashcards'**
  String get flashcards;

  /// No description provided for @reviewFlashcards.
  ///
  /// In en, this message translates to:
  /// **'Review Flashcards'**
  String get reviewFlashcards;

  /// No description provided for @correct.
  ///
  /// In en, this message translates to:
  /// **'Correct'**
  String get correct;

  /// No description provided for @incorrect.
  ///
  /// In en, this message translates to:
  /// **'Incorrect'**
  String get incorrect;

  /// No description provided for @showAnswer.
  ///
  /// In en, this message translates to:
  /// **'Show Answer'**
  String get showAnswer;

  /// No description provided for @nextCard.
  ///
  /// In en, this message translates to:
  /// **'Next Card'**
  String get nextCard;

  /// No description provided for @reviewComplete.
  ///
  /// In en, this message translates to:
  /// **'Review Complete!'**
  String get reviewComplete;

  /// No description provided for @accuracy.
  ///
  /// In en, this message translates to:
  /// **'Accuracy'**
  String get accuracy;

  /// No description provided for @bookmark.
  ///
  /// In en, this message translates to:
  /// **'Bookmark'**
  String get bookmark;

  /// No description provided for @removeBookmark.
  ///
  /// In en, this message translates to:
  /// **'Remove Bookmark'**
  String get removeBookmark;

  /// No description provided for @addResource.
  ///
  /// In en, this message translates to:
  /// **'Add Resource'**
  String get addResource;

  /// No description provided for @resourceUrl.
  ///
  /// In en, this message translates to:
  /// **'Resource URL'**
  String get resourceUrl;

  /// No description provided for @resourceTitle.
  ///
  /// In en, this message translates to:
  /// **'Resource Title'**
  String get resourceTitle;

  /// No description provided for @type.
  ///
  /// In en, this message translates to:
  /// **'Type'**
  String get type;

  /// No description provided for @bookmarked.
  ///
  /// In en, this message translates to:
  /// **'Bookmarked'**
  String get bookmarked;

  /// No description provided for @appearance.
  ///
  /// In en, this message translates to:
  /// **'Appearance'**
  String get appearance;

  /// No description provided for @searchProvider.
  ///
  /// In en, this message translates to:
  /// **'Search Provider'**
  String get searchProvider;

  /// No description provided for @resourceLibrary.
  ///
  /// In en, this message translates to:
  /// **'Resource Library'**
  String get resourceLibrary;

  /// No description provided for @myRoadmaps.
  ///
  /// In en, this message translates to:
  /// **'My Roadmaps'**
  String get myRoadmaps;

  /// No description provided for @newRoadmap.
  ///
  /// In en, this message translates to:
  /// **'New Roadmap'**
  String get newRoadmap;

  /// No description provided for @roadmapNotFound.
  ///
  /// In en, this message translates to:
  /// **'Roadmap not found'**
  String get roadmapNotFound;

  /// No description provided for @learningPhases.
  ///
  /// In en, this message translates to:
  /// **'Learning Phases'**
  String get learningPhases;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get completed;

  /// No description provided for @viewTasks.
  ///
  /// In en, this message translates to:
  /// **'View Tasks'**
  String get viewTasks;

  /// No description provided for @noPhasesYet.
  ///
  /// In en, this message translates to:
  /// **'No phases yet'**
  String get noPhasesYet;

  /// No description provided for @phasesWillAppearHere.
  ///
  /// In en, this message translates to:
  /// **'Phases will appear here once the roadmap is generated'**
  String get phasesWillAppearHere;

  /// No description provided for @aiPoweredRoadmap.
  ///
  /// In en, this message translates to:
  /// **'AI-Powered Roadmap'**
  String get aiPoweredRoadmap;

  /// No description provided for @tellUsYourLearningGoal.
  ///
  /// In en, this message translates to:
  /// **'Tell us your learning goal and our AI will create a personalized learning path'**
  String get tellUsYourLearningGoal;

  /// No description provided for @descriptionOptional.
  ///
  /// In en, this message translates to:
  /// **'Description (optional)'**
  String get descriptionOptional;

  /// No description provided for @briefDescriptionOfYourLearningGoal.
  ///
  /// In en, this message translates to:
  /// **'Brief description of your learning goal'**
  String get briefDescriptionOfYourLearningGoal;

  /// No description provided for @learningGoal.
  ///
  /// In en, this message translates to:
  /// **'Learning Goal'**
  String get learningGoal;

  /// No description provided for @iWantToBecome.
  ///
  /// In en, this message translates to:
  /// **'I want to become a machine learning engineer in 6 months'**
  String get iWantToBecome;

  /// No description provided for @difficultyLevel.
  ///
  /// In en, this message translates to:
  /// **'Difficulty Level'**
  String get difficultyLevel;

  /// No description provided for @dailyCommitment.
  ///
  /// In en, this message translates to:
  /// **'Daily Commitment: {minutes} minutes'**
  String dailyCommitment(int minutes);

  /// No description provided for @generateRoadmapWithAi.
  ///
  /// In en, this message translates to:
  /// **'Generate Roadmap with AI'**
  String get generateRoadmapWithAi;

  /// No description provided for @generatingWithAi.
  ///
  /// In en, this message translates to:
  /// **'Generating with AI...'**
  String get generatingWithAi;

  /// No description provided for @roadmapCreatedWithAi.
  ///
  /// In en, this message translates to:
  /// **'Roadmap created with AI!'**
  String get roadmapCreatedWithAi;

  /// No description provided for @errorSavingRoadmap.
  ///
  /// In en, this message translates to:
  /// **'Error saving roadmap'**
  String get errorSavingRoadmap;

  /// No description provided for @pleaseEnterATitle.
  ///
  /// In en, this message translates to:
  /// **'Please enter a title'**
  String get pleaseEnterATitle;

  /// No description provided for @searchResourcesTitle.
  ///
  /// In en, this message translates to:
  /// **'Search Resources'**
  String get searchResourcesTitle;

  /// No description provided for @learningTopic.
  ///
  /// In en, this message translates to:
  /// **'Learning Topic'**
  String get learningTopic;

  /// No description provided for @learningTopicHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., Python, Machine Learning'**
  String get learningTopicHint;

  /// No description provided for @searchQueryOptional.
  ///
  /// In en, this message translates to:
  /// **'Search Query (optional)'**
  String get searchQueryOptional;

  /// No description provided for @searchQueryHint.
  ///
  /// In en, this message translates to:
  /// **'e.g., free tutorial'**
  String get searchQueryHint;

  /// No description provided for @resourceTypeOptional.
  ///
  /// In en, this message translates to:
  /// **'Resource Type (optional)'**
  String get resourceTypeOptional;

  /// No description provided for @pleaseEnterSearchQuery.
  ///
  /// In en, this message translates to:
  /// **'Please enter a search query or topic'**
  String get pleaseEnterSearchQuery;

  /// No description provided for @noResultsFound.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get noResultsFound;

  /// No description provided for @cloudSync.
  ///
  /// In en, this message translates to:
  /// **'Cloud Sync'**
  String get cloudSync;

  /// No description provided for @syncYourData.
  ///
  /// In en, this message translates to:
  /// **'Sync your data across devices'**
  String get syncYourData;

  /// No description provided for @downloadYourLearningData.
  ///
  /// In en, this message translates to:
  /// **'Download your learning data'**
  String get downloadYourLearningData;

  /// No description provided for @removeAllLocalData.
  ///
  /// In en, this message translates to:
  /// **'Remove all local data'**
  String get removeAllLocalData;

  /// No description provided for @thisWillDeleteAll.
  ///
  /// In en, this message translates to:
  /// **'This will delete all your local roadmaps, progress, and settings. This action cannot be undone.'**
  String get thisWillDeleteAll;

  /// No description provided for @enabled.
  ///
  /// In en, this message translates to:
  /// **'Enabled'**
  String get enabled;

  /// No description provided for @disabled.
  ///
  /// In en, this message translates to:
  /// **'Disabled'**
  String get disabled;

  /// No description provided for @learningReminders.
  ///
  /// In en, this message translates to:
  /// **'Learning Reminders'**
  String get learningReminders;

  /// No description provided for @dailyRemindersToLearn.
  ///
  /// In en, this message translates to:
  /// **'Daily reminders to learn'**
  String get dailyRemindersToLearn;

  /// No description provided for @reviewAlerts.
  ///
  /// In en, this message translates to:
  /// **'Review Alerts'**
  String get reviewAlerts;

  /// No description provided for @flashcardReviewReminders.
  ///
  /// In en, this message translates to:
  /// **'Flashcard review reminders'**
  String get flashcardReviewReminders;

  /// No description provided for @achievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// No description provided for @milestoneCelebrations.
  ///
  /// In en, this message translates to:
  /// **'Milestone celebrations'**
  String get milestoneCelebrations;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @learner.
  ///
  /// In en, this message translates to:
  /// **'Learner'**
  String get learner;

  /// No description provided for @learningSinceToday.
  ///
  /// In en, this message translates to:
  /// **'Learning since today'**
  String get learningSinceToday;

  /// No description provided for @tasksDone.
  ///
  /// In en, this message translates to:
  /// **'Tasks Done'**
  String get tasksDone;

  /// No description provided for @dayStreak.
  ///
  /// In en, this message translates to:
  /// **'Day Streak'**
  String get dayStreak;

  /// No description provided for @apiKeysNotificationsAppearance.
  ///
  /// In en, this message translates to:
  /// **'API keys, notifications, appearance'**
  String get apiKeysNotificationsAppearance;

  /// No description provided for @syncBackup.
  ///
  /// In en, this message translates to:
  /// **'Sync & Backup'**
  String get syncBackup;

  /// No description provided for @cloudSyncSettings.
  ///
  /// In en, this message translates to:
  /// **'Cloud sync settings'**
  String get cloudSyncSettings;

  /// No description provided for @manageYourData.
  ///
  /// In en, this message translates to:
  /// **'Manage your data'**
  String get manageYourData;

  /// No description provided for @helpSupport.
  ///
  /// In en, this message translates to:
  /// **'Help & Support'**
  String get helpSupport;

  /// No description provided for @faqsContactUs.
  ///
  /// In en, this message translates to:
  /// **'FAQs, contact us'**
  String get faqsContactUs;

  /// No description provided for @tavilyApiKey.
  ///
  /// In en, this message translates to:
  /// **'Tavily API Key'**
  String get tavilyApiKey;

  /// No description provided for @serpapiApiKey.
  ///
  /// In en, this message translates to:
  /// **'SerpAPI Key'**
  String get serpapiApiKey;

  /// No description provided for @aiSearch.
  ///
  /// In en, this message translates to:
  /// **'AI Search'**
  String get aiSearch;

  /// No description provided for @googleSearch.
  ///
  /// In en, this message translates to:
  /// **'Google Search'**
  String get googleSearch;

  /// No description provided for @tavilyDescription.
  ///
  /// In en, this message translates to:
  /// **'tavily.com — 1000 requests/month free.'**
  String get tavilyDescription;

  /// No description provided for @serpapiDescription.
  ///
  /// In en, this message translates to:
  /// **'serpapi.com — 100 searches/month free.'**
  String get serpapiDescription;

  /// No description provided for @keySaved.
  ///
  /// In en, this message translates to:
  /// **'{key} saved'**
  String keySaved(String key);

  /// No description provided for @exa.
  ///
  /// In en, this message translates to:
  /// **'Exa'**
  String get exa;

  /// No description provided for @tavily.
  ///
  /// In en, this message translates to:
  /// **'Tavily'**
  String get tavily;

  /// No description provided for @serpapi.
  ///
  /// In en, this message translates to:
  /// **'SerpAPI'**
  String get serpapi;

  /// No description provided for @review.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review;

  /// No description provided for @end.
  ///
  /// In en, this message translates to:
  /// **'End'**
  String get end;

  /// No description provided for @errorLoadingData.
  ///
  /// In en, this message translates to:
  /// **'Error loading data'**
  String get errorLoadingData;

  /// No description provided for @answer.
  ///
  /// In en, this message translates to:
  /// **'Answer'**
  String get answer;

  /// No description provided for @question.
  ///
  /// In en, this message translates to:
  /// **'Question'**
  String get question;

  /// No description provided for @again.
  ///
  /// In en, this message translates to:
  /// **'Again'**
  String get again;

  /// No description provided for @hard.
  ///
  /// In en, this message translates to:
  /// **'Hard'**
  String get hard;

  /// No description provided for @good.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get good;

  /// No description provided for @easy.
  ///
  /// In en, this message translates to:
  /// **'Easy'**
  String get easy;

  /// No description provided for @minShort.
  ///
  /// In en, this message translates to:
  /// **'min'**
  String get minShort;

  /// No description provided for @oneMonth.
  ///
  /// In en, this message translates to:
  /// **'1 month'**
  String get oneMonth;

  /// No description provided for @threeMonths.
  ///
  /// In en, this message translates to:
  /// **'3 months'**
  String get threeMonths;

  /// No description provided for @sixMonths.
  ///
  /// In en, this message translates to:
  /// **'6 months'**
  String get sixMonths;

  /// No description provided for @twelveMonths.
  ///
  /// In en, this message translates to:
  /// **'12 months'**
  String get twelveMonths;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
