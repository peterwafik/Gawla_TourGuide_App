import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/models/tour_model.dart';

class StoryItem extends StatefulWidget {
  @override
  _StoryItemState createState() => _StoryItemState();
}

class _StoryItemState extends State<StoryItem> {
  List images = [
    "user1.jpg",
    "user2.jpg",
    "user3.jpg",
    "user4.jpg",
    "user5.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cubits, CubitStates>(
      builder: (context, state) {
        if (state is LoadedState) {
          List<TourModel> tourInfo = state.tours;
          var tourCreatorInfo = state.tourCreators;

          return Container(
            height: 100,
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                //Map story = data[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Stack(
                    children: [
                      /*Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage("assets/img/mountain.jpeg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),*/
                      Container(
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
                            padding: const EdgeInsets.all(0.2),
                            child: CircleAvatar(
                                radius: 40,

                                backgroundImage:
                                    AssetImage("assets/img/"+images[index])
                                //NetworkImage(tourInfo[1].img),
                                ),
                          ),
                        ),

                    ],
                  ),
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
