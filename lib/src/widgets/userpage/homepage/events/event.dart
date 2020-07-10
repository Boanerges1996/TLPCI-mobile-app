import 'dart:convert';

import 'package:church_app/src/provider/allEventsProvider.dart';
import 'package:church_app/src/request/fetchAllEvents.dart';
import 'package:church_app/src/widgets/userpage/homepage/events/EventCard.dart';
import 'package:church_app/src/widgets/userpage/homepage/events/addEvent.dart';
import 'package:church_app/src/widgets/userpage/homepage/events/eventBuilder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Events extends StatefulWidget {
  @override
  _EventsState createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          PostEvent(),
          // EventCard(),
          EventBuilder(),
        ],
      ),
    );
  }
}
