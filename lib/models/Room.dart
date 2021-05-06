import 'dart:convert';

class Room {
  String id;
  String image;
  String title;
  String price;
  String sale;
  double rating;
  String location;
  String description;

  Room({this.id,
    this.image,
    this.title,
    this.price,
    this.sale,
    this.rating,
    this.location,
    this.description});

  Room.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    title = json['title'];
    price = json['price'];
    sale = json['sale'];
    rating = json['rating'];
    location = json['location'];
    description = json['description'];
  }


  static List<Room> parseRooms(String responseBody) {
    final parsed = jsonDecode(responseBody);
    return parsed.map<Room>((json) => Room.fromJson(json)).toList();
  }
}