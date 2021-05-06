import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course_project/models/Room.dart';
import 'package:rating_bar/rating_bar.dart';

class DetailsScreen extends StatelessWidget {

  Room room;
  DetailsScreen(this.room);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Hero(
            tag: room.id,
            child: Image.network(
              room.image,
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Align(
              alignment: Alignment.bottomCenter,
              heightFactor: double.infinity,
              widthFactor: double.infinity,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.white.withOpacity(0.9),
                ),
                height: 180,
                width: 320,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(left: 8),
                              child: Text(
                                room.title,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Column(
                              children: [
                                Text("\$${room.price}",
                                    style: TextStyle(
                                        color: Colors.deepPurpleAccent,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold)),
                                Text(
                                  "/per night",
                                  style: TextStyle(
                                      color: Colors.black38, fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:17.0, top: 8),
                          child: RatingBar.readOnly(
                            initialRating: room.rating,
                            isHalfAllowed: true,
                            filledColor: Colors.deepPurpleAccent,
                            halfFilledIcon: Icons.star_half,
                            filledIcon: Icons.star,
                            emptyIcon: Icons.star_border,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_pin,
                            color: Colors.black38,
                            size: 16,
                          ),
                          Text(room.location,
                              style: TextStyle(color: Colors.black45)),
                          Padding(
                            padding: const EdgeInsets.only(left: 110.0),
                            child: Icon(Icons.favorite),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
