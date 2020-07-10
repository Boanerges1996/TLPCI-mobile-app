import 'package:cached_network_image/cached_network_image.dart';
import 'package:church_app/src/provider/selectedEvent.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class SingleEventPage extends StatefulWidget {
  @override
  _SingleEventPageState createState() => _SingleEventPageState();
}

class _SingleEventPageState extends State<SingleEventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event"),
        backgroundColor: Colors.pink,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            title(context),
            image(context),
            content(),
            authorAndDate()
          ],
        ),
      ),
    );
  }

  Widget image(context) {
    SelectedEvent event = Provider.of<SelectedEvent>(context);
    return Card(
      child: CachedNetworkImage(
        imageUrl: event.getSelectedEvent["url"],
        height: 300,
      ),
    );
  }

  Widget title(context) {
    SelectedEvent event = Provider.of<SelectedEvent>(context);
    return Center(
      child: Text(
        event.getSelectedEvent["title"],
        style: GoogleFonts.lateef(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget content() {
    SelectedEvent event = Provider.of<SelectedEvent>(context);
    return Container(
      margin: EdgeInsets.all(10),
      child: Text(
        event.getSelectedEvent["content"],
        style: GoogleFonts.lato(fontSize: 20),
      ),
    );
  }

  Widget authorAndDate() {
    SelectedEvent event = Provider.of<SelectedEvent>(context);
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "Author: " + event.getSelectedEvent["author"],
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.right,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              "Date:   " + DateFormat.yMMMMEEEEd().format(new DateTime.now()),
              style: TextStyle(color: Colors.grey),
              textAlign: TextAlign.right,
            ),
          ),
        ],
      ),
    );
  }
}
