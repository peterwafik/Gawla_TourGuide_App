import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_point_tab_bar/pointTabBar.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/tabs/fav_trips.dart';
import 'package:gawla/tabs/mytrips.dart';
import 'package:gawla/widgets/appbar.dart';

class Trips extends StatefulWidget {
  @override
  _TripsState createState() => _TripsState();
}

class _TripsState extends State<Trips> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: header(context),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Flexible(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: TabBar(
                      controller: _tabController,
                      labelPadding: EdgeInsets.symmetric(horizontal: 25),
                      indicatorColor: Color(0xfff3f4f9),
                      indicator: PointTabIndicator(
                        position: PointTabIndicatorPosition.bottom,
                        insets: EdgeInsets.only(bottom: 3),
                        color: kPrimaryColor,
                      ),
                      indicatorWeight: 1.0,
                      isScrollable: true,
                      unselectedLabelColor: Colors.grey,
                      tabs: <Widget>[
                        Tab(
                          child: Text(
                            'My Trips',
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'Ubuntu-Regular'),
                          ),
                        ),
                        Tab(
                          child: Text(
                            'Favorite Trips',
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'Ubuntu-Regular'),
                          ),
                        ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'ON-GOING',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Ubuntu-Regular',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'Pending',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Ubuntu-Regular',
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Center(
                            child: Text(
                              'COMPLETED',
                              style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'Ubuntu-Regular',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(
                        controller: _tabController,
                        children: <Widget>[
                          MyTrips(),
                          FavoriteTrips(),

                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Trips',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    fontFamily: 'Ubuntu-Regular',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
