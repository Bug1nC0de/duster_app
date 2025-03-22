import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_no.dart';

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
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('no')
  ];

  /// sign in
  ///
  /// In en, this message translates to:
  /// **'Duster Sign In'**
  String get signin;

  /// email
  ///
  /// In en, this message translates to:
  /// **'Email Address'**
  String get email;

  /// Enter Email
  ///
  /// In en, this message translates to:
  /// **'Enter Email'**
  String get enterEmail;

  /// password
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// Password mismatch
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordError;

  /// submit
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get submit;

  /// new here
  ///
  /// In en, this message translates to:
  /// **'New Here?'**
  String get newHere;

  /// Reset Password
  ///
  /// In en, this message translates to:
  /// **'Reset Password'**
  String get resetPassword;

  /// Welcome
  ///
  /// In en, this message translates to:
  /// **'Welcome'**
  String get welcome;

  /// Your Info
  ///
  /// In en, this message translates to:
  /// **'Your Info'**
  String get yourInfo;

  /// Docs
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get upload;

  /// Read
  ///
  /// In en, this message translates to:
  /// **'PLEASE READ CAREFULLY'**
  String get read;

  /// Required docs
  ///
  /// In en, this message translates to:
  /// **'We will need the following documentation to complete your application'**
  String get requiredDocs;

  /// Before you start
  ///
  /// In en, this message translates to:
  /// **'Make sure you have ALL documents available before you start your application'**
  String get beforeStart;

  /// Line 1
  ///
  /// In en, this message translates to:
  /// **'If you upload the wrong documentation your application wil be'**
  String get line1;

  /// Line 2
  ///
  /// In en, this message translates to:
  /// **'We only accept png && jpeg && pdf'**
  String get line2;

  /// Line 3
  ///
  /// In en, this message translates to:
  /// **'Before you continue please confirm:'**
  String get line3;

  /// Rejected
  ///
  /// In en, this message translates to:
  /// **'REJECTED!'**
  String get reject;

  /// Confirm docs
  ///
  /// In en, this message translates to:
  /// **'You have all the documentation to complete the application'**
  String get confirmDocs;

  /// Criminal Record
  ///
  /// In en, this message translates to:
  /// **'You do not have a criminal record'**
  String get confirmCriminal;

  /// Confirm Legal
  ///
  /// In en, this message translates to:
  /// **'You are legally allowed to work in {country}'**
  String confirmLegal(Object country);

  /// Understand IC
  ///
  /// In en, this message translates to:
  /// **'You understand that you are an independant contractor'**
  String get understandIC;

  /// Policy Agree
  ///
  /// In en, this message translates to:
  /// **'You Agree to our terms & privacy policy'**
  String get policyAgree;

  /// Tick Policy
  ///
  /// In en, this message translates to:
  /// **'By ticking this box you agree to our'**
  String get tickPolicy;

  /// TC
  ///
  /// In en, this message translates to:
  /// **'terms of service'**
  String get tc;

  /// Id Card
  ///
  /// In en, this message translates to:
  /// **'ID Card or Book'**
  String get saID;

  /// ID Doc
  ///
  /// In en, this message translates to:
  /// **'Passport/ Birth Certificate'**
  String get idDoc;

  /// ID Error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid identification number'**
  String get idError;

  /// Address Proof
  ///
  /// In en, this message translates to:
  /// **'Proof of address'**
  String get addressProof;

  /// Bank Letter
  ///
  /// In en, this message translates to:
  /// **'Bank letter'**
  String get bankLetter;

  /// Pro Pic
  ///
  /// In en, this message translates to:
  /// **'Profile Picture'**
  String get proPic;

  /// Work Permit
  ///
  /// In en, this message translates to:
  /// **'{residence} permit (If foreign national)'**
  String workPermit(Object residence);

  /// DBS Letter
  ///
  /// In en, this message translates to:
  /// **'DBS Letter'**
  String get dbsLetter;

  /// RTW
  ///
  /// In en, this message translates to:
  /// **'Right to Work (If foreign national)'**
  String get rtw;

  /// Form Here
  ///
  /// In en, this message translates to:
  /// **'Are you a {country}?'**
  String fromHere(Object country);

  /// Local
  ///
  /// In en, this message translates to:
  /// **'{country}'**
  String local(Object country);

  /// Foreign
  ///
  /// In en, this message translates to:
  /// **'Foreign National'**
  String get foreign;

  /// FORF
  ///
  /// In en, this message translates to:
  /// **'Are you foreign or local?'**
  String get foreignOrLocal;

  /// Male
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// Female
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// MORF
  ///
  /// In en, this message translates to:
  /// **'Are you male or female'**
  String get maleOrFemale;

  /// Gender
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get gender;

  /// Upload Files
  ///
  /// In en, this message translates to:
  /// **'Upload files to complete your application'**
  String get uploadFiles;

  /// Register
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// Name
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// Enter Name
  ///
  /// In en, this message translates to:
  /// **'Enter Your Name'**
  String get enterName;

  /// Surname
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get surname;

  /// Enter Surname
  ///
  /// In en, this message translates to:
  /// **'Enter Your Surname'**
  String get enterSurname;

  /// Mobile
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get cellphone;

  /// Enter Cell
  ///
  /// In en, this message translates to:
  /// **'Enter Your Mobile #'**
  String get enterCell;

  /// ID Num
  ///
  /// In en, this message translates to:
  /// **'{id} Number'**
  String idNum(Object id);

  /// Entert ID
  ///
  /// In en, this message translates to:
  /// **'Enter Your {id} Number'**
  String enterIdNum(Object id);

  /// Confirm Password
  ///
  /// In en, this message translates to:
  /// **'Confirm Password'**
  String get confirmPassword;

  /// Name Error
  ///
  /// In en, this message translates to:
  /// **'Name Cannot be blank'**
  String get nameError;

  /// Enter Surname
  ///
  /// In en, this message translates to:
  /// **'Surname cannot be blank'**
  String get surnameError;

  /// Email Error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email address'**
  String get emailError;

  /// Cellphone Error
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid mobile number'**
  String get cellPhoneError;

  /// Address Error
  ///
  /// In en, this message translates to:
  /// **'Address cannot be blank'**
  String get addressError;

  /// Have Account
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get haveAccount;

  /// Enter Postcode
  ///
  /// In en, this message translates to:
  /// **'Enter Post Code'**
  String get enterPostCode;

  /// Find Post Code
  ///
  /// In en, this message translates to:
  /// **'Find Post Code'**
  String get findPostCode;

  /// Change Postcode
  ///
  /// In en, this message translates to:
  /// **'Change Post Code'**
  String get changePostCode;

  /// UK Post Code
  ///
  /// In en, this message translates to:
  /// **'Please enter your UK postcode'**
  String get ukPostCode;

  /// German PsotCode
  ///
  /// In en, this message translates to:
  /// **'Please enter German Post Code'**
  String get dePostCode;

  /// Norway Postcode
  ///
  /// In en, this message translates to:
  /// **'Please enter Norwegian Post Code'**
  String get noPostCode;

  /// Address Details
  ///
  /// In en, this message translates to:
  /// **'Click to enter address details'**
  String get enterAddressDetails;

  /// About Address
  ///
  /// In en, this message translates to:
  /// **'Please select address'**
  String get aboutAddress;

  /// Save Address
  ///
  /// In en, this message translates to:
  /// **'Save Address'**
  String get saveAdr;

  /// Type Code
  ///
  /// In en, this message translates to:
  /// **'Type Your Code'**
  String get typeCode;

  /// Type Address
  ///
  /// In en, this message translates to:
  /// **'Please type your address/ start with street number'**
  String get typeAddress;

  /// SA Address
  ///
  /// In en, this message translates to:
  /// **'Please enter South African addresss'**
  String get enterSAaddress;

  /// UK Postcode
  ///
  /// In en, this message translates to:
  /// **'Please enter your UK Post Code'**
  String get enterUKPostCode;

  /// German Post code
  ///
  /// In en, this message translates to:
  /// **'Please enter German Post Code'**
  String get enterDEPostCode;

  /// Norway Postcode
  ///
  /// In en, this message translates to:
  /// **'Please enter Norwegian Post Code'**
  String get enterNOPostCode;

  /// Change Region
  ///
  /// In en, this message translates to:
  /// **'Change Region'**
  String get changeRegion;

  /// Complete App
  ///
  /// In en, this message translates to:
  /// **'Complete Application'**
  String get compApp;

  /// Verify Email
  ///
  /// In en, this message translates to:
  /// **'Please verify your email address;'**
  String get verifyEmail;

  /// Check email
  ///
  /// In en, this message translates to:
  /// **'We have sent you an email to {email}. please check your spam just in case. If you have not received an email please resend verification email.'**
  String checkEmail(Object email);

  /// Re-send email
  ///
  /// In en, this message translates to:
  /// **'Re-send email verification'**
  String get resendEmail;

  /// Verifing
  ///
  /// In en, this message translates to:
  /// **'Please wait while we verify your email...'**
  String get verifyingEmail;

  /// creating
  ///
  /// In en, this message translates to:
  /// **'Please wait while we create your account...'**
  String get creatingAccount;

  /// changeg Address
  ///
  /// In en, this message translates to:
  /// **'Change Address'**
  String get changeAddress;

  /// Current Address
  ///
  /// In en, this message translates to:
  /// **'Current Address'**
  String get currentAddress;

  /// Prompt to select a country.
  ///
  /// In en, this message translates to:
  /// **'Please select country'**
  String get pleaseSelectCountry;

  /// South Africa
  ///
  /// In en, this message translates to:
  /// **'South Africa'**
  String get sA;

  /// United Kingdom
  ///
  /// In en, this message translates to:
  /// **'United Kingdom'**
  String get uK;

  /// Norway
  ///
  /// In en, this message translates to:
  /// **'Norway'**
  String get nO;

  /// Germany
  ///
  /// In en, this message translates to:
  /// **'Germany'**
  String get dE;

  /// Please enter your email to reset your password
  ///
  /// In en, this message translates to:
  /// **'Please enter your email to reset your password'**
  String get enterEmailToReset;

  /// Message displayed when a form is being submitted.
  ///
  /// In en, this message translates to:
  /// **'Submitting...'**
  String get submitting;

  /// Sweeping
  ///
  /// In en, this message translates to:
  /// **'Sweeping up...'**
  String get sweeping;

  /// Button text to navigate back to the login page.
  ///
  /// In en, this message translates to:
  /// **'Back to Login'**
  String get backToLogin;

  /// Validation message when password length is insufficient.
  ///
  /// In en, this message translates to:
  /// **'Please make sure your password is longer than 7 characters'**
  String get passwordTooShort;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['de', 'en', 'no'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de': return AppLocalizationsDe();
    case 'en': return AppLocalizationsEn();
    case 'no': return AppLocalizationsNo();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
