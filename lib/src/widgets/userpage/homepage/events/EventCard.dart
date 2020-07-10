import 'package:cached_network_image/cached_network_image.dart';
import 'package:church_app/src/provider/selectedEvent.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class EventCard extends StatelessWidget {
  final String url;
  final String title;
  final String content;
  final String author;

  EventCard({this.url, this.title, this.content, this.author});

  @override
  Widget build(BuildContext context) {
    SelectedEvent data = Provider.of<SelectedEvent>(context);
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: url,
              width: double.infinity,
              height: 250,
            ),
            Container(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Text(
                content,
                overflow: TextOverflow.clip,
                maxLines: 3,
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_right,
                color: Colors.blue,
              ),
              title: Text(
                "Read more",
                style: TextStyle(color: Colors.blue),
              ),
              onTap: () {
                Map info = {
                  "author": author,
                  "url": url,
                  "content": content,
                  "title": title
                };

                data.setEvent(info);
                Navigator.of(context).pushNamed("/selected/event");
              },
            )
          ],
        ),
      ),
    );
  }

  Widget writtenPart(context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[],
        ),
      ),
    );
  }
}
