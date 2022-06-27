import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/pages/navPages/profile_page.dart';

AppBar header(context) {
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    leading: Builder(
      builder: (context) => InkWell(
        child: IconButton(
          padding: const EdgeInsets.only(top: 10.0),
          icon: Icon(Icons.subject,color: Colors.black),
          onPressed: () => Scaffold.of(context).openDrawer(),//make it open the drawer
        ),
        onTap: ()=> print("tapped"),
      ),
    ),

    title: Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(context,MaterialPageRoute(builder: (context) {
                return ProfilePage();
              },
              ),
              );
            },
            child: CircleAvatar(
              radius: 17,
              backgroundColor: kPrimaryColor,
              backgroundImage: AssetImage('assets/img/user.png'),
            ),
          ),
          SizedBox(width: 20),
          Container(
            height: 35,
            width: 160,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                children: [
                  SizedBox(width: 3),
                  Icon(
                    Feather.search,
                    color: Colors.black,
                    size: 20,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: TextField(
                      decoration: InputDecoration.collapsed(
                        hintText: 'Search...',
                        hintStyle: TextStyle(fontSize: 14, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
    actions: [
      InkWell(
        onTap: () => print('tapped!'),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 17.0, horizontal: 10),
          child: Stack(
            children: <Widget>[
              Icon(
                CupertinoIcons.bell,
                color: Colors.black,
                size: 30,
                //  color: Colors.black,
              ),
              Positioned(
                top: 5,
                right: 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.transparent,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: new Offset(0.0, 0.0),
                        blurRadius: 2.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(0.5),
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
