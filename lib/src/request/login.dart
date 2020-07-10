import 'dart:convert';
import 'dart:io';

import '../URLS.dart' as URLS;
import 'package:http/http.dart' as http;

class LoginRequest {
  String email;
  String password;

  LoginRequest({this.email, this.password});

  Future<Map> login() async {
    print(json.encode({"email": this.email, "password": this.password}));
    try {
      var data = await http.post(
        '${URLS.ENVIRON == "production" ? URLS.URLS[1] : URLS.URLS[0]}/user/login',
        body: json.encode({"email": email, "password": password}),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      return json.decode(data.body);
    } catch (err) {
      print(err);
      return null;
    }
  }
}
