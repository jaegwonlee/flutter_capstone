import 'package:exam1/utils/http/models/response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<TestLoginModel> login(String email, String password) async {
  Map data = {"email": email, "password": password};

  http.Response response = await http
      .post(Uri.parse("http://18.207.176.98:8080/auth/login/"), body: data);
  String responseBody = utf8.decoder.convert(response.bodyBytes);
  return TestLoginModel.fromJson(json.decode(responseBody));
}

Future<TestLoginModel> register(
    String email, String password, String ID) async {
  Map data = {"email": email, "password": password, "ID": ID};

  http.Response response = await http
      .post(Uri.parse("http://18.207.176.98:8080/auth/signup/"), body: data);
  String responseBody = utf8.decoder.convert(response.bodyBytes);
  return TestLoginModel.fromJson(json.decode(responseBody));
}
