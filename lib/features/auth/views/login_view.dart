import 'package:dusterapp/features/auth/controllers/auth_controller.dart';
import 'package:dusterapp/features/auth/views/forgot_password_view.dart';
import 'package:dusterapp/features/auth/views/register_view.dart';
import 'package:dusterapp/l10n/app_localizations.dart';
import 'package:dusterapp/utils/country_selector.dart';
import 'package:dusterapp/utils/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginView extends ConsumerStatefulWidget {
  final Function changeLang;
  final String country;
  final String lng;

  const LoginView({
    super.key,
    required this.changeLang,
    required this.country,
    required this.lng,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {
  late final TextEditingController _email;
  late final TextEditingController pwd;
  bool canlogin = false;

  @override
  void initState() {
    _email = TextEditingController();
    pwd = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    pwd.dispose();
    super.dispose();
  }

  login() {
    ref
        .read(authControllerProvider.notifier)
        .signin(
          email: _email.text,
          password: pwd.text,
          lng: widget.lng,
          context: context,
          country: widget.country,
          changeLang: widget.changeLang,
        );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    return isLoading
        ? LoadingPage()
        : Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 100),
                  Text(
                    AppLocalizations.of(context)!.welcome,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Hero(
                    tag: 'logo',
                    child: SizedBox(
                      height: 150.0,
                      child: Image.asset('assets/images/DustingApp.png'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    AppLocalizations.of(context)!.signin,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.lightBlue,
                      fontSize: 40.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 48.0),
                  TextField(
                    controller: _email,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.enterEmail,
                      labelText: AppLocalizations.of(context)!.enterEmail,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18.0),

                  TextField(
                    onChanged: (pwd) {
                      if (pwd.length > 5) {
                        setState(() {
                          canlogin = true;
                        });
                      } else {
                        setState(() {
                          canlogin = false;
                        });
                      }
                    },
                    controller: pwd,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.password,
                      labelText: AppLocalizations.of(context)!.password,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  ElevatedButton(
                    onPressed: login,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                    ),
                    child: Text(
                      AppLocalizations.of(context)!.signin,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder:
                                    (context) => RegisterView(
                                      changeLang: widget.changeLang,
                                      country: widget.country,
                                      lng: widget.lng,
                                    ),
                              ),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.newHere,
                            style: TextStyle(
                              color: Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 150,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ForgotPasswordView(),
                                fullscreenDialog: true,
                              ),
                            );
                          },
                          child: Text(
                            AppLocalizations.of(context)!.resetPassword,
                            style: TextStyle(
                              color: Colors.yellow[900],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder:
                      (context) =>
                          CountrySelector(changeLang: widget.changeLang),
                  fullscreenDialog: true,
                ),
              );
            },
            mini: true,
            child: Icon(Icons.public, color: Colors.white),
          ),
        );
  }
}
