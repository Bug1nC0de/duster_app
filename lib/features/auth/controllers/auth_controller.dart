import 'dart:convert';
import 'dart:io';

import 'package:dusterapp/api/auth_api.dart';
import 'package:dusterapp/features/auth/views/login_view.dart';
import 'package:dusterapp/features/auth/views/registration_success_view.dart';
import 'package:dusterapp/features/home/views/home_view.dart';
import 'package:dusterapp/models/duster_model.dart';
import 'package:dusterapp/utils/secure_storage.dart';
import 'package:dusterapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>((
  ref,
) {
  return AuthController(authApi: ref.watch(authApiProvider));
});

class AuthController extends StateNotifier<bool> {
  final AuthApi _authApi;
  AuthController({required AuthApi authApi}) : _authApi = authApi, super(false);

  DusterModel? newDuster;
  String? pwd;
  int stage = 1;

  changeStage({required int s}) {
    stage = s;

    return stage;
  }

  getStage() {
    return stage;
  }

  findUkPostCode({
    required String code,
    required String lng,
    required BuildContext context,
  }) async {
    final res = await _authApi.findUKPostCode(code: code, lng: lng);

    if (res.statusCode == 200) {
      var jsonString = res.body;
      var jsonMap = jsonDecode(jsonString);
      return jsonMap;
    } else {
      if (!context.mounted) return;
      var jsonString = res.body;
      var jsonMap = jsonDecode(jsonString);
      showErrorSnackBar(jsonMap['message'], context);
    }
  }

  findEuPostCode({
    required String code,
    required String country,
    required String lng,
    required BuildContext context,
  }) async {
    final res = await _authApi.findEUPostCode(
      code: code,
      country: country,
      lng: lng,
    );

    if (res.statusCode == 200) {
      var jsonString = res.body;
      var jsonMap = jsonDecode(jsonString);
      return jsonMap;
    } else {
      if (!context.mounted) return;
      var jsonString = res.body;
      var jsonMap = jsonDecode(jsonString);
      showErrorSnackBar(jsonMap['message'], context);
    }
  }

  createDuster({
    required DusterModel duster,
    required String password,
    required String lng,
    required BuildContext context,
  }) async {
    newDuster = duster;
    pwd = password;

    state = true;
    final res = await _authApi.verifyduplication(
      email: duster.email,
      cellphone: duster.cellphone,
      lng: lng,
    );

    if (res.statusCode == 200) {
      state = false;
      stage = 3;
      return stage;
    } else {
      state = false;
      var jsonString = res.body;
      var jsonMap = jsonDecode(jsonString);
      if (!context.mounted) return;
      showErrorSnackBar(jsonMap['message'], context);

      return stage;
    }
  }

  getDuster() {
    return newDuster;
  }

  signUpDuster({
    required Map<String, File?> selectedFiles,
    required String lng,
    required String country,
    required BuildContext context,
    required Function changeLang,
  }) async {
    state = true;
    final longitude = newDuster!.coordinates.lng;
    final latitude = newDuster!.coordinates.lat;
    final res = await _authApi.signUp(
      selectedFiles: selectedFiles,
      name: newDuster!.name,
      surname: newDuster!.surname,
      cellphone: newDuster!.cellphone,
      address: newDuster!.address,
      longitude: longitude!,
      latitude: latitude!,
      email: newDuster!.email,
      password: pwd!,
      lng: lng,
      postCode: "",
      country: newDuster!.country,
      idNum: newDuster!.idNum,
    );
    if (res.statusCode == 201) {
      state = false;
      if (!context.mounted) return;
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder:
              (context) => RegistrationSuccessView(
                email: newDuster!.email,
                lng: lng,
                country: country,
                changeLang: changeLang,
              ),
        ),
      );
    } else {
      state = false;

      // Ensure the full stream is read before decoding
      utf8.decoder
          .bind(res.stream)
          .join()
          .then((responseBody) {
            try {
              final map = jsonDecode(responseBody);
              if (!context.mounted) return;
              showErrorSnackBar(map['message'], context);
            } catch (e) {
              // print("Error parsing response: $e");
            }
          })
          .catchError((error) {
            // print("Error reading stream: $error");
          });
    }
  }

  signin({
    required String email,
    required String password,
    required String lng,
    required String country,
    required BuildContext context,
    required Function changeLang,
  }) async {
    state = true;
    final res = await _authApi.signIn(
      email: email,
      password: password,
      lng: lng,
    );

    if (res.statusCode == 201) {
      String? loot = res.headers['set-cookie'];
      final str = loot!.split("=")[1];
      final token = str.split(";")[0];
      await SecureStorage.setToken(token);
      var jsonString = res.body;
      await SecureStorage.setDuster(jsonString);
      var jsonMap = jsonDecode(jsonString);
      DusterModel duster = DusterModel.fromMap(jsonMap);

      if (!context.mounted) return;
      if (duster.readyToWork) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (context) => HomeView(
                  lng: lng,
                  country: country,
                  changeLang: changeLang,
                  duster: duster,
                ),
          ),
        );
        state = false;
      } else if (duster.verified == false) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (context) => RegistrationSuccessView(
                  email: email,
                  lng: lng,
                  country: country,
                  changeLang: changeLang,
                ),
          ),
        );
      } else {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder:
                (context) => HomeView(
                  lng: lng,
                  country: country,
                  changeLang: changeLang,
                  duster: duster,
                ),
          ),
        );
      }
      state = false;
    } else {
      var jsonString = res.body;
      var jsonMap = jsonDecode(jsonString);
      state = false;
      if (!context.mounted) return;
      showErrorSnackBar(jsonMap['message'], context);
    }
  }

  resendEmailVerification({
    required String email,
    required String lng,
    required BuildContext context,
  }) async {
    state = true;
    final res = await _authApi.resendEmail(email: email, lng: lng);

    if (res.statusCode == 200) {
      state = false;
      if (!context.mounted) return;
      var jsonString = res.body;
      var jsonMap = jsonDecode(jsonString);
      showSnackBar(jsonMap['message'], context);
    } else {
      var jsonString = res.body;
      var jsonMap = jsonDecode(jsonString);
      state = false;
      if (!context.mounted) return;
      showErrorSnackBar(jsonMap['message'], context);
    }
  }

  signOut({
    required String lng,
    required BuildContext context,
    required String country,
    required Function changeLang,
  }) async {
    final res = await _authApi.signOut(lng: lng);
    await SecureStorage.deleteAll();
    if (res.statusCode == 200) {
      if (!context.mounted) return;
      showSnackBar("Good Bye...", context);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder:
              (context) =>
                  LoginView(changeLang: changeLang, country: country, lng: lng),
        ),
      );
    }
  }
}
