import 'dart:convert';

class Destination {
  String title;
  String image;

  Destination({this.title, this.image});

  Destination.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
  }

  static List<Destination> parseDestination(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return parsed
        .map<Destination>((json) => Destination.fromJson(json))
        .toList();
  }
}
