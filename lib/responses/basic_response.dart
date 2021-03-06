class BasicResponse {
  final bool success;
  final int statusCode;
  final String code;
  final String message;
  dynamic data;

  BasicResponse({this.success, this.statusCode, this.code, this.message, this.data});

  factory BasicResponse.fromJson(Map<String, dynamic> json) {
    return BasicResponse(
      success: json['success'],
      statusCode: json['statusCode'],
      code: json['code'],
      message: json['message'],
      data: json['data'],
    );
  }
}
