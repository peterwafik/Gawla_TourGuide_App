import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/models/tour_model.dart';

class PostItem extends StatefulWidget {
  @override
  _PostItemState createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cubits,CubitStates>(
        builder: (context, state){
      if(state is LoadedState){
        List<TourModel> tourInfo = state.tours;
        var tourCreatorInfo = state.tourCreators;

        return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(tourInfo[1].img),
                  fit: BoxFit.cover,
                ),
              ),
              child: Align(
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
                        tourInfo[1].name,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Ubuntu-Regular'),
                      ),
                      Spacer(),
                      Text(
                        Random().nextInt(2000).toString(),
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                            fontFamily: 'Ubuntu-Regular'),
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
                      Icon(Feather.heart, size: 15, color: Colors.white),
                      SizedBox(width: 5),
                      Icon(Icons.share, size: 15, color: Colors.white)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );

      }else{
        return Container();

      }
        },
    );
  }
}
