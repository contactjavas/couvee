// Core packages.
import 'dart:convert';

// Extension packages.
import 'package:http/http.dart' as http;

// Couvee packages.
import 'package:couvee/responses/basic_response.dart';
import 'package:couvee/responses/auth_response.dart';

class AuthService {
  static const apiUrl = 'https://points.couvee.co.id/wp-json/jwt-auth/v1';
  static const openApiUrl = 'https://points.couvee.co.id/wp-json/couvee/v1';

  Future<BasicResponse> checkAccountAvailability(username) async {
    final response = await http.get(
      openApiUrl + '/account/check/availability/?username=$username',
    );

    if (response.statusCode != 200) {
      print(response.body);
    }

    return BasicResponse.fromJson(json.decode(response.body));
  }

  Future<BasicResponse> sendOtp(phone, action, subAction) async {
    final response = await http.post(
      openApiUrl + '/otp/send/',
      body: {'phone': phone, 'action': action, 'sub_action': subAction},
    );

    if (response.statusCode != 200) {
      print(response.body);
    }

    return BasicResponse.fromJson(json.decode(response.body));
  }

  Future<AuthResponse> register(data) async {
    final response = await http.post(
      openApiUrl + '/register/',
      body: {
        'otp': data.otp,
        'phone': data.phone,
        'pin': data.pin,
        'name': data.name,
        'birthday': data.birthday,
        'referrer': data.referrer,
      },
    );

    if (response.statusCode != 200) {
      print(response.body);
    }

    return AuthResponse.fromJson(json.decode(response.body));
  }

  Future<AuthResponse> login(phone, otp) async {
    final response = await http.post(
      apiUrl + '/token',
      body: {
        'username': phone,
        'password': otp,
        'custom_auth': 'true',
      },
    );

    if (response.statusCode != 200) {
      print(response.body);
    }

    return AuthResponse.fromJson(json.decode(response.body));
  }
}
