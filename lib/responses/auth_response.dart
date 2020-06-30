class AuthResponse {
  final bool success;
  final int statusCode;
  final String code;
  final String message;
  final UserData data;

  AuthResponse({this.success, this.statusCode, this.code, this.message, this.data});

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    bool hasData = json['data'].isNotEmpty ? true : false;

    UserData userData = UserData(
      token: hasData ? json['data']['token'] : '',
      id: hasData ? json['data']['id'] : 0,
      email: hasData ? json['data']['email'] : '',
      firstName: hasData ? json['data']['firstName'] : '',
      lastName: hasData ? json['data']['lastName'] : '',
      displayName: hasData ? json['data']['displayName'] : '',
      birthday: hasData ? json['data']['birthday'] : '',
      phone: hasData ? json['data']['phone'] : '',
      pin: hasData ? json['data']['pin'] : '',
      points: hasData ? json['data']['points'] : 0,
    );

    return AuthResponse(
      success: json['success'],
      statusCode: json['statusCode'],
      code: json['code'],
      message: json['message'],
      data: userData,
    );
  }
}

class UserData {
  final String token;
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String displayName;
  final String birthday;
  final String phone;
  final String pin;
  final int points;

  UserData({
    this.token,
    this.id,
    this.email,
    this.firstName,
    this.lastName,
    this.displayName,
    this.birthday,
    this.phone,
    this.pin,
    this.points,
  });
}
