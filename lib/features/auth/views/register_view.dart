import 'dart:io';

import 'package:dusterapp/features/auth/controllers/auth_controller.dart';
import 'package:dusterapp/features/auth/widgets/enter_info.dart';
import 'package:dusterapp/features/auth/widgets/intro_registration.dart';
import 'package:dusterapp/features/auth/widgets/upload_files.dart';
import 'package:dusterapp/l10n/app_localizations.dart';
import 'package:dusterapp/models/duster_model.dart';
import 'package:dusterapp/utils/country_selector.dart';
import 'package:dusterapp/utils/loading_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterView extends ConsumerStatefulWidget {
  final Function changeLang;
  final String country;
  final String lng;
  const RegisterView({
    super.key,
    required this.changeLang,
    required this.country,
    required this.lng,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RegisterViewState();
}

class _RegisterViewState extends ConsumerState<RegisterView> {
  int stage = 1;

  getStage() {
    int s = ref.read(authControllerProvider.notifier).getStage();
    setState(() {
      stage = s;
    });
  }

  @override
  void initState() {
    getStage();
    super.initState();
  }

  completeApp({required Map<String, File?> selectedFiles}) {
    ref
        .read(authControllerProvider.notifier)
        .signUpDuster(
          selectedFiles: selectedFiles,
          lng: widget.lng,
          country: widget.country,
          context: context,
          changeLang: widget.changeLang,
        );
  }

  dusterStepOne({required int ns}) {
    int s = ref.read(authControllerProvider.notifier).changeStage(s: ns);
    setState(() {
      stage = s;
    });
  }

  dusterStepTwo({
    required DusterModel duster,
    required String password,
    required int s,
  }) async {
    int s = await ref
        .read(authControllerProvider.notifier)
        .createDuster(
          duster: duster,
          password: password,
          lng: widget.lng,
          context: context,
        );

    setState(() {
      stage = s;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(authControllerProvider);
    final c = widget.country;
    final homeCountry =
        c == "enZa"
            ? AppLocalizations.of(context)!.sA
            : c == "enGb"
            ? AppLocalizations.of(context)!.uK
            : c == "no"
            ? AppLocalizations.of(context)!.nO
            : c == "de"
            ? AppLocalizations.of(context)!.dE
            : '';
    final residence = c == "enGb" ? "Residence" : "Work";
    final id = c == "enGb" ? "National Insurance" : "ID";
    return isLoading
        ? LoadingPage()
        : Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.newHere),
            actions: [
              IconButton(
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
                icon: Icon(Icons.public, color: Colors.blue),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style:
                              stage == 1
                                  ? OutlinedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    side: BorderSide(color: Colors.blue),
                                  )
                                  : OutlinedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    foregroundColor: Colors.white,
                                    side: BorderSide(color: Colors.grey),
                                  ),
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context)!.welcome,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: OutlinedButton(
                          style:
                              stage == 2
                                  ? OutlinedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    side: BorderSide(color: Colors.blue),
                                  )
                                  : OutlinedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    foregroundColor: Colors.white,
                                    side: BorderSide(color: Colors.grey),
                                  ),
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context)!.yourInfo,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: OutlinedButton(
                          style:
                              stage == 3
                                  ? OutlinedButton.styleFrom(
                                    backgroundColor: Colors.blue,
                                    foregroundColor: Colors.white,
                                    side: BorderSide(color: Colors.blue),
                                  )
                                  : OutlinedButton.styleFrom(
                                    backgroundColor: Colors.grey,
                                    foregroundColor: Colors.white,
                                    side: BorderSide(color: Colors.grey),
                                  ),
                          onPressed: () {},
                          child: Text(
                            AppLocalizations.of(context)!.upload,
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  if (stage == 1)
                    IntroRegistration(
                      setStage: (int ns) {
                        dusterStepOne(ns: ns);
                      },
                      country: widget.country,
                      residence: residence,
                      homeCountry: homeCountry,
                    ),
                  if (stage == 2)
                    EnterInfo(
                      country: widget.country,
                      lng: widget.lng,
                      setStage: (int s, DusterModel duster, String password) {
                        dusterStepTwo(duster: duster, password: password, s: s);
                      },
                      homeCountry: homeCountry,
                      id: id,
                    ),
                  if (stage == 3)
                    UploadFiles(
                      country: widget.country,
                      completeApp: (selectedFiles) {
                        completeApp(selectedFiles: selectedFiles);
                      },
                      residence: residence,
                    ),
                ],
              ),
            ),
          ),
        );
  }
}
