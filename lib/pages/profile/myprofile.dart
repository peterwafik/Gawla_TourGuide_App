import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gawla/widgets/profile_widgets/numbers_widget.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
          child: Container(
            height: MediaQuery.of(context).size.height/2.9,
            // color: Colors.green,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  height: 150,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                          image: AssetImage('assets/img/mountain.jpeg'),
                          fit: BoxFit.cover)),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height/9,
                  left: MediaQuery.of(context).size.width / 3,
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
                      padding: const EdgeInsets.all(1.0),
                      child: CircleAvatar(
                        radius: 55,
                        backgroundImage:
                            AssetImage('assets/Authentication/images/signup_top.png'),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 6,

                  right: 10,
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Feather.edit_2,
                        size: 15,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3.8,

                  left: MediaQuery.of(context).size.width / 2.8,
                  child: Text(
                    'Charlotte',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Ubuntu-Regular',
                      fontWeight: FontWeight.bold,
                      fontSize: 23,

                    ),
                  ),
                ),
                SizedBox(
                  height: 5
                ),
                Positioned(
                  top: MediaQuery.of(context).size.height / 3.2,
                  right: MediaQuery.of(context).size.width / 5,
                  child: Text(
                    'Adventure lover | Traveler | Artist',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Ubuntu-Regular',
                      fontSize: 13,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        NumbersWidget(),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10),
          child: ListTile(
            visualDensity: VisualDensity(vertical: -4),
            title: Text(
              'Email',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Ubuntu-Regular',
                fontWeight: FontWeight.bold,
                // color: Colors.black54
              ),
            ),
            subtitle: Text(
              'charlotte@gmail.com',
              style: TextStyle(
                  // color: Colors.black,
                  fontFamily: 'Ubuntu-Regular',
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Feather.mail,
              // color: Colors.black,
              size: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10.0),
          child: ListTile(
            title: Text(
              'Mobile Number',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Ubuntu-Regular',
                fontWeight: FontWeight.bold,
                // color: Colors.black54
              ),
            ),
            subtitle: Text(
              '+229 663 962 47',
              style: TextStyle(
                  // color: Colors.black,
                  fontFamily: 'Ubuntu-Regular',
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Feather.phone_call,
              // color: Colors.black,
              size: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10),
          child: ListTile(
            title: Text(
              'D.O.B',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Ubuntu-Regular',
                fontWeight: FontWeight.bold,
                // color: Colors.black54
              ),
            ),
            subtitle: Text(
              'Oct 20, 1999',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                // color: Colors.black,
                fontFamily: 'Ubuntu-Regular',
              ),
            ),
            trailing: Icon(
              Icons.cake,
              // color: Colors.black,
              size: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10),
          child: ListTile(
            title: Text(
              'Gender',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Ubuntu-Regular',
                fontWeight: FontWeight.bold,
                // color: Colors.black54
              ),
            ),
            subtitle: Text(
              'Male',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu-Regular',
                // color: Colors.black,
              ),
            ),
            trailing: Icon(
              Feather.users,
              // color: Colors.black,
              size: 20,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 10.0),
          child: ListTile(
            title: Text(
              'Nationality',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'Ubuntu-Regular',
                fontWeight: FontWeight.bold,
                // color: Colors.black54
              ),
            ),
            subtitle: Text(
              'German',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu-Regular',
                // color: Colors.black,
              ),
            ),
            trailing: Icon(
              Feather.flag,
              // color: Colors.black,
              size: 20,
            ),
          ),
        ),
      ],
    );
  }
}
