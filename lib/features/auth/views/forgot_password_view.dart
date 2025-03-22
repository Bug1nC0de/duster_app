import 'package:dusterapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ForgotPasswordView extends ConsumerStatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends ConsumerState<ForgotPasswordView> {
  late final TextEditingController _email;
  bool jamming = false;

  @override
  void initState() {
    _email = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    super.dispose();
  }

  forgotPassword() {
    setState(() {
      jamming = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: Text(AppLocalizations.of(context)!.resetPassword),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: TextField(
                controller: _email,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: AppLocalizations.of(context)!.enterEmail,
                  labelText: AppLocalizations.of(context)!.enterEmail,
                ),
              ),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 300,
              child:
                  jamming
                      ? OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.grey,
                          side: BorderSide(color: Colors.grey),
                        ),
                        onPressed: forgotPassword,
                        child: Text(AppLocalizations.of(context)!.submitting),
                      )
                      : OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                          side: BorderSide(color: Colors.green),
                        ),
                        onPressed: forgotPassword,
                        child: Text(AppLocalizations.of(context)!.submit),
                      ),
            ),
          ],
        ),
      ),
    );
  }
}
