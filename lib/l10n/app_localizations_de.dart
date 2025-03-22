// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get signin => 'Duster Anmelden';

  @override
  String get email => 'E-Mail-Adresse';

  @override
  String get enterEmail => 'Email eingeben';

  @override
  String get password => 'Passwort';

  @override
  String get passwordError => 'Passwörter stimmen nicht überein';

  @override
  String get submit => 'Einreichen';

  @override
  String get newHere => 'Neu hier?';

  @override
  String get resetPassword => 'Passwort zurücksetzen';

  @override
  String get welcome => 'Willkommen';

  @override
  String get yourInfo => 'Ihre Informationen';

  @override
  String get upload => 'Dokumente';

  @override
  String get read => 'Bitte sorgfältig lesen';

  @override
  String get requiredDocs => 'Wir benötigen die folgenden Dokumente, um Ihre Bewerbung abzuschließen.';

  @override
  String get beforeStart => 'Stellen Sie sicher, dass Sie ALLE Dokumente verfügbar haben, bevor Sie Ihre Bewerbung starten.';

  @override
  String get line1 => 'Wenn Sie die falsche Dokumentation hochladen, wird Ihre Bewerbung';

  @override
  String get line2 => 'Wir akzeptieren nur png, jpeg und pdf';

  @override
  String get line3 => 'Bevor Sie fortfahren, bitte bestätigen Sie:';

  @override
  String get reject => 'ABGELEHNT!';

  @override
  String get confirmDocs => 'Sie haben alle Dokumente, um die Bewerbung abzuschließen';

  @override
  String get confirmCriminal => 'Sie haben kein Strafregister';

  @override
  String confirmLegal(Object country) {
    return 'Sie sind berechtigt, in Deutschland zu arbeiten';
  }

  @override
  String get understandIC => 'Sie verstehen, dass Sie ein unabhängiger Auftragnehmer sind';

  @override
  String get policyAgree => 'Sie stimmen unseren Nutzungsbedingungen und Datenschutzrichtlinien zu';

  @override
  String get tickPolicy => 'Indem Sie dieses Kästchen ankreuzen, stimmen Sie unseren';

  @override
  String get tc => 'Nutzungsbedingungen';

  @override
  String get saID => 'ID Card or Book';

  @override
  String get idDoc => 'Personalausweis/Reisepass';

  @override
  String get idError => 'Bitte geben Sie eine gültige Ausweis- oder Reisepassnummer ein';

  @override
  String get addressProof => 'Nachweis der Adresse';

  @override
  String get bankLetter => 'Bankschreiben';

  @override
  String get proPic => 'Profilbild';

  @override
  String workPermit(Object residence) {
    return 'Aufenthaltserlaubnis (für ausländische Staatsangehörige)';
  }

  @override
  String get dbsLetter => 'Führungszeugnis';

  @override
  String get rtw => 'Arbeitserlaubnis (für ausländische Staatsangehörige)';

  @override
  String fromHere(Object country) {
    return 'Sind Sie Deutscher/Sind Sie Deutsche?';
  }

  @override
  String local(Object country) {
    return 'Deutschland';
  }

  @override
  String get foreign => 'Ausländische Nation';

  @override
  String get foreignOrLocal => 'Sind Sie ausländisch oder einheimisch?';

  @override
  String get male => 'Männlich';

  @override
  String get female => 'Weiblich';

  @override
  String get maleOrFemale => 'Sind Sie männlich oder weiblich?';

  @override
  String get gender => 'Geschlecht';

  @override
  String get uploadFiles => 'Laden Sie Dateien hoch, um Ihre Bewerbung abzuschließen';

  @override
  String get register => 'Registrieren';

  @override
  String get name => 'Name';

  @override
  String get enterName => 'Gib deinen Namen eine';

  @override
  String get surname => 'Nachname';

  @override
  String get enterSurname => 'Geben Sie Ihren Nachnamen ein';

  @override
  String get cellphone => 'Handy';

  @override
  String get enterCell => 'Geben Sie Ihr Mobiltelefon ein #';

  @override
  String idNum(Object id) {
    return 'Personalausweisnummer';
  }

  @override
  String enterIdNum(Object id) {
    return 'Bitte geben Sie Ihre Personalausweisnummer ein';
  }

  @override
  String get confirmPassword => 'Bestätige das Passwort';

  @override
  String get nameError => 'Name darf nicht leer sein';

  @override
  String get surnameError => 'Nachname darf nicht leer sein';

  @override
  String get emailError => 'Geben Sie eine gültige E-Mail-Adresse ein';

  @override
  String get cellPhoneError => 'Bitte geben Sie eine gültige Handynummer ein';

  @override
  String get addressError => 'Adresse darf nicht leer sein';

  @override
  String get haveAccount => 'Sie haben bereits ein Konto?';

  @override
  String get enterPostCode => 'Postleitzahl eingeben';

  @override
  String get findPostCode => 'Postleitzahl finden';

  @override
  String get changePostCode => 'Postleitzahl ändern';

  @override
  String get ukPostCode => 'Bitte geben Sie Ihre britische Postleitzahl ein';

  @override
  String get dePostCode => 'Bitte geben Sie die deutsche Postleitzahl ein';

  @override
  String get noPostCode => 'Bitte geben Sie die norwegische Postleitzahl ein';

  @override
  String get enterAddressDetails => 'Klicken Sie hier, um Adressdetails einzugeben';

  @override
  String get aboutAddress => 'Bitte wählen Sie eine Adresse';

  @override
  String get saveAdr => 'Adresse speichern';

  @override
  String get typeCode => 'Geben Sie Ihren Code ein';

  @override
  String get typeAddress => ' Beginnen Sie mit der Hausnummer / Bitte geben Sie Ihre Adresse ein';

  @override
  String get enterSAaddress => 'Bitte geben Sie eine südafrikanische Adresse ein';

  @override
  String get enterUKPostCode => 'Bitte geben Sie Ihre britische Postleitzahl ein';

  @override
  String get enterDEPostCode => 'Bitte geben Sie die deutsche Postleitzahl ein';

  @override
  String get enterNOPostCode => 'Bitte geben Sie die norwegische Postleitzahl ein';

  @override
  String get changeRegion => 'Region ändern';

  @override
  String get compApp => 'Bewerbung abschließen';

  @override
  String get verifyEmail => 'Bitte verifizieren Sie Ihre E-Mail-Adresse;';

  @override
  String checkEmail(Object email) {
    return 'Wir haben Ihnen eine E-Mail an $email gesendet. Bitte überprüfen Sie auch Ihren Spam-Ordner. Wenn Sie keine E-Mail erhalten haben, senden Sie die Verifizierungs-E-Mail bitte erneut.';
  }

  @override
  String get resendEmail => 'E-Mail-Verifizierung erneut senden';

  @override
  String get verifyingEmail => 'Bitte warten Sie, während wir Ihre E-Mail verifizieren...';

  @override
  String get creatingAccount => 'Bitte warten Sie, während wir Ihr Konto erstellen...';

  @override
  String get changeAddress => 'Adresse ändern';

  @override
  String get currentAddress => 'Aktuelle Adresse';

  @override
  String get pleaseSelectCountry => 'Bitte wählen Sie ein Land';

  @override
  String get sA => 'Südafrika';

  @override
  String get uK => 'Vereinigtes Königreich';

  @override
  String get nO => 'Norwegen';

  @override
  String get dE => 'Deutschland';

  @override
  String get enterEmailToReset => 'Bitte geben Sie Ihre E-Mail-Adresse ein, um Ihr Passwort zurückzusetzen';

  @override
  String get submitting => 'Wird gesendet...';

  @override
  String get sweeping => 'Wird aufgeräumt...';

  @override
  String get backToLogin => 'Zurück zum Login';

  @override
  String get passwordTooShort => 'Bitte stellen Sie sicher, dass Ihr Passwort länger als 7 Zeichen ist';
}
