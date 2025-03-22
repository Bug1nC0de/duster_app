import 'package:dusterapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  final String msg;
  const Loader({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 350),
            const CircularProgressIndicator(),
            const SizedBox(height: 25),
            Text(msg, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Loader(msg: AppLocalizations.of(context)!.sweeping),
      ),
    );
  }
}
