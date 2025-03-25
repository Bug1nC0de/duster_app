import 'dart:convert';
import 'package:dusterapp/features/auth/views/registration_success_view.dart';
import 'package:dusterapp/firebase_options.dart';
import 'package:dusterapp/l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localization/flutter_localization.dart';
import 'package:dusterapp/features/auth/views/login_view.dart';
import 'package:dusterapp/features/home/views/home_view.dart';
import 'package:dusterapp/models/duster_model.dart';
import 'package:dusterapp/utils/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await FlutterLocalization.instance.ensureInitialized();
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final FlutterLocalization localization = FlutterLocalization.instance;

class _MyAppState extends State<MyApp> {
  String lang = '';
  String country = '';

  whatsTheLang() {
    final local = localization.currentLocale!.countryCode;
    if (local == "NO") {
      lang = 'no';
      country = 'no';
    } else if (local == "DE") {
      lang = 'de';
      country = 'de';
    } else if (local == "GB") {
      lang = 'en';
      country = "enGb";
    } else {
      lang = 'en';
      country = 'enZa';
    }
  }

  @override
  void initState() {
    whatsTheLang();
    localization.onTranslatedLanguage = _onTranslatedLanguage;
    super.initState();
  }

  changeLange(String newLang, String newCountry) {
    setState(() {
      lang = newLang;
      country = newCountry;
    });
  }

  // the setState function here is a must to add
  void _onTranslatedLanguage(Locale? locale) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dust Buster App',
      debugShowCheckedModeBanner: false,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(lang),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'Dust Buster App',
        changeLang: changeLange,
        country: country,
        lng: lang,
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
    required this.changeLang,
    required this.country,
    required this.lng,
  });
  final String title;
  final Function changeLang;
  final String country;
  final String lng;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DusterModel? currentDuster;

  whoIsHere() async {
    final anyOneHere = await SecureStorage.getDuster();

    if (anyOneHere != null) {
      final map = jsonDecode(anyOneHere);
      DusterModel duster = DusterModel.fromMap(map);

      setState(() {
        currentDuster = duster;
      });
    }
  }

  @override
  void initState() {
    whoIsHere();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return currentDuster != null
        ? currentDuster!.readyToWork
            ? HomeView(
              lng: widget.lng,
              country: widget.country,
              changeLang: widget.changeLang,
              duster: currentDuster!,
            )
            : currentDuster!.verified == false
            ? RegistrationSuccessView(
              email: currentDuster!.email,
              lng: widget.lng,
              country: widget.country,
              changeLang: widget.changeLang,
            )
            : HomeView(
              lng: widget.lng,
              country: widget.country,
              changeLang: widget.changeLang,
              duster: currentDuster!,
            )
        : LoginView(
          changeLang: widget.changeLang,
          country: widget.country,
          lng: widget.lng,
        );
  }
}
