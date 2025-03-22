import 'dart:convert';

import 'package:dusterapp/api/auth_api.dart';
import 'package:dusterapp/models/duster_model.dart';
import 'package:dusterapp/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final homeControllerProvider = StateNotifierProvider<HomeController, bool>((
  ref,
) {
  return HomeController(authApi: ref.watch(authApiProvider));
});

final initBookings = FutureProvider.family((ref, String lng) async {
  final userApi = ref.watch(authApiProvider);
  final res = await userApi.fetchDusterBookings(lng: lng);

  var jsonString = res.body;
  var map = jsonDecode(jsonString);
  return map;
});

class HomeController extends StateNotifier<bool> {
  final AuthApi _authApi;
  HomeController({required AuthApi authApi}) : _authApi = authApi, super(false);

  fetchDusterProfile({
    required String lng,
    required BuildContext context,
  }) async {
    final res = await _authApi.fetchDusterProfile(lng: lng);

    if (res.statusCode == 200) {
      var jsonString = res.body;
      var map = jsonDecode(jsonString);
      DusterModel duster = DusterModel.fromMap(map);
      return duster;
    } else {
      if (!context.mounted) return;
      showErrorSnackBar("Sometihng went wrong", context);
    }
  }
}
