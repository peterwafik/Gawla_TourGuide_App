import 'dart:ffi';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gawla/components/sidebar.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/misc/colors.dart';
import 'package:gawla/models/data_model.dart';
import 'package:gawla/models/tour_model.dart';
import 'package:gawla/pages/navPages/contact_page.dart';
import 'package:gawla/pages/navPages/edit_profile_page.dart';
import 'package:gawla/pages/navPages/profile_page.dart';
import 'package:gawla/widgets/app_large_text.dart';
import 'package:gawla/widgets/app_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
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
    //****** Controller declaration ******//
    TabController _tabController = TabController(length: 2, vsync: this);
    //Controller usage: so that every time i click a button, it gets rebuild
    //so i need to refer to a context which is represented by "vsync"
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,//to remove the shadow beneath
        leading: IconButton(
          icon: Image.asset("assets/img/sidebar.png",width: 27,),
          color: Colors.black,
          onPressed: () {  },
        ),
        actions: [
          UnconstrainedBox(
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15)
              ),
              child: Image.asset("assets/img/moon.png",width: 27,),
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: BlocBuilder<Cubits,CubitStates>(
        builder: (context, state){
          if(state is LoadedState){
            List<TourModel> tourInfo = state.tours;
             var tourCreatorInfo = state.tourCreators;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //*************The Header***********//
                  /*Container(
                    padding: const EdgeInsets.only(top: 70, left: 20),
                    child: Row(
                      children: [
                        /*Icon(
                    Icons.menu_rounded,
                    size: 30,
                    color: Colors.black54,
                  ),*/
                        Expanded(child: Container()),
                        Container(
                          margin: const EdgeInsets.only(right: 20),
                          //to put a margin between the image and the right
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                            //since we are going to border the box
                            image: DecorationImage(
                                image: NetworkImage(tourInfo[1].img),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey.withOpacity(0.5),

                          ),
                        )
                      ],
                    ),
                  ),
                  */
                  SizedBox(
                    height: 10,
                  ),
                  //**********"Tours" text********//
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: AppLargeText(text: "Welcome "+tourCreatorInfo[1].firstName +" !"),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [BoxShadow(
                        color: Colors.grey.shade300,
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0,3),
                      ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        prefixIcon: Container(
                          padding: EdgeInsets.all(12),
                            child: Image.asset("assets/img/search.png",width: 24,)
                        ),
                        border: InputBorder.none
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  //***********Advertisement panel***********//
                  Container(
                    height: 210,
                    child: ListView(
                      children: <Widget>[
                        CarouselSlider(
                            items: [
                              Container(
                                //margin: EdgeInsets.all(5),
                                width: double.maxFinite,
                                height: double.maxFinite,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    image: DecorationImage(
                                      image: AssetImage("assets/img/aswan.jpg"),
                                      fit: BoxFit.cover

                                  )
                                ),
                              )
                            ],
                            options: CarouselOptions(
                              height: 210,
                              aspectRatio: 16/9,
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: Duration(seconds: 4),
                              autoPlayAnimationDuration: Duration(milliseconds: 1000),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: true,
                              //onPageChanged: callbackFunction,
                              scrollDirection: Axis.horizontal,
                            )
                        )

                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  //***********"MyTours,All Tours" row********//
                  Container(
                    child: Align(
                      //wrapping TabBar with this widget to align all the left texts on one coloumn
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        labelPadding: const EdgeInsets.only(left: 30, right: 30),
                        //to control spaces between texts
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.grey,
                        isScrollable: true,//to align all the left texts on one coloumn
                        indicatorSize: TabBarIndicatorSize.label,
                        //so the indicator dot beneath teb2a 3al 2ad
                        indicator:
                        CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                        //need to be positioned below labels still..
                        tabs: [
                          Tab(
                            text: "My Tours",
                          ),
                          Tab(
                            text: "Browse",
                          ),
                        ],
                      ),
                    ),
                  ),

                  //***********My tours Tiles**********//
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    //a margin only at the left
                    height: 300,
                    width: double.maxFinite,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        ListView.builder(
                          itemCount: tourInfo.length,//to be adjusted dynamically******
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: (){
                                print(tourCreatorInfo.length);
                                print(tourInfo.length);

                                BlocProvider.of<Cubits>(context).detailPage(tourCreatorInfo[index], tourInfo[index]);
                              },
                              child: Container(
                                margin: const EdgeInsets.only(right: 20, top: 15),
                                width: 200,
                                height: 300,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black,
                                    image: DecorationImage(
                                        image: NetworkImage(tourInfo[index].img),
                                        //image: NetworkImage("https://dummyimage.com/216x116.png/ff4444/ffffff"),
                                        fit: BoxFit.cover

                                    )
                                ),
                              ),
                            );
                          },
                        ),
                        Text("Hi"),
                        //Running without a Tab bar-controller would give an error, therefore :
                        //"TickerProviderStateMixin" class needed to be extended to use their own pre-defined states
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  //**********Advertisement**********//
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppLargeText(text: "Explore more", size: 20),
                        AppText(text: "See all", color: AppColors.textColor1)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 100,
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(left: 20),//howa elli 3amel el border elli 3al shmal
                    child: ListView.builder(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return Column(
                            children: [
                              Container(
                                margin: const EdgeInsets.only(right: 30),
                                width: 200,
                                height: 80,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage("assets/img/mountain.jpeg"),
                                        fit: BoxFit.cover)),
                              )
                            ],
                          );
                        }),
                  ),

                ],
              ),
            );
          }else{
            return Container();
          }
        },
      ),
        bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,//to avoid the error of tapping the text
        selectedFontSize: 0,//to avoid the error of tapping the text
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0, // to get rid of the upper line border of the bar
        items:[
          BottomNavigationBarItem(label:"Home",icon: Icon(Icons.home)),
          BottomNavigationBarItem(label:"Profile",icon: Icon(Icons.account_circle_outlined)),
          BottomNavigationBarItem(label:"Contact",icon: Icon(Icons.chat_outlined)),
          BottomNavigationBarItem(label:"Settings",icon: Icon(Icons.settings)),

        ]
    ),

    );

  }
}

//To design/paint the "dot effect" that appears below selected labels
class CircleTabIndicator extends Decoration {
  //to design the indicator it is done externally
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // TODO: implement createBoxPainter
    return _CirclePainter(color: color, radius: radius);
    //throw UnimplementedError();
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    // TODO: implement paint

    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
