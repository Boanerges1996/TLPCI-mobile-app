class UserDetails {
  String name;
  String username;
  String locality;
  String url;
  bool isLogged;
  bool isPastor;
  bool isHead;
  UserDetails(
      {this.name,
      this.username,
      this.locality,
      this.url,
      this.isLogged,
      this.isHead,
      this.isPastor});
  UserDetails.fromJson(parsedJson) {
    name = parsedJson["name"];
    username = parsedJson["username"];
    locality = parsedJson["locality"];
    url = parsedJson["url"];
    isLogged = parsedJson["logged"];
    isHead = parsedJson["isHead"];
    isPastor = parsedJson["isPastor"];
  }
}
