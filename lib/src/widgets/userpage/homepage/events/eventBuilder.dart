import 'dart:convert';

import 'package:church_app/src/models/event.dart';
import 'package:church_app/src/provider/allEventsProvider.dart';
import 'package:church_app/src/request/fetchAllEvents.dart';
import 'package:church_app/src/widgets/userpage/homepage/events/EventCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventBuilder extends StatefulWidget {
  @override
  _EventBuilderState createState() => _EventBuilderState();
}

var jsondata = """
[
  {
    "url": "https://images.sharefaith.com/images/3/1356674523178_26/img_mouseover3.jpg",
    "title": "Holy Ghost Party",
    "content": "lay your burdens down right now, let your worries fly away right now, cause we bout to turn up in this place, our problems are nothing to His grace, everything gonna be alright, alright, It's a Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party,lay your burdens down right now, let your worries fly away right now, cause we bout to turn up in this place, our problems are nothing to His grace, everything gonna be alright, alright, It's a Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party,",
    "author":"Samson Kwaku Nkrumah",
    "date":"2020-12-12"
  },
  {
    "url": "https://images.sharefaith.com/images/3/1356674523178_26/img_mouseover3.jpg",
    "title": "Holy Ghost Party",
    "content": "lay your burdens down right now, let your worries fly away right now, cause we bout to turn up in this place, our problems are nothing to His grace, everything gonna be alright, alright, It's a Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party,lay your burdens down right now, let your worries fly away right now, cause we bout to turn up in this place, our problems are nothing to His grace, everything gonna be alright, alright, It's a Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party,",
    "author":"Samson Kwaku Nkrumah",
    "date":"2020-12-12"
  },
  {
    "url": "https://images.sharefaith.com/images/3/1356674523178_26/img_mouseover3.jpg",
    "title": "Holy Ghost Party",
    "content": "lay your burdens down right now, let your worries fly away right now, cause we bout to turn up in this place, our problems are nothing to His grace, everything gonna be alright, alright, It's a Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party,lay your burdens down right now, let your worries fly away right now, cause we bout to turn up in this place, our problems are nothing to His grace, everything gonna be alright, alright, It's a Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party,",
    "author":"Samson Kwaku Nkrumah",
    "date":"2020-12-12"
  },
  {
    "url": "https://images.sharefaith.com/images/3/1356674523178_26/img_mouseover3.jpg",
    "title": "Holy Ghost Party",
    "content": "lay your burdens down right now, let your worries fly away right now, cause we bout to turn up in this place, our problems are nothing to His grace, everything gonna be alright, alright, It's a Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party,lay your burdens down right now, let your worries fly away right now, cause we bout to turn up in this place, our problems are nothing to His grace, everything gonna be alright, alright, It's a Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party,",
    "author":"Samson Kwaku Nkrumah",
    "date":"2020-12-12"
  },
  {
    "url": "https://images.sharefaith.com/images/3/1356674523178_26/img_mouseover3.jpg",
    "title": "Holy Ghost Party",
    "content": "lay your burdens down right now, let your worries fly away right now, cause we bout to turn up in this place, our problems are nothing to His grace, everything gonna be alright, alright, It's a Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party,lay your burdens down right now, let your worries fly away right now, cause we bout to turn up in this place, our problems are nothing to His grace, everything gonna be alright, alright, It's a Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party,",
    "author":"Samson Kwaku Nkrumah",
    "date":"2020-12-12"
  },
  {
    "url": "https://images.sharefaith.com/images/3/1356674523178_26/img_mouseover3.jpg",
    "title": "Holy Ghost Party",
    "content": "lay your burdens down right now, let your worries fly away right now, cause we bout to turn up in this place, our problems are nothing to His grace, everything gonna be alright, alright, It's a Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party,lay your burdens down right now, let your worries fly away right now, cause we bout to turn up in this place, our problems are nothing to His grace, everything gonna be alright, alright, It's a Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, Holy Ghost Party tonight, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party, cause a Holy Ghost Party don’t stop, ain’t no party like a Holy Ghost Party,",
    "author":"Samson Kwaku Nkrumah",
    "date":"2020-12-12"
  }
]

""";

class _EventBuilderState extends State<EventBuilder> {
  List<EventModel> events = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchEvents();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getAllEvents();
  }

  void getAllEvents() async {
    AllEventsProvider events =
        Provider.of<AllEventsProvider>(context, listen: false);

    var eventClass = AllEvents();
    var fetchedEvents = await eventClass.getAllEvents();
    events.setEvents(fetchedEvents);
    print(events);
  }

  void fetchEvents() {
    List data = json.decode(jsondata);
    List<EventModel> m = [];
    data.forEach((element) {
      // print(element);
      m.add(
        EventModel(
          author: element["author"],
          body: element["content"],
          date: element["date"],
          url: element["url"],
          title: element["title"],
        ),
      );
    });
    setState(() {
      events = m;
    });
  }

  @override
  Widget build(BuildContext context) {
    AllEventsProvider eventss = Provider.of<AllEventsProvider>(context);
    return Expanded(
      child: ListView.builder(
        itemCount: eventss.getAllEvents.length,
        itemBuilder: (_, int index) {
          return Container(
            child: EventCard(
              content: eventss.getAllEvents[index].body,
              title: eventss.getAllEvents[index].title,
              url: eventss.getAllEvents[index].url,
              author: events[index].author,
            ),
          );
        },
      ),
    );
  }
}
