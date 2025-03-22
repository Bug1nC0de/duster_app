import 'package:dusterapp/features/auth/controllers/auth_controller.dart';
import 'package:dusterapp/features/auth/views/login_view.dart';
import 'package:dusterapp/l10n/app_localizations.dart';
import 'package:dusterapp/utils/loading_page.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationSuccessView extends ConsumerStatefulWidget {
  final String email;
  final String lng;
  final String country;
  final Function changeLang;
  const RegistrationSuccessView({
    super.key,
    required this.email,
    required this.lng,
    required this.country,
    required this.changeLang,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RegistrationSuccessViewState();
}

class _RegistrationSuccessViewState
    extends ConsumerState<RegistrationSuccessView> {
  late final TextEditingController _email;

  bool loading = false;
  bool canResend = true;

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

  isEmail(value) {
    final res = EmailValidator.validate(value);
    if (res) {
      setState(() {
        canResend = true;
      });
    }
  }

  resendEmail() {
    ref
        .read(authControllerProvider.notifier)
        .resendEmailVerification(
          email: _email.text,
          lng: widget.lng,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    _email.text = widget.email;
    final isLoading = ref.watch(authControllerProvider);
    String emailMsg = AppLocalizations.of(context)!.checkEmail(widget.email);
    return isLoading
        ? LoadingPage()
        : Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 100.0),
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 150.0,
                      child: Image.asset('assets/images/DustingApp.png'),
                    ),
                  ),
                  Text(
                    emailMsg,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 48.0),
                  TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    autofocus: true,
                    onChanged: (value) {
                      isEmail(value);
                    },
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.email,
                      labelText: AppLocalizations.of(context)!.enterEmail,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: resendEmail,
                    child: Text(
                      AppLocalizations.of(context)!.resendEmail,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 18),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder:
                              (context) => LoginView(
                                changeLang: widget.changeLang,
                                country: widget.country,
                                lng: widget.lng,
                              ),
                        ),
                      );
                    },
                    child: Text(
                      AppLocalizations.of(context)!.backToLogin,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
