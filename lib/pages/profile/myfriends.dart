import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/models/tour_model.dart';

class MyFriends extends StatefulWidget {
  @override
  _MyFriendsState createState() => _MyFriendsState();
}

class _MyFriendsState extends State<MyFriends> {
  @override
  Widget build(BuildContext context) {
    return Container();
    /*BlocBuilder<Cubits,CubitStates>(
        builder: (context, state){
      if(state is LoadedState){
        List<TourModel> tourInfo = state.tours;
        var tourCreatorInfo = state.tourCreators;

        return ListView.builder(
      itemCount: 5,
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        //Map datar = data[index];
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(tourInfo[1].img),
            ),
            title: Text(
              "Name",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Ubuntu-Regular',
                // color: Colors.black,
              ),
            ),
            subtitle: Text(
              'online',
              style: TextStyle(
                  // color: Colors.grey[000],
                  fontSize: 13,
                  fontFamily: 'Ubuntu-Regular',
                  fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
              Feather.user_check,
              // color: Colors.black,
              size: 20,
            ),
          ),
        );
      },
    );
      }else{
        return Container();

      }
        },
    );*/
  }
}
