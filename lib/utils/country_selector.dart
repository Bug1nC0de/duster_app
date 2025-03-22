import 'package:dusterapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:country_flags/country_flags.dart';

class CountrySelector extends ConsumerStatefulWidget {
  final Function changeLang;
  const CountrySelector({super.key, required this.changeLang});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CountrySelectorState();
}

class _CountrySelectorState extends ConsumerState<CountrySelector> {
  @override
  Widget build(BuildContext context) {
    void toggleLang(String newLang, String newCountry) {
      widget.changeLang(newLang, newCountry);
      Navigator.pop(context);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: const BackButton(color: Colors.black),
        title: Text(
          AppLocalizations.of(context)!.pleaseSelectCountry,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            ListTile(
              leading: CountryFlag.fromCountryCode('ZA'),
              title: Text(
                AppLocalizations.of(context)!.sA,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              onTap: () => toggleLang('en', 'enZa'),
            ),
            ListTile(
              leading: CountryFlag.fromCountryCode('GB'),
              title: Text(
                AppLocalizations.of(context)!.uK,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              onTap: () => toggleLang('en', 'enGb'),
            ),
            ListTile(
              leading: CountryFlag.fromCountryCode('NO'),
              title: Text(
                AppLocalizations.of(context)!.nO,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              onTap: () => toggleLang('no', 'no'),
            ),
            ListTile(
              leading: CountryFlag.fromCountryCode('DE'),
              title: Text(
                AppLocalizations.of(context)!.dE,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              onTap: () => toggleLang('de', 'de'),
            ),
          ],
        ),
      ),
    );
  }
}
