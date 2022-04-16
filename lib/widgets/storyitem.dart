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
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cubits,CubitStates>(
        builder: (context, state){
      if(state is LoadedState){
        List<TourModel> tourInfo = state.tours;
        var tourCreatorInfo = state.tourCreators;

        return Container(
      height: 130,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          //Map story = data[index];
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Stack(
              children: [
                Container(
                  height: 100,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(tourInfo[1].img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 80,
                  right: 25,
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
                        radius: 15,
                        backgroundImage: NetworkImage(tourInfo[1].img),
                      ),
                    ),
                  ),
                )
              ],
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
