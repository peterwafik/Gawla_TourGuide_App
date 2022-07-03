import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gawla/components/sidebar.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/models/tour_model.dart';
import 'package:gawla/pages/create_tour_page.dart';
import 'package:gawla/pages/navPages/contact_page.dart';
import 'package:gawla/pages/navPages/explore.dart';
import 'package:gawla/pages/navPages/newsfeed.dart';
import 'package:gawla/pages/navPages/profile_page.dart';
import 'package:gawla/pages/navPages/trips.dart';
import 'package:gawla/widgets/appbar.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  late PageController _pageController;
  int _page = 0;
  int selectedItem = 0;

  final GlobalKey<ScaffoldState> _key = GlobalKey(); // Create a key
  @override
  Widget build(BuildContext context) {
    //****** Controller declaration ******//
    TabController _tabController = TabController(length: 5, vsync: this);
    //Controller usage: so that every time i click a button, it gets rebuild
    //so i need to refer to a context which is represented by "vsync"
    return Scaffold(
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {  BlocProvider.of<Cubits>(context).goCreateTour(); },
        backgroundColor: Colors.black,
        mini: true,
        child: Icon(Icons.add),

      ),*/

      appBar: header(context),
      key: _key,
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: BlocBuilder<Cubits,CubitStates>(
        builder: (context, state){
          if(state is LoadedState){
            List<TourModel> tourInfo = state.tours;
            var tourCreatorInfo = state.tourCreators;

            return PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: onPageChanged,
              children: [
                NewsFeed(),
                Explore(),
                Trips(),
                ContactPage(),
                CreateTourPage(),
              ],
            );
          }else{
            return Container();
          }
        },
      ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0.0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10.0, left: 15),
            child: Row(
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
                        Feather.home,
                        color: 0 == selectedItem ? Colors.white : Colors.black,
                        size: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
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
                        Feather.compass,
                        color: 1 == selectedItem ? Colors.white : Colors.black,
                        size: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
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
                        Feather.clipboard,
                        color: 2 == selectedItem ? Colors.white : Colors.black,
                        size: 15,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    setState(() {
                      navigationTapped(3);
                    });
                    selectItem(3);
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: 3 == selectedItem ? kPrimaryColor : Colors.grey[300],
                    ),
                    child: Center(
                      child: Icon(
                        Feather.smartphone,
                        color: 3 == selectedItem ? Colors.white : Colors.black,
                        size: 15,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    setState(() {
                      navigationTapped(4);
                    });
                    //selectItem(4);
                    //print(_page);
                    BlocProvider.of<Cubits>(context).goCreateTour();
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20.0),
                    child: Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black,
                      ),
                      child: Center(
                        child: Icon(
                          Feather.plus,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
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

