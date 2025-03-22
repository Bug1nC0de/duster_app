import 'dart:convert';
import 'dart:io';
import 'package:dusterapp/api/backend.dart';
import 'package:dusterapp/utils/secure_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

final authApiProvider = Provider((ref) {
  return AuthApi();
});

abstract class IAuthAPI {
  Future findUKPostCode({required String code, required String lng});
  Future findEUPostCode({
    required String code,
    required String country,
    required String lng,
  });
  Future verifyduplication({
    required String email,
    required String cellphone,
    required String lng,
  });
  Future signUp({
    required Map<String, File?> selectedFiles,
    required String name,
    required String surname,
    required String cellphone,
    required String address,
    required double longitude,
    required double latitude,
    required String email,
    required String password,
    required String lng,
    required String postCode,
    required String country,
    required String idNum,
  });

  Future signIn({
    required String email,
    required String password,
    required String lng,
  });

  Future resendEmail({required String email, required String lng});
  Future forgotPassword({required String email, required String lng});
  Future fetchDusterProfile({required String lng});
  Future fetchDusterBookings({required String lng});
  Future signOut({required String lng});
}

class AuthApi implements IAuthAPI {
  @override
  Future verifyduplication({
    required String email,
    required String cellphone,
    required String lng,
  }) {
    final backend = Uri.parse('$url/dusters/verify-duplicate');
    final headers = {
      "Content-Type": "application/json",
      "Accept-Language": lng,
    };
    final body = {"email": email, "cellphone": cellphone};
    final response = http.post(
      backend,
      headers: headers,
      body: jsonEncode(body),
    );

    return response;
  }

  @override
  Future findEUPostCode({
    required String code,
    required String country,
    required String lng,
  }) async {
    final backend = Uri.parse('$url/dusters/eu-postcode-data');
    final headers = {
      "Content-Type": "application/json",
      "Accept-Language": lng,
    };
    final body = {"str": code, "country": country};

    final response = await http.put(
      backend,
      headers: headers,
      body: jsonEncode(body),
    );

    return response;
  }

  @override
  Future findUKPostCode({required String code, required String lng}) async {
    final backend = Uri.parse('$url/dusters/post-code-finder/$code');
    final headers = {
      "Content-Type": "application/json",
      "Accept-Language": lng,
    };

    final response = await http.get(backend, headers: headers);

    return response;
  }

  @override
  Future forgotPassword({required String email, required String lng}) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future resendEmail({required String email, required String lng}) async {
    final backend = Uri.parse('$url/dusters/resend-email-verification');
    final headers = {
      "Content-Type": "application/json",
      "Accept-Language": lng,
    };
    final body = {"email": email};

    final response = await http.post(
      backend,
      headers: headers,
      body: jsonEncode(body),
    );
    return response;
  }

  @override
  Future signIn({
    required String email,
    required String password,
    required String lng,
  }) async {
    final backend = Uri.parse('$url/dusters/sign-in');
    final headers = {
      "Content-type": 'application/json',
      "Accept-Language": lng,
    };
    final body = {"email": email, "password": password};

    final response = await http.post(
      backend,
      headers: headers,
      body: jsonEncode(body),
    );
    print(response.body);
    return response;
  }

  @override
  Future<http.StreamedResponse> signUp({
    required Map<String, File?> selectedFiles,
    required String name,
    required String surname,
    required String cellphone,
    required String address,
    required double longitude,
    required double latitude,
    required String email,
    required String password,
    required String lng,
    required String postCode,
    required String country,
    required String idNum,
  }) async {
    final backend = Uri.parse('$url/dusters/sign-up');

    // Headers for multipart request
    final headers = {"Accept-Language": lng};

    // Create multipart request
    var request = http.MultipartRequest('POST', backend);
    request.headers.addAll(headers);

    request.fields['name'] = name;
    request.fields['surname'] = surname;
    request.fields['cellphone'] = cellphone;
    request.fields['address'] = address;
    request.fields['coordinates[lat]'] = latitude.toString();
    request.fields['coordinates[lng]'] = longitude.toString();
    request.fields['email'] = email;
    request.fields['password'] = password;
    request.fields['country'] = country;
    request.fields['idNum'] = idNum;

    // Attach files (if available)
    for (var key in selectedFiles.keys) {
      if (selectedFiles[key] != null) {
        // Get the file extension
        String filePath = selectedFiles[key]!.path;
        String fileExtension = filePath.split('.').last.toLowerCase();

        // Determine MIME type
        MediaType contentType;
        if (fileExtension == "pdf") {
          contentType = MediaType('application', 'pdf');
        } else {
          contentType = MediaType('image', 'jpeg');
        }

        request.files.add(
          await http.MultipartFile.fromPath(
            key,
            filePath,
            contentType: contentType,
          ),
        );
      }
    }

    var response = await request.send();
    return response;
  }

  @override
  Future fetchDusterProfile({required String lng}) async {
    final token = SecureStorage.getToken();
    final backend = Uri.parse('$url/dusters/duster-profile');
    final headers = {
      "Content-type": 'application/json',
      "Accept-Language": lng,
      'Cookie': 'jwt=$token',
    };

    final response = await http.get(backend, headers: headers);

    return response;
  }

  @override
  Future fetchDusterBookings({required String lng}) async {
    final token = await SecureStorage.getToken();
    final backend = Uri.parse('$url/dusters/duster-bookings');
    final headers = {
      "Content-type": 'application/json',
      "Accept-Language": lng,
      'Cookie': 'jwt=$token',
    };
    final response = await http.get(backend, headers: headers);

    return response;
  }

  @override
  Future signOut({required String lng}) async {
    final backend = Uri.parse('$url/dusters/sign-out');
    final headers = {
      "Content-type": 'application/json',
      "Accept-Language": lng,
    };
    final response = await http.post(backend, headers: headers);

    return response;
  }
}
