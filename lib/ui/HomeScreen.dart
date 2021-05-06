import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_course_project/data/DestinationsProvider.dart';
import 'package:flutter_course_project/data/RoomsProvider.dart';
import 'package:flutter_course_project/ui/DetailsScreen.dart';
import 'package:provider/provider.dart';
import 'package:rating_bar/rating_bar.dart';
import 'package:http/http.dart' as http;

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white10,
        elevation: 0,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.airplanemode_active),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.supervised_user_circle),
            label: '',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.deepPurpleAccent,
        // unselectedItemColor:Colors.black38 ,
        backgroundColor: Colors.white.withOpacity(0.9),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Destinations",
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  "See More",
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
            SizedBox(
              height: 300,
              child: ChangeNotifierProvider<DestinationsProvider>(
                  create: (_) => DestinationsProvider(),
                  child: Consumer<DestinationsProvider>(
                    builder: (buildContext, destinationProvider, _) {
                      if (destinationProvider.destinations != null) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.only(top: 12),
                          itemCount: destinationProvider.getCount(),
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: FadeInImage(
                                          placeholder: AssetImage(
                                              "assets/images/placeholder.jpg"),
                                          image: NetworkImage(
                                            destinationProvider
                                                .destinations[index].image,
                                          ),
                                        )),
                                    Text(
                                      destinationProvider
                                          .destinations[index].title,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 60,
                                          fontFamily: 'Elegant'),
                                    ),
                                  ]),
                            );
                          },
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14.0, bottom: 12.0),
              child: Text("Recommended Rooms", style: TextStyle(fontSize: 20)),
            ),
            ChangeNotifierProvider<RoomsProvider>(
                create: (_) => RoomsProvider(),
                child: Consumer<RoomsProvider>(
                  builder: (buildContext, roomsProvider, _) {
                    if (roomsProvider.rooms != null) {
                      return ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: roomsProvider.getCount(),
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailsScreen(
                                          roomsProvider.rooms[index])),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                          spreadRadius: 2,
                                          blurRadius: 3,
                                          offset: Offset(0, 6),
                                          color: Colors.grey.withOpacity(0.2))
                                    ]),
                                child: Column(
                                  children: [
                                    ClipRRect(
                                      child: Hero(
                                          tag: roomsProvider.rooms[index].id,
                                          child: Image.network(roomsProvider
                                              .rooms[index].image)),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            roomsProvider.rooms[index].title,
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black38,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        children: [
                                          Text(
                                              "\$${roomsProvider.rooms[index].price}",
                                              style: TextStyle(
                                                  color: Colors.black38,
                                                  fontWeight: FontWeight.bold)),
                                          Text("/night",
                                              style: TextStyle(
                                                  color: Colors.black38)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 12),
                                            child: RatingBar.readOnly(
                                              initialRating: roomsProvider
                                                  .rooms[index].rating,
                                              isHalfAllowed: true,
                                              filledColor: Colors.amberAccent,
                                              halfFilledIcon: Icons.star_half,
                                              filledIcon: Icons.star,
                                              emptyIcon: Icons.star_border,
                                              size: 25,
                                            ),
                                          ),
                                          Text(
                                            roomsProvider.rooms[index].rating
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black38),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ))
          ],
        ),
      ),
    );
  }
}
