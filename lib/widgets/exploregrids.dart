import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/models/tour_model.dart';

class ExploreGrids extends StatefulWidget {
  @override
  _ExploreGridsState createState() => _ExploreGridsState();
}

class _ExploreGridsState extends State<ExploreGrids> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<Cubits,CubitStates>(
        builder: (context, state){
      if(state is LoadedState){
        List<TourModel> tourInfo = state.tours;
        var tourCreatorInfo = state.tourCreators;

        return Padding(
      padding: const EdgeInsets.all(20.0),
      child: StaggeredGridView.countBuilder(
        crossAxisCount: 4,
        itemCount: tourInfo.length,
        itemBuilder: (BuildContext context, int index) {
          //Map datar = tourInfo[index];
          return GestureDetector(
            onTap: (){
              BlocProvider.of<Cubits>(context).detailPage(tourCreatorInfo[index], tourInfo[index]);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(tourInfo[index].img),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  Align(
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
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Ubuntu-Regular'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        Icon(
                          Feather.heart,
                          size: 15,
                          color: Colors.white,
                        ),
                        Spacer(),
                        Icon(
                          Icons.share,
                          size: 15,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) => StaggeredTile.count(2, index.isEven ? 3 : 2),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
      }else{
        return Container();

      }
        },
    );
  }
}
