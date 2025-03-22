import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const _storage = FlutterSecureStorage();
  static const _duster = 'duster';
  static const _token = 'token';

  static Future setDuster(duster) async =>
      await _storage.write(key: _duster, value: duster);

  static Future getDuster() async => _storage.read(key: _duster);

  static Future deleteDuster() async => _storage.delete(key: "duster");

  static Future setToken(token) async =>
      _storage.write(key: _token, value: token);

  static Future getToken() async => _storage.read(key: _token);

  static Future deleteToken() async => await _storage.delete(key: _token);

  static Future deleteAll() async => await _storage.deleteAll();
}
