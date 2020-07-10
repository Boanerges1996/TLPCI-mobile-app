import 'package:flutter/material.dart';

class UserData extends ChangeNotifier {
  Map _info = {
    "logged": false,
    "url": "",
    "email": "",
    "username": "",
  };
  Map get getUserInfo => _info;
  void setInfo(Map data) {
    _info = {
      ..._info,
      ...data,
    };
    notifyListeners();
  }
}
