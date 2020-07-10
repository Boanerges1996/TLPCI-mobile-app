import 'package:flutter/material.dart';

class SelectedEvent extends ChangeNotifier {
  Map _data = {
    "author": "",
    "url": "",
    "content": "",
    "title": "",
  };
  Map get getSelectedEvent => _data;
  void setEvent(Map data) {
    _data = data;
  }
}
