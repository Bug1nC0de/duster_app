import 'package:dusterapp/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IntroRegistration extends ConsumerStatefulWidget {
  final Function setStage;
  final String country;
  final String residence;
  final String homeCountry;
  const IntroRegistration({
    super.key,
    required this.setStage,
    required this.country,
    required this.residence,
    required this.homeCountry,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _IntroRegistrationState();
}

class _IntroRegistrationState extends ConsumerState<IntroRegistration> {
  bool? _confirmDocs = false;
  bool? _criminal = false;
  bool? _legal = false;
  bool? _understandIC = false;
  bool? _policyAgree = false;
  bool _canMoveOn = false;

  moveOn() {
    if (_confirmDocs! &&
        _criminal! &&
        _legal! &&
        _understandIC! &&
        _policyAgree!) {
      setState(() {
        _canMoveOn = true;
      });
    } else {
      setState(() {
        _canMoveOn = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.read,
              style: TextStyle(
                fontSize: 22,
                color: Colors.orange,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.requiredDocs,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Column(
                children: [
                  ListTile(
                    leading: Text(
                      '1.',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.saID,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Text(
                      '2.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.addressProof,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Text(
                      '3.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.bankLetter,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Text(
                      '4.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(
                      AppLocalizations.of(context)!.proPic,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Divider(),
                  ListTile(
                    leading: Text(
                      '5.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    title: Text(
                      AppLocalizations.of(
                        context,
                      )!.workPermit(widget.residence),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (widget.country == "enGb")
                    Column(
                      children: [
                        Divider(),
                        ListTile(
                          leading: Text(
                            '6.',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          title: Text(
                            AppLocalizations.of(context)!.dbsLetter,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  Divider(),
                ],
              ),
            ),

            const SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.beforeStart,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              ),
            ),
            Text(
              AppLocalizations.of(context)!.line1,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.reject,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.red,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              AppLocalizations.of(context)!.line2,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.orange,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              AppLocalizations.of(context)!.line3,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
            ),
            const SizedBox(height: 10),
            CheckboxListTile(
              title: Text(
                AppLocalizations.of(context)!.confirmDocs,
                textAlign: TextAlign.center,
              ),
              value: _confirmDocs,
              onChanged: (bool? x) {
                setState(() {
                  _confirmDocs = x;
                });
                moveOn();
              },
            ),
            CheckboxListTile(
              title: Text(
                AppLocalizations.of(context)!.confirmCriminal,
                textAlign: TextAlign.center,
              ),
              value: _criminal,
              onChanged: (bool? x) {
                setState(() {
                  _criminal = x;
                });
                moveOn();
              },
            ),
            CheckboxListTile(
              title: Text(
                AppLocalizations.of(context)!.confirmLegal(widget.homeCountry),
                textAlign: TextAlign.center,
              ),
              value: _legal,
              onChanged: (bool? x) {
                setState(() {
                  _legal = x;
                });
                moveOn();
              },
            ),
            CheckboxListTile(
              title: Text(
                AppLocalizations.of(context)!.understandIC,
                textAlign: TextAlign.center,
              ),
              value: _understandIC,
              onChanged: (bool? x) {
                setState(() {
                  _understandIC = x;
                });
                moveOn();
              },
            ),
            CheckboxListTile(
              title: Text(
                AppLocalizations.of(context)!.policyAgree,
                textAlign: TextAlign.center,
              ),
              value: _policyAgree,
              onChanged: (bool? x) {
                setState(() {
                  _policyAgree = x;
                });
                moveOn();
              },
            ),
            const SizedBox(height: 20),
            _canMoveOn
                ? OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    side: BorderSide(color: Colors.green),
                  ),
                  onPressed: () {
                    widget.setStage(2);
                  },
                  child: Text(
                    AppLocalizations.of(context)!.yourInfo,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                )
                : Container(),
          ],
        ),
      ),
    );
  }
}
