class TestLoginModel {
  String? message;
  int? statusCode;
  String? token;

  TestLoginModel({
    this.message,
    this.statusCode,
    this.token,
  });

  factory TestLoginModel.fromJson(Map<String, dynamic> json) {
    return TestLoginModel(
        message: json["message"] as String ?? "",
        statusCode: json["status_code"] as int ?? 0,
        token: json["token"] as String ?? "");
  }
}
