import 'dart:io';

import 'package:dusterapp/features/auth/controllers/auth_controller.dart';
import 'package:dusterapp/l10n/app_localizations.dart';
import 'package:dusterapp/models/duster_model.dart';
import 'package:dusterapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadFiles extends ConsumerStatefulWidget {
  final String country;
  final Function completeApp;
  final String residence;
  const UploadFiles({
    super.key,
    required this.completeApp,
    required this.country,
    required this.residence,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UploadFilesState();
}

class _UploadFilesState extends ConsumerState<UploadFiles> {
  DusterModel? duster;
  bool complete = false;

  getDuster() {
    final res = ref.read(authControllerProvider.notifier).getDuster();

    setState(() {
      duster = res;
    });
  }

  @override
  void initState() {
    getDuster();
    super.initState();
  }

  Map<String, File?> selectedFiles = {
    'idData': null,
    'paData': null,
    'blData': null,
    'ppData': null,
    'dbsData': null,
    'wpData': null,
    'rtwData': null,
  };

  List<String> getMissingFileKeys() {
    return selectedFiles.entries
        .where((entry) => entry.value == null)
        .map((entry) => entry.key)
        .toList();
  }

  formChecker() {
    final missingKeys = getMissingFileKeys();
    final country = widget.country;
    if (country == "enZa") {
      if (duster!.local) {
        //Local SA
        List<String> requiredKeys = ["idData", "paData", "blData", "ppData"];

        bool allRequiredPresent = requiredKeys.every(
          (key) => !missingKeys.contains(key),
        );
        if (allRequiredPresent) {
          setState(() {
            complete = true;
          });
        }
      } else {
        //Foreign SA
        List<String> requiredKeys = [
          "idData",
          "paData",
          "blData",
          "ppData",
          "wpData",
        ];

        bool allRequiredPresent = requiredKeys.every(
          (key) => !missingKeys.contains(key),
        );
        if (allRequiredPresent) {
          setState(() {
            complete = true;
          });
        }
      }
    } else if (country == "enGb") {
      if (duster!.local) {
        //Local England
        List<String> requiredKeys = [
          "idData",
          "paData",
          "blData",
          "ppData",
          "dbsData",
        ];

        bool allRequiredPresent = requiredKeys.every(
          (key) => !missingKeys.contains(key),
        );
        if (allRequiredPresent) {
          setState(() {
            complete = true;
          });
        }
      } else {
        //Foreighn England
        List<String> requiredKeys = [
          "idData",
          "paData",
          "blData",
          "ppData",
          "dbsData",
          "rtwData",
        ];

        bool allRequiredPresent = requiredKeys.every(
          (key) => !missingKeys.contains(key),
        );
        if (allRequiredPresent) {
          setState(() {
            complete = true;
          });
        }
      }
    } else {
      if (duster!.local) {
        //Local EU
        List<String> requiredKeys = ["idData", "paData", "blData", "ppData"];

        bool allRequiredPresent = requiredKeys.every(
          (key) => !missingKeys.contains(key),
        );
        if (allRequiredPresent) {
          setState(() {
            complete = true;
          });
        }
      } else {
        //Forien eu
        List<String> requiredKeys = [
          "idData",
          "paData",
          "blData",
          "ppData",
          "wpData",
        ];

        bool allRequiredPresent = requiredKeys.every(
          (key) => !missingKeys.contains(key),
        );
        if (allRequiredPresent) {
          setState(() {
            complete = true;
          });
        }
      }
    }
  }

  uploadID() async {
    String key = 'idData';
    final fileData = await pickImage(fieldName: key);

    if (fileData != null) {
      setState(() {
        selectedFiles[key] = fileData;
      });
    }
    formChecker();
  }

  uploadPoa() async {
    String key = 'paData';
    final fileData = await pickImage(fieldName: key);

    if (fileData != null) {
      setState(() {
        selectedFiles[key] = fileData;
      });
    }
    formChecker();
  }

  uploadBank() async {
    String key = 'blData';
    final fileData = await pickImage(fieldName: key);

    if (fileData != null) {
      setState(() {
        selectedFiles[key] = fileData;
      });
    }
    formChecker();
  }

  uploadPic() async {
    String key = 'ppData';
    final fileData = await pickImage(fieldName: key);

    if (fileData != null) {
      setState(() {
        selectedFiles[key] = fileData;
      });
    }
    formChecker();
  }

  uploadWP() async {
    String key = 'wpData';
    final fileData = await pickImage(fieldName: key);

    if (fileData != null) {
      setState(() {
        selectedFiles[key] = fileData;
      });
    }
    formChecker();
  }

  uploadDBS() async {
    String key = 'dbsData';
    final fileData = await pickImage(fieldName: key);

    if (fileData != null) {
      setState(() {
        selectedFiles[key] = fileData;
      });
    }
    formChecker();
  }

  uploadRTW() async {
    String key = 'rtwData';
    final fileData = await pickImage(fieldName: key);

    if (fileData != null) {
      setState(() {
        selectedFiles[key] = fileData;
      });
    }
    formChecker();
  }

  completeApp() {
    widget.completeApp(selectedFiles);
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
              AppLocalizations.of(context)!.uploadFiles,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.deepOrange,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              style:
                  selectedFiles['idData'] != null
                      ? OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      )
                      : OutlinedButton.styleFrom(),
              onPressed: uploadID,
              child: Text(AppLocalizations.of(context)!.saID),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              style:
                  selectedFiles['paData'] != null
                      ? OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      )
                      : OutlinedButton.styleFrom(),
              onPressed: uploadPoa,
              child: Text(AppLocalizations.of(context)!.addressProof),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              style:
                  selectedFiles['blData'] != null
                      ? OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      )
                      : OutlinedButton.styleFrom(),
              onPressed: uploadBank,
              child: Text(AppLocalizations.of(context)!.bankLetter),
            ),
            const SizedBox(height: 18),
            ElevatedButton(
              style:
                  selectedFiles['ppData'] != null
                      ? OutlinedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.green,
                      )
                      : OutlinedButton.styleFrom(),
              onPressed: uploadPic,
              child: Text(AppLocalizations.of(context)!.proPic),
            ),
            const SizedBox(height: 18),
            if (duster != null && duster!.local == false)
              ElevatedButton(
                style:
                    selectedFiles['wpData'] != null
                        ? OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                        )
                        : OutlinedButton.styleFrom(),
                onPressed: uploadWP,
                child: Text(
                  AppLocalizations.of(context)!.workPermit(widget.residence),
                ),
              ),
            if (widget.country == "enGb")
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style:
                        selectedFiles['dbsData'] != null
                            ? OutlinedButton.styleFrom(
                              foregroundColor: Colors.white,
                              backgroundColor: Colors.green,
                            )
                            : OutlinedButton.styleFrom(),
                    onPressed: uploadDBS,
                    child: Text(AppLocalizations.of(context)!.dbsLetter),
                  ),
                  const SizedBox(height: 18),
                  if (duster != null && duster!.local == false)
                    ElevatedButton(
                      style:
                          selectedFiles['rtwData'] != null
                              ? OutlinedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.green,
                              )
                              : OutlinedButton.styleFrom(),
                      onPressed: uploadRTW,
                      child: Text(AppLocalizations.of(context)!.rtw),
                    ),
                ],
              ),

            const SizedBox(height: 18),
            complete
                ? ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(width: 2, color: Colors.blue),
                    foregroundColor: Colors.blue,
                  ),
                  onPressed: completeApp,
                  child: Text(
                    AppLocalizations.of(context)!.submit,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.blue,
                    ),
                  ),
                )
                : Text(
                  AppLocalizations.of(context)!.uploadFiles,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.orange,
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
