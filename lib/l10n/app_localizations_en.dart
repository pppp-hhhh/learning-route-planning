// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'AI Learning Route Planner';

  @override
  String get home => 'Home';

  @override
  String get roadmaps => 'Roadmaps';

  @override
  String get resources => 'Resources';

  @override
  String get tutor => 'Tutor';

  @override
  String get profile => 'Profile';

  @override
  String get settings => 'Settings';

  @override
  String get darkMode => 'Dark Mode';

  @override
  String get language => 'Language';

  @override
  String get notifications => 'Notifications';

  @override
  String get dataPrivacy => 'Data & Privacy';

  @override
  String get exportData => 'Export Data';

  @override
  String get clearData => 'Clear Data';

  @override
  String get about => 'About';

  @override
  String get version => 'Version';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Retry';

  @override
  String get goHome => 'Go Home';

  @override
  String get networkError => 'Network connection failed';

  @override
  String get serverError => 'Server error';

  @override
  String get notFound => 'Content not found';

  @override
  String get unknownError => 'Something went wrong';

  @override
  String get loading => 'Loading...';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get delete => 'Delete';

  @override
  String get edit => 'Edit';

  @override
  String get create => 'Create';

  @override
  String get search => 'Search';

  @override
  String get noResults => 'No results found';

  @override
  String get apiConfiguration => 'API Configuration';

  @override
  String get claudeApiKey => 'Claude API Key';

  @override
  String get exaApiKey => 'Exa API Key';

  @override
  String get searchProvider => 'Search Provider';

  @override
  String get selectAiProvider => 'Select AI Provider';

  @override
  String get selectSearchProvider => 'Select Search Provider';

  @override
  String get howToGetApiKey => 'How to get an API key?';

  @override
  String visitToSignUp(String url) {
    return 'Visit $url to sign up and get your key.';
  }

  @override
  String get verifyAndContinue => 'Verify & Continue';

  @override
  String get verifying => 'Verifying...';

  @override
  String get pleaseEnterApiKey => 'Please enter your API key';

  @override
  String get apiVerificationFailed => 'API verification failed';

  @override
  String get apiKeyStoredLocally => 'Your API key is stored locally and never shared.';

  @override
  String get optional => 'Optional';

  @override
  String get forResourceSearch => 'for resource search';

  @override
  String get withoutExaKeyBasicSearch => 'Without Exa key, basic search will be used.';

  @override
  String get configureAiService => 'Configure AI Service';

  @override
  String get chooseAiProvider => 'Choose an AI provider and enter your API key to enable AI-powered learning features.';

  @override
  String get getApiKey => 'Get API Key';

  @override
  String get enterYourApiKey => 'Enter your API key';
}
