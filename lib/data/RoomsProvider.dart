import 'package:flutter/foundation.dart';
import 'package:flutter_course_project/data/RemoteDataSource.dart';
import 'package:flutter_course_project/models/Room.dart';
import 'package:http/http.dart' as http;

class RoomsProvider extends ChangeNotifier{

  List<Room> rooms;
  RemoteDataSource remoteDataSource = RemoteDataSource();

  RoomsProvider(){
    getRooms();
  }

  Future<void> getRooms() async {
    remoteDataSource.fetchRooms(http.Client()).then((value){
      rooms = value;
      notifyListeners();
    }
    );
  }

  getCount(){
    return rooms.length;
  }
}