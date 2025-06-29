import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

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
    Locale('de'),
    Locale('en'),
    Locale('fr')
  ];

  /// English
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get locale;

  /// The flutter folders structure
  ///
  /// In en, this message translates to:
  /// **'Flutter folders Structure'**
  String get appName;

  /// The current language
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get language;

  /// Choose your product
  ///
  /// In en, this message translates to:
  /// **'Choose your product'**
  String get onboardingTitle1;

  /// Select payment method
  ///
  /// In en, this message translates to:
  /// **'Select payment method'**
  String get onboardingTitle2;

  /// Deliver at your door step
  ///
  /// In en, this message translates to:
  /// **'Deliver at your door step'**
  String get onboardingTitle3;

  /// Welcome to the word...
  ///
  /// In en, this message translates to:
  /// **'Welcome to a world of limitless choices - your perfect product awaits!  '**
  String get onboardingSubTitle1;

  /// For seamless transaction...
  ///
  /// In en, this message translates to:
  /// **'For seamless transaction choose your payment path - your convenience, our priority!'**
  String get onboardingSubTitle2;

  /// From our doorstep to your...
  ///
  /// In en, this message translates to:
  /// **'From our doorstep to yours - swift, secure and contactless delivery '**
  String get onboardingSubTitle3;

  /// Skip
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get btnSkip;

  /// Welcome back,
  ///
  /// In en, this message translates to:
  /// **'Welcome back,'**
  String get loginTitle;

  /// Welcome
  ///
  /// In en, this message translates to:
  /// **'Discover limited choices and unmatched conveniences.'**
  String get loginSubTitle;

  /// Email Address
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get enterEmail;

  /// Password
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get enterPassword;

  /// Remember me
  ///
  /// In en, this message translates to:
  /// **'Remember me'**
  String get rememberMe;

  /// Forget password ?
  ///
  /// In en, this message translates to:
  /// **'Forget password ?'**
  String get forgotPassword;

  /// Sign in
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signIn;

  /// Create a Account
  ///
  /// In en, this message translates to:
  /// **'Create a Account'**
  String get doYouHaveAnAccount;

  /// Or sign in with
  ///
  /// In en, this message translates to:
  /// **'Or sign in with'**
  String get orSignInWith;

  /// Let's create your account
  ///
  /// In en, this message translates to:
  /// **'Let\'s create your account'**
  String get createAAccount;

  /// First Name
  ///
  /// In en, this message translates to:
  /// **'First Name'**
  String get firstname;

  /// Last Name
  ///
  /// In en, this message translates to:
  /// **'Last Name'**
  String get lastname;

  /// username
  ///
  /// In en, this message translates to:
  /// **'username'**
  String get username;

  /// Phone number
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get phoneNumber;

  /// I agree to
  ///
  /// In en, this message translates to:
  /// **'I agree to'**
  String get iAgreeTo;

  /// privacy police
  ///
  /// In en, this message translates to:
  /// **'privacy police'**
  String get privatePolice;

  /// and
  ///
  /// In en, this message translates to:
  /// **'and'**
  String get abvAnd;

  /// or
  ///
  /// In en, this message translates to:
  /// **'or'**
  String get abvOr;

  /// terms of use
  ///
  /// In en, this message translates to:
  /// **'terms of use'**
  String get termsOfUse;

  /// Create account
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get createAccount;

  /// Or signup with
  ///
  /// In en, this message translates to:
  /// **'Or signup with'**
  String get orSignUpWith;

  /// Verifier your Email address
  ///
  /// In en, this message translates to:
  /// **'Verifier your Email address'**
  String get confirmEmail;

  /// Congratulation! Your account awaits: verifier your Email to start shopping and experiences
  ///
  /// In en, this message translates to:
  /// **'Congratulation! Your account awaits: verifier your Email to start shopping and experiences'**
  String get confirmEmailSubTitle;

  /// Didn't receive your Email? Check your span or resent it.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive your Email? Check your span or resent it.'**
  String get emailNotReceivedMessage;

  /// Continue
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get btnContinue;

  /// Resend Email
  ///
  /// In en, this message translates to:
  /// **'Resend Email'**
  String get resendEmail;

  /// Your account successfully created!
  ///
  /// In en, this message translates to:
  /// **'Your account successfully created!'**
  String get yourAccountCreatedTitle;

  /// Welcome to you ultimated shopping destination. Your account is created. unleash the joy of seamless online shopping!
  ///
  /// In en, this message translates to:
  /// **'Welcome to you ultimated shopping destination. Your account is created. unleash the joy of seamless online shopping!'**
  String get yourAccountCreatedSubTitle;

  /// Forget password
  ///
  /// In en, this message translates to:
  /// **'Forget password'**
  String get forgotPasswordTitle;

  /// Forget password
  ///
  /// In en, this message translates to:
  /// **'Don\'t worry sometimes people can forget too. Enter your email and we will send you the reset link'**
  String get forgotPasswordSubtitle;

  /// Submit
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// Password reset Email send
  ///
  /// In en, this message translates to:
  /// **'Password reset Email send'**
  String get passwordResetEmailSend;

  /// Your account security is our priority! We#ve send you a security link to safely change your password and keep your account protected.
  ///
  /// In en, this message translates to:
  /// **'Your account security is our priority! We#ve send you a security link to safely change your password and keep your account protected.'**
  String get passwordResetEmailSendSubtitle;

  /// Done
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// Home
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// Store
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get store;

  /// Favorite
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// Profile
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get profile;

  /// Good day for shopping
  ///
  /// In en, this message translates to:
  /// **'Good day for shopping'**
  String get homeAppBarTitle;

  /// Search in store
  ///
  /// In en, this message translates to:
  /// **'Search in store'**
  String get homeSearchTitle;

  /// Popular categories
  ///
  /// In en, this message translates to:
  /// **'Popular categories'**
  String get homeCategoriesTitle;

  /// Store
  ///
  /// In en, this message translates to:
  /// **'Store'**
  String get storeTitle;

  /// Search in store
  ///
  /// In en, this message translates to:
  /// **'Search in store'**
  String get storeSearchTitle;

  /// Featured brands
  ///
  /// In en, this message translates to:
  /// **'Featured brands'**
  String get storeFeaturedBrandsTitle;

  /// No description provided for @fieldRequired.
  ///
  /// In en, this message translates to:
  /// **'{field} is required.'**
  String fieldRequired(Object field);

  /// No description provided for @emailRequired.
  ///
  /// In en, this message translates to:
  /// **'Email is required.'**
  String get emailRequired;

  /// No description provided for @invalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Invalid email address.'**
  String get invalidEmail;

  /// No description provided for @phoneRequired.
  ///
  /// In en, this message translates to:
  /// **'Phone number is required.'**
  String get phoneRequired;

  /// No description provided for @invalidPhone.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number format (10 digits required).'**
  String get invalidPhone;

  /// No description provided for @passwordRequired.
  ///
  /// In en, this message translates to:
  /// **'Password is required.'**
  String get passwordRequired;

  /// No description provided for @passwordTooShort.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters long.'**
  String get passwordTooShort;

  /// No description provided for @passwordNeedsUppercase.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one uppercase letter.'**
  String get passwordNeedsUppercase;

  /// No description provided for @passwordNeedsNumber.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one number.'**
  String get passwordNeedsNumber;

  /// No description provided for @passwordNeedsSpecial.
  ///
  /// In en, this message translates to:
  /// **'Password must contain at least one special character.'**
  String get passwordNeedsSpecial;
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
      <String>['de', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
