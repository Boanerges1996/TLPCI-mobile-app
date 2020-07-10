import 'dart:convert';
import 'dart:io';

import '../URLS.dart' as URLS;
import 'package:http/http.dart' as http;

class SignUpRequest {
  String name;
  String email;
  String password;
  String username;
  SignUpRequest({this.email, this.name, this.password, this.username});

  Future<Map> signup() async {
    print(json.encode({"email": this.email, "password": this.password}));
    try {
      var data = await http.post(
        '${URLS.ENVIRON == "production" ? URLS.URLS[1] : URLS.URLS[0]}/user/register',
        body: json.encode({
          "email": email,
          "password": password,
          "username": username,
          "name": name,
        }),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      return json.decode(data.body);
    } catch (err) {
      print(err);
      return null;
    }
  }
}
