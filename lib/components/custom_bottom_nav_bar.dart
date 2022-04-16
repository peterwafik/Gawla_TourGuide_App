import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/models/tour_model.dart';
import 'package:gawla/pages/navPages/contact_page.dart';
import 'package:gawla/pages/navPages/edit_profile_page.dart';
import 'package:gawla/pages/navPages/home_page.dart';
import 'package:gawla/pages/navPages/profile_page.dart';

import '../constants.dart';
class CustomBottomNavBar extends StatefulWidget {
  const CustomBottomNavBar({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  List pages = [
    HomePage(),
    ProfilePage(),
    ContactPage(),
    SettingsPage()
  ];
  int currentIndex = 0;
  void onTap(int index){ // on tapping any of the 4 below icons an index passed to this function
    setState(() { //the index get saved here
      currentIndex = index; // in the name of this variable
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cubits, CubitStates>(builder: (context, state) {

      //DetailState detail = state as DetailState;
      //SettingsState settings = state as SettingsState;
      switch(currentIndex) {
        case (1): {
          //return BlocProvider.of<Cubits>(context).goHome();

          //LoadedState loaded = state as LoadedState;
          BlocProvider.of<Cubits>(context).goHome();
        }
        break;
        case (2): {
/*
         ProfileState profile = state as ProfileState;
          var tourCreatorInfo = profile.tourCreator;
          Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                    value: BlocProvider.of<Cubits>(context),
                    child: BlocProvider.of<Cubits>(context).profilePage(tourCreatorInfo),
                  )
              )
          );
*/
        }

      break;

      }

      return BottomNavigationBar(
          unselectedFontSize: 0,
          //to avoid the error of tapping the text
          selectedFontSize: 0,
          //to avoid the error of tapping the text
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          onTap: (index) => setState(() => currentIndex = index),
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          // to get rid of the upper line border of the bar
          items: [
            BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home)),
            BottomNavigationBarItem(
                label: "Profile", icon: Icon(Icons.account_circle_outlined)),
            BottomNavigationBarItem(
                label: "Contact", icon: Icon(Icons.chat_outlined)),
            BottomNavigationBarItem(
                label: "Settings", icon: Icon(Icons.settings)),

          ]
      );
    }
    );
  }
}


