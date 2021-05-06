import 'package:flutter_course_project/models/Destination.dart';
import 'package:flutter_course_project/models/Room.dart';
import 'package:http/http.dart' as http;

class RemoteDataSource {

  final destinationsURL =
      "https://608d4294fe2e9c00171e16f1.mockapi.io/destination";
  final roomsURL = "https://608d4294fe2e9c00171e16f1.mockapi.io/rooms";

  RemoteDataSource._privateConstructor();

  static final RemoteDataSource _instance = RemoteDataSource._privateConstructor();

  factory RemoteDataSource() {
    return _instance;
  }

  Future<List<Room>> fetchRooms(http.Client client) async {
    final response = await client.get(Uri.parse(roomsURL));
    if (response.statusCode == 200) {
      return Room.parseRooms(response.body);
    } else {
      throw Exception("Connection Error");
    }
  }

  Future<List<Destination>> fetchDestinations(http.Client client) async {
    final response = await client.get(Uri.parse(destinationsURL));
    if (response.statusCode == 200) {
      return Destination.parseDestination(response.body);
    } else {
      throw Exception("Connection Error");
    }
  }

}
