import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/models/tour_model.dart';

class SavedItem extends StatefulWidget {
  @override
  _SavedItemState createState() => _SavedItemState();
}

class _SavedItemState extends State<SavedItem> {
  List images = ["destination1.jpg","destination2.jpg","destination3.jpg"];

  @override
  Widget build(BuildContext context) {
    final totalDots = 4;
    double currentPosition = 0.0;
    return BlocBuilder<Cubits,CubitStates>(
        builder: (context, state){
      if(state is LoadedState){
        List<TourModel> tourInfo = state.tours;
        var tourCreatorInfo = state.tourCreators;

    return CarouselSlider.builder(
        itemCount: images.length,

        itemBuilder: (context,index,realIndex) {
          final urlImages = "assets/img/"+images[index];
          return buildCard(urlImages,index);
            Container(
              height: 210,
              //width: 700,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: ListView.builder(
                      //itemCount: 1,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        //Map datar = data[index];
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                  image: AssetImage(
                                      "assets/img/" + images[index]),
                                  fit: BoxFit.cover),
                            ),
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Container(
                                        height: 30,
                                        width: 30,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.white,
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Feather.bookmark,
                                            size: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 20.0,
                                      horizontal: 10,
                                    ),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .start,
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Text(
                                          "city",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 12,
                                            fontFamily: 'Ubuntu-Regular',
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          "Places",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            fontFamily: 'Ubuntu-Regular',
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Feather.map_pin,
                                              size: 15,
                                              color: Colors.white,
                                            ),
                                            SizedBox(width: 2),
                                            Text(
                                              "location",
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'Ubuntu-Regular',
                                                fontSize: 12,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                        );
                      },
                    ),
                  ),
                  /*Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: DotsIndicator(
                      dotsCount: totalDots,
                      position: currentPosition,
                      decorator: DotsDecorator(
                        size: Size.square(5.0),
                        spacing: EdgeInsets.only(left: 5),
                        activeSize: Size(20.0, 5.0),
                        activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  )*/
                ],
              ),
            );
          },
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
          ),
      );
      }else{
        return Container();

      }
        },
    );
  }

  Widget buildCard(String urlImages, int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
            image: AssetImage(
                "assets/img/" + images[index]),
            fit: BoxFit.cover),

      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Icon(
                      Feather.bookmark,
                      size: 15,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Spacer(),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 20,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment
                    .start,
                crossAxisAlignment: CrossAxisAlignment
                    .start,
                children: [
                  Text(
                    "city",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Ubuntu-Regular',
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Places",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Ubuntu-Regular',
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Feather.map_pin,
                        size: 15,
                        color: Colors.white,
                      ),
                      SizedBox(width: 2),
                      Text(
                        "location",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Ubuntu-Regular',
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}
