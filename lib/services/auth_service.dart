// Core packages.
import 'dart:convert';
import 'dart:io';

// Extension packages.
import 'package:http/http.dart' as http;

// Couvee packages.
import 'package:couvee/services/app_service.dart';
import 'package:couvee/responses/basic_response.dart';
import 'package:couvee/responses/auth_response.dart';

class AuthService {
  static const jwtApiUrl = AppService.jwtApiUrl;
  static const apiUrl = AppService.couveeApiUrl;

  Future<BasicResponse> checkAccountAvailability(username) async {
    try {
      final response = await http.get(
        apiUrl + '/account/check/availability/?username=$username',
      );

      if (response.statusCode == 200 ||
          response.statusCode == 401 ||
          response.statusCode == 403) {
        return BasicResponse.fromJson(json.decode(response.body));
      } else {
        return BasicResponse(success: false, message: "Something went wrong!");
      }
    } on SocketException {
      return BasicResponse(success: false, message: "No internet connection");
    }
  }

  Future<BasicResponse> sendOtp(phone, action, subAction) async {
    final response = await http.post(
      apiUrl + '/otp/send/',
      body: {'phone': phone, 'action': action, 'sub_action': subAction},
    );

    if (response.statusCode != 200) {
      print(response.body);
    }

    return BasicResponse.fromJson(json.decode(response.body));
  }

  Future<AuthResponse> register(data) async {
    final response = await http.post(
      apiUrl + '/register/',
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
      jwtApiUrl + '/token',
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
