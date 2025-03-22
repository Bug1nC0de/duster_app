// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Norwegian (`no`).
class AppLocalizationsNo extends AppLocalizations {
  AppLocalizationsNo([String locale = 'no']) : super(locale);

  @override
  String get signin => 'Duster Logg inn';

  @override
  String get email => 'Epostadresse';

  @override
  String get enterEmail => 'Skriv inn e-post';

  @override
  String get password => 'Passord';

  @override
  String get passwordError => 'Passordene stemmer ikke overens';

  @override
  String get submit => 'Sende inn';

  @override
  String get newHere => 'Ny her?';

  @override
  String get resetPassword => 'Tilbakestill passord';

  @override
  String get welcome => 'Velkommen';

  @override
  String get yourInfo => 'Din informasjon';

  @override
  String get upload => 'Dokumenter';

  @override
  String get read => 'Vennligst les nøye';

  @override
  String get requiredDocs => 'Vi vil trenge følgende dokumentasjon for å fullføre søknaden din.';

  @override
  String get beforeStart => ' Sørg for at du har ALLE dokumenter tilgjengelig før du starter di søknad.';

  @override
  String get line1 => 'Hvis du laster opp feil dokumentasjon, vil søknaden din bli';

  @override
  String get line2 => 'Vi godtar kun png, jpeg og pdf';

  @override
  String get line3 => 'Før du fortsetter, vennligst bekreft:';

  @override
  String get reject => 'AVVIST!';

  @override
  String get confirmDocs => 'Du har alle dokumentene for å fullføre søknaden';

  @override
  String get confirmCriminal => 'Du har ingen kriminell bakgrunn';

  @override
  String confirmLegal(Object country) {
    return 'Du har lov til å jobbe i Norge';
  }

  @override
  String get understandIC => 'Du forstår at du er en selvstendig næringsdrivende';

  @override
  String get policyAgree => 'Du godtar våre vilkår og personvernregler';

  @override
  String get tickPolicy => 'Ved å merke av i denne boksen godtar du våre';

  @override
  String get tc => 'bruksvilkår';

  @override
  String get saID => 'ID Card or Book';

  @override
  String get idDoc => 'Nasjonalt ID-kort/Pass';

  @override
  String get idError => 'Vennligst skriv inn et gyldig ID- eller passnummer';

  @override
  String get addressProof => 'Adressebevis';

  @override
  String get bankLetter => 'Brev fra banken';

  @override
  String get proPic => 'Profilbilde';

  @override
  String workPermit(Object residence) {
    return 'Oppholdstillatelse (for utenlandske statsborgere)';
  }

  @override
  String get dbsLetter => 'Politiattest';

  @override
  String get rtw => 'Arbeidstillatelse (for utenlandske statsborgere)';

  @override
  String fromHere(Object country) {
    return 'Er du norsk?';
  }

  @override
  String local(Object country) {
    return 'Norge';
  }

  @override
  String get foreign => 'Utenlandsk nasjon';

  @override
  String get foreignOrLocal => 'Er du utenlandsk eller lokal?';

  @override
  String get male => 'Mann';

  @override
  String get female => 'Kvinne';

  @override
  String get maleOrFemale => 'Er du mann eller kvinne?';

  @override
  String get gender => 'Kjønn';

  @override
  String get uploadFiles => 'Last opp filer for å fullføre søknaden din';

  @override
  String get register => 'Registrere';

  @override
  String get name => 'Navn';

  @override
  String get enterName => 'Skriv inn navnet ditt';

  @override
  String get surname => 'Etternavn';

  @override
  String get enterSurname => 'Skriv inn etternavnet ditt';

  @override
  String get cellphone => 'Mobiltelefon';

  @override
  String get enterCell => 'Skriv inn mobilnummeret ditt #';

  @override
  String idNum(Object id) {
    return 'Fødselsnummeret';
  }

  @override
  String enterIdNum(Object id) {
    return 'Vennligst skriv inn fødselsnummeret ditt';
  }

  @override
  String get confirmPassword => 'Bekreft Passord';

  @override
  String get nameError => 'Navn kan ikke være tomt';

  @override
  String get surnameError => 'Etternavn kan ikke være tomt';

  @override
  String get emailError => 'Skriv inn en gyldig e-postadresse';

  @override
  String get cellPhoneError => 'Vennligst skriv inn et gyldig mobilnummer';

  @override
  String get addressError => 'Adresse kan ikke være tom';

  @override
  String get haveAccount => 'Har du allerede en konto?';

  @override
  String get enterPostCode => 'Skriv inn postnummer';

  @override
  String get findPostCode => 'Finn postnummer';

  @override
  String get changePostCode => 'Endre postnummer';

  @override
  String get ukPostCode => 'Vennligst skriv inn ditt britiske postnummer';

  @override
  String get dePostCode => 'Vennligst skriv inn tysk postnummer';

  @override
  String get noPostCode => 'Vennligst skriv inn norsk postnummer';

  @override
  String get enterAddressDetails => 'Klikk for å angi adressedetaljer';

  @override
  String get aboutAddress => 'Vennligst velg adresse';

  @override
  String get saveAdr => 'Lagre adresse';

  @override
  String get typeCode => 'Skriv inn koden din';

  @override
  String get typeAddress => 'Start med gatenummer / Vennligst skriv inn adressen din';

  @override
  String get enterSAaddress => 'Vennligst skriv inn en sørafrikansk adresse';

  @override
  String get enterUKPostCode => 'Vennligst skriv inn ditt britiske postnummer';

  @override
  String get enterDEPostCode => 'Vennligst skriv inn tysk postnummer';

  @override
  String get enterNOPostCode => 'Vennligst skriv inn norsk postnummer';

  @override
  String get changeRegion => 'Endre region';

  @override
  String get compApp => 'Fullfør søknad';

  @override
  String get verifyEmail => 'Vennligst bekreft e-postadressen din;';

  @override
  String checkEmail(Object email) {
    return 'Vi har sendt deg en e-post til $email. Vennligst sjekk søppelposten din for sikkerhets skyld. Hvis du ikke har mottatt en e-post, vennligst send verifikasjons-e-posten på nytt.';
  }

  @override
  String get resendEmail => 'Send e-postverifikasjon på nytt';

  @override
  String get verifyingEmail => 'Vennligst vent mens vi bekrefter e-posten din...';

  @override
  String get creatingAccount => 'Vennligst vent mens vi oppretter kontoen din...';

  @override
  String get changeAddress => 'Endre adresse';

  @override
  String get currentAddress => 'Nåværende adresse';

  @override
  String get pleaseSelectCountry => 'Vennligst velg land';

  @override
  String get sA => 'Sør-Afrika';

  @override
  String get uK => 'Storbritannia';

  @override
  String get nO => 'Norge';

  @override
  String get dE => 'Tyskland';

  @override
  String get enterEmailToReset => 'Vennligst skriv inn e-posten din for å tilbakestille passordet';

  @override
  String get submitting => 'Sender inn...';

  @override
  String get sweeping => 'Rydder opp...';

  @override
  String get backToLogin => 'Tilbake til innlogging';

  @override
  String get passwordTooShort => 'Passordet ditt må være lengre enn 7 tegn';
}
