import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiProvider {
  ApiProvider();

  Future<http.Response> signIn(
    String email,
    String password,
  ) async {
    String _uri = "https://salty-tundra-72261.herokuapp.com/signin";

    var body = {
      "email": email,
      "password": password,
    };

    return http.post(
      Uri.parse(_uri),
      headers: {
        'Content-Type': "application/json",
        'Accept': "application/json",
      },
      body: jsonEncode(body),
    );
  }

  Future<http.Response> signUp(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    String _uri = "https://salty-tundra-72261.herokuapp.com/signup";

    var body = {
      "name": name,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword
    };

    return http.post(
      Uri.parse(_uri),
      headers: {
        'Content-Type': "application/json",
        'Accept': "application/json",
      },
      body: jsonEncode(body),
    );
  }
}
