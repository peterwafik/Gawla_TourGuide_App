import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/cubit/cubit_states.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/pages/authPages/Login/login_screen.dart';
import 'package:gawla/pages/authPages/Signup/signup_screen.dart';
import 'package:gawla/pages/create_checkpoint_page.dart';
import 'package:gawla/pages/create_tour_page.dart';
import 'package:gawla/pages/navPages/contact_page.dart';
import 'package:gawla/pages/navPages/edit_profile_page.dart';
import 'package:gawla/pages/navPages/home_page.dart';
import 'package:gawla/pages/navPages/profile_page.dart';
import 'package:gawla/pages/tour_page.dart';
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
          if(state is LoginState){
            return LoginScreen();
          }
          if(state is SignUpState){
            return SignUpScreen();
          }
          if(state is DetailState){
            return TourPage();
          }
          if(state is ProfileState){
            return ProfilePage();
          }
          if(state is ContactState){
            startChat(context);
            return ContactPage();
          }
          if(state is SettingsState){
            return SettingsPage();
          }
          if(state is CheckpointState){
            return CheckpointPage();
          } if(state is CreateTourState){
            return CreateTourPage();
          }
          if(state is LoadedState){
            return HomePage();
          }
          if(state is LoadingState){
            return Center(child: CircularProgressIndicator(),);
          }else{
            print("not the required state");
            return Container();
          }
        }
      ),

      );
  }
}
