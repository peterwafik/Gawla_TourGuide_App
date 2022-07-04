// @dart=2.9
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/cubit/cubit_logics.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/pages/authPages/Login/login_screen.dart';
import 'package:gawla/pages/authPages/Signup/signup_screen.dart';
import 'package:gawla/pages/authPages/authentication_service.dart';
import 'package:gawla/pages/create_checkpoint_page.dart';
import 'package:gawla/pages/create_tour_page.dart';
import 'package:gawla/pages/navPages/profile_page.dart';
import 'package:gawla/pages/tour_page.dart';
import 'package:gawla/pages/welcome_page.dart';
import 'package:gawla/services/data_services.dart';
import 'package:provider/provider.dart';
//first line is to guarantee "no-sound-null-safety"



Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            primaryColor: Colors.white
        ),
        //supportedLocales: i18n.all,
        home: welcomePage()/*BlocProvider<Cubits>(//BlockProvider: injects cubits
          create: (context)=>Cubits(
            data: DataServices(),
          ),//pass the class of function,create the cubit
          child: CubitLogics(),//then show the logic
          //pass the child that checks the cubits/states
        ),*/
      );
  }
}
class AuthenticationWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              scaffoldBackgroundColor: Colors.white,
              primaryColor: Colors.white
          ),
          //supportedLocales: i18n.all,
          home: BlocProvider<Cubits>(//BlockProvider: injects cubits
            create: (context)=>Cubits(
              data: DataServices(),
            ),//pass the class of function,create the cubit
            child: CubitLogics(),//then show the logic
            //pass the child that checks the cubits/states
          )
      );
    }
    return LoginScreen();
  }
}
