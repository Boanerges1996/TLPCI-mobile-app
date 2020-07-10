import 'dart:convert';
import 'dart:io';

import '../URLS.dart' as URLS;
import 'package:http/http.dart' as http;

class PostEventRequest {
  String author;
  String content;
  String title;
  String locality;
  String url;
  String id;

  PostEventRequest(
      {this.author,
      this.content,
      this.locality,
      this.title,
      this.url,
      this.id});
  Future<Map> registerEvent() async {
    try {
      var data = await http.post(
        '${URLS.ENVIRON == "production" ? URLS.URLS[1] : URLS.URLS[0]}/event/register/$id',
        body: json.encode({
          "author": author,
          "content": content,
          "title": title,
          "locality": locality,
          "url": url
        }),
        headers: {HttpHeaders.contentTypeHeader: 'application/json'},
      );
      print(json.decode(data.body));
      return json.decode(data.body);
    } catch (err) {
      print(err);
      return null;
    }
  }
}
