import 'package:church_app/src/models/event.dart';
import 'package:flutter/material.dart';

class AllEventsProvider extends ChangeNotifier {
  List<EventModel> _events = [];

  List<EventModel> get getAllEvents => _events;

  void setEvents(var info) {
    _events = info;
    notifyListeners();
  }
}
