import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/pages/navPages/home_page.dart';
import 'package:gawla/pages/welcome_page.dart';

class CubitLogics extends StatefulWidget {
  const CubitLogics({Key? key}) : super(key: key);

  @override
  State<CubitLogics> createState() => _CubitLogicsState();
}

class _CubitLogicsState extends State<CubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<Cubits,CubitStates>(//check on states and emit them
        builder: (context, state){//to check on states
          if(state is WelcomeState){
            return welcomePage();
          }
          if(state is LoadedState){
            return HomePage();
          }
          if(state is LoadingState){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return Container();
          }
        }
      ),

      );
  }
}
