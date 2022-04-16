import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/pages/profile/activities.dart';
import 'package:gawla/pages/profile/myfriends.dart';
import 'package:gawla/pages/profile/myprofile.dart';
import 'package:gawla/pages/profile/travels.dart';


class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late PageController _pageController;
  int _page = 0;
  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Profile',
          style: TextStyle(
            fontFamily: 'Ubuntu-Regular',
            fontSize: 15,
            color: Colors.black
          ),
        ),
        iconTheme: IconThemeData(
            color: Colors.black
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              InkWell(
                onTap: () {
                  setState(() {
                    navigationTapped(0);
                  });
                  selectItem(0);
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: 0 == selectedItem ? kPrimaryColor : Colors.grey[300],
                  ),
                  child: Center(
                    child: Icon(
                      Feather.user,
                      color: 0 == selectedItem ? Colors.white : Colors.black,
                      size: 15,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    navigationTapped(1);
                  });
                  selectItem(1);
                  print(_page);
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: 1 == selectedItem ? kPrimaryColor : Colors.grey[300],
                  ),
                  child: Center(
                    child: Icon(
                      Feather.users,
                      color: 1 == selectedItem ? Colors.white : Colors.black,
                      size: 15,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    navigationTapped(2);
                  });
                  selectItem(2);
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: 2 == selectedItem ? kPrimaryColor : Colors.grey[300],
                  ),
                  child: Center(
                    child: Icon(
                      Feather.archive,
                      color: 2 == selectedItem ? Colors.white : Colors.black,
                      size: 15,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    navigationTapped(3);
                  });
                  selectItem(3);
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: 3 == selectedItem ? kPrimaryColor : Colors.grey[300],
                    ),
                    child: Center(
                      child: Icon(
                        Feather.clock,
                        color: 3 == selectedItem ? Colors.white : Colors.black,
                        size: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: PageView(
                physics: NeverScrollableScrollPhysics(),
                controller: _pageController,
                onPageChanged: onPageChanged,
                children: [
                  MyProfile(),
                  MyFriends(),
                  Activity(),
                  Travels(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  selectItem(page) {
    setState(() {
      selectedItem = page;
    });
  }
}
