import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class MyTrips extends StatefulWidget {
  @override
  _MyTripsState createState() => _MyTripsState();
}

class _MyTripsState extends State<MyTrips> {
  List images = [
    "user1.jpg",
    "user2.jpg",
    "user3.jpg",
    "user4.jpg",
    "user5.jpg"
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 2,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        //Map datar = data[index];
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Tour Card
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage("assets/img/mountain.jpeg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    //the place card internal decorations created using the below 3 widgets
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Icon(
                              Feather.map_pin,
                              size: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'places',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: 'Ubuntu-Regular',
                              ),
                            ),
                            Spacer(),
                            Text(
                              Random().nextInt(2000).toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: 'Ubuntu-Regular',
                              ),
                            ),
                            SizedBox(width: 5),
                            Text(
                              'likes',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: 'Ubuntu-Regular',
                              ),
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Feather.heart,
                              size: 15,
                              color: Colors.white,
                            ),
                            SizedBox(width: 5),
                            Icon(
                              Icons.share,
                              size: 15,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    ),
                    Spacer(),
                    Align(alignment: Alignment.center,child: Text("15",style: const TextStyle(fontSize:50,fontWeight: FontWeight.bold,color: Colors.white))),
                    Spacer(),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'oct 01, 2019 - oct 21, 2019 ',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: 'Ubuntu-Regular',
                              ),
                            ),
                            Text(
                              '13 DAYS / 14 NIGHTS',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Ubuntu-Regular',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),
              /*
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Nature',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Ubuntu-Regular',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Resort',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Ubuntu-Regular',
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Adventure',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Ubuntu-Regular',
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),*/
              //"Tour users" text
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Text(
                  'Tour users',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Ubuntu-Regular',
                  ),
                ),
              ),
              SizedBox(height: 20),
              //users circles
              Container(
                height: 50,
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    //Map datar = data[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage("assets/img/"+images[index]) //to be converted to a list of users to show all
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
