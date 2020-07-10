class EventModel {
  String title;
  String body;
  String url;
  String date;
  String author;
  EventModel({this.title, this.body, this.date, this.url, this.author});
  EventModel.fromJson(parsedJson) {
    title = parsedJson["title"];
    body = parsedJson["body"];
    url = parsedJson["url"];
    date = parsedJson["author"];
  }
}
