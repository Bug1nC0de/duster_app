// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get signin => 'Duster Sign In';

  @override
  String get email => 'Email Address';

  @override
  String get enterEmail => 'Enter Email';

  @override
  String get password => 'Password';

  @override
  String get passwordError => 'Passwords do not match';

  @override
  String get submit => 'Submit';

  @override
  String get newHere => 'New Here?';

  @override
  String get resetPassword => 'Reset Password';

  @override
  String get welcome => 'Welcome';

  @override
  String get yourInfo => 'Your Info';

  @override
  String get upload => 'Documents';

  @override
  String get read => 'PLEASE READ CAREFULLY';

  @override
  String get requiredDocs => 'We will need the following documentation to complete your application';

  @override
  String get beforeStart => 'Make sure you have ALL documents available before you start your application';

  @override
  String get line1 => 'If you upload the wrong documentation your application wil be';

  @override
  String get line2 => 'We only accept png && jpeg && pdf';

  @override
  String get line3 => 'Before you continue please confirm:';

  @override
  String get reject => 'REJECTED!';

  @override
  String get confirmDocs => 'You have all the documentation to complete the application';

  @override
  String get confirmCriminal => 'You do not have a criminal record';

  @override
  String confirmLegal(Object country) {
    return 'You are legally allowed to work in $country';
  }

  @override
  String get understandIC => 'You understand that you are an independant contractor';

  @override
  String get policyAgree => 'You Agree to our terms & privacy policy';

  @override
  String get tickPolicy => 'By ticking this box you agree to our';

  @override
  String get tc => 'terms of service';

  @override
  String get saID => 'ID Card or Book';

  @override
  String get idDoc => 'Passport/ Birth Certificate';

  @override
  String get idError => 'Please enter a valid identification number';

  @override
  String get addressProof => 'Proof of address';

  @override
  String get bankLetter => 'Bank letter';

  @override
  String get proPic => 'Profile Picture';

  @override
  String workPermit(Object residence) {
    return '$residence permit (If foreign national)';
  }

  @override
  String get dbsLetter => 'DBS Letter';

  @override
  String get rtw => 'Right to Work (If foreign national)';

  @override
  String fromHere(Object country) {
    return 'Are you a $country?';
  }

  @override
  String local(Object country) {
    return '$country';
  }

  @override
  String get foreign => 'Foreign National';

  @override
  String get foreignOrLocal => 'Are you foreign or local?';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get maleOrFemale => 'Are you male or female';

  @override
  String get gender => 'Gender';

  @override
  String get uploadFiles => 'Upload files to complete your application';

  @override
  String get register => 'Register';

  @override
  String get name => 'Name';

  @override
  String get enterName => 'Enter Your Name';

  @override
  String get surname => 'Surname';

  @override
  String get enterSurname => 'Enter Your Surname';

  @override
  String get cellphone => 'Mobile';

  @override
  String get enterCell => 'Enter Your Mobile #';

  @override
  String idNum(Object id) {
    return '$id Number';
  }

  @override
  String enterIdNum(Object id) {
    return 'Enter Your $id Number';
  }

  @override
  String get confirmPassword => 'Confirm Password';

  @override
  String get nameError => 'Name Cannot be blank';

  @override
  String get surnameError => 'Surname cannot be blank';

  @override
  String get emailError => 'Please enter a valid email address';

  @override
  String get cellPhoneError => 'Please enter a valid mobile number';

  @override
  String get addressError => 'Address cannot be blank';

  @override
  String get haveAccount => 'Already have an account?';

  @override
  String get enterPostCode => 'Enter Post Code';

  @override
  String get findPostCode => 'Find Post Code';

  @override
  String get changePostCode => 'Change Post Code';

  @override
  String get ukPostCode => 'Please enter your UK postcode';

  @override
  String get dePostCode => 'Please enter German Post Code';

  @override
  String get noPostCode => 'Please enter Norwegian Post Code';

  @override
  String get enterAddressDetails => 'Click to enter address details';

  @override
  String get aboutAddress => 'Please select address';

  @override
  String get saveAdr => 'Save Address';

  @override
  String get typeCode => 'Type Your Code';

  @override
  String get typeAddress => 'Please type your address/ start with street number';

  @override
  String get enterSAaddress => 'Please enter South African addresss';

  @override
  String get enterUKPostCode => 'Please enter your UK Post Code';

  @override
  String get enterDEPostCode => 'Please enter German Post Code';

  @override
  String get enterNOPostCode => 'Please enter Norwegian Post Code';

  @override
  String get changeRegion => 'Change Region';

  @override
  String get compApp => 'Complete Application';

  @override
  String get verifyEmail => 'Please verify your email address;';

  @override
  String checkEmail(Object email) {
    return 'We have sent you an email to $email. please check your spam just in case. If you have not received an email please resend verification email.';
  }

  @override
  String get resendEmail => 'Re-send email verification';

  @override
  String get verifyingEmail => 'Please wait while we verify your email...';

  @override
  String get creatingAccount => 'Please wait while we create your account...';

  @override
  String get changeAddress => 'Change Address';

  @override
  String get currentAddress => 'Current Address';

  @override
  String get pleaseSelectCountry => 'Please select country';

  @override
  String get sA => 'South Africa';

  @override
  String get uK => 'United Kingdom';

  @override
  String get nO => 'Norway';

  @override
  String get dE => 'Germany';

  @override
  String get enterEmailToReset => 'Please enter your email to reset your password';

  @override
  String get submitting => 'Submitting...';

  @override
  String get sweeping => 'Sweeping up...';

  @override
  String get backToLogin => 'Back to Login';

  @override
  String get passwordTooShort => 'Please make sure your password is longer than 7 characters';
}
