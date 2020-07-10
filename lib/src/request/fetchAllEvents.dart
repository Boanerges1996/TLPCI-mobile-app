import 'dart:convert';
import 'dart:io';

import 'package:church_app/src/models/event.dart';

import '../URLS.dart' as URLS;
import 'package:http/http.dart' as http;

class AllEvents {
  List<EventModel> events = [];
  Future getAllEvents() async {
    try {
      var data = await http.get(
        '${URLS.ENVIRON == "production" ? URLS.URLS[1] : URLS.URLS[0]}/event/get/all',
      );
      List info = json.decode(data.body);
      // print(info);
      info.forEach((e) {
        print(e);
        events.add(EventModel(
            author: e["author"],
            body: e["content"],
            date: e["createdAt"],
            title: e["title"],
            url: e["url"]));
      });
      return events;
    } catch (err) {
      print(err);
      return null;
    }
  }
}
