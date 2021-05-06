import 'package:flutter/foundation.dart';
import 'package:flutter_course_project/data/RemoteDataSource.dart';
import 'package:flutter_course_project/models/Destination.dart';
import 'package:http/http.dart' as http;

class DestinationsProvider extends ChangeNotifier{
  List<Destination> destinations;
  RemoteDataSource remoteDataSource = RemoteDataSource();

  DestinationsProvider(){
    print("destination provider created ${DateTime.now().second}");
    getDestinations();
  }

  Future<void> getDestinations() async {
    remoteDataSource.fetchDestinations(http.Client()).then((value){
      destinations = value;
      notifyListeners();
    }
    );
  }

  getCount(){
    return destinations.length;
  }
}