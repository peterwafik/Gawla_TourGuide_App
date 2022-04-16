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
  @override
  Widget build(BuildContext context) {
    final totalDots = 4;
    double currentPosition = 0.0;
    return BlocBuilder<Cubits,CubitStates>(
        builder: (context, state){
      if(state is LoadedState){
        List<TourModel> tourInfo = state.tours;
        var tourCreatorInfo = state.tourCreators;

    return Container(
      height: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                //Map datar = data[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(tourInfo[1].img),
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
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
          )
        ],
      ),
    );
      }else{
        return Container();

      }
        },
    );
  }
}
