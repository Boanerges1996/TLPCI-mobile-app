import 'package:flutter/material.dart';

class PostEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          "Post Event",
          style: TextStyle(color: Colors.blue),
        ),
        leading: Icon(
          Icons.add,
          color: Colors.blue,
        ),
        onTap: () {
          Navigator.of(context).pushNamed("/post/event");
        },
      ),
    );
  }
}
