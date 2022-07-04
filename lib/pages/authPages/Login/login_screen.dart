import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/cubit/cubit_logics.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/pages/authPages/Signup/signup_screen.dart';
import 'package:gawla/pages/authPages/authentication_service.dart';
import 'package:gawla/services/data_services.dart';
import 'package:provider/provider.dart';

import 'fade_animation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}
class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var wid = MediaQuery
        .of(context)
        .size
        .width;
    var hie = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: Container(
          height: hie,
          width: wid,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/Authentication/icons/back.png"),
              fit: BoxFit.cover,
            ),
          ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SafeArea(
                child: Column(
                  children: [
                    const SizedBox(height: 80),
                    const FadeAnimation(
                      2,
                      Text(
                        "SIGN IN",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2,
                            fontFamily: "Lobster"),
                      ),
                    ),
                    SizedBox(height: 20,),
                    FadeAnimation(
                      2,
                      Container(
                        // color: const Color(0xfff96d34),
                        // color: const Color(0xFFC73800),
                        width: 210,
                        height: 180,
                        margin: const EdgeInsets.only(right: 0),
                        child: Image.asset(
                          "assets/Authentication/icons/login.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    FadeAnimation(
                      2,
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        padding: const EdgeInsets.only(left: 10),
                        decoration: const BoxDecoration(
                          color: Color(0xFFdedbed),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.person_outline),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: emailController,
                                  decoration: const InputDecoration(
                                    label: Text(" Email "),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FadeAnimation(
                      2,
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        padding: const EdgeInsets.only(left: 10),
                        decoration: const BoxDecoration(
                          color: Color(0xFFdedbed),
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Icon(Icons.lock_outline),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(left: 10),
                                child: TextFormField(
                                  maxLines: 1,
                                  controller: passwordController,
                                  decoration: const InputDecoration(
                                    label: Text(" Password "),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FadeAnimation(
                      2,
                      GestureDetector(
                        onTap: () {

                          /*Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> MultiProvider(
                                providers: [
                                  Provider<AuthenticationService>(
                                    create: (_) => AuthenticationService(FirebaseAuth.instance),
                                  ),
                                  StreamProvider(
                                    create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,
                                  )
                                ],
                                child: MaterialApp(
                                        debugShowCheckedModeBanner: false,
                                        theme: ThemeData(
                                            scaffoldBackgroundColor:
                                                Colors.white,
                                            primaryColor: Colors.white),
                                        //supportedLocales: i18n.all,
                                        home: BlocProvider<Cubits>(
                                          //BlockProvider: injects cubits
                                          create: (context) => Cubits(
                                            data: DataServices(),
                                          ),
                                          //pass the class of function,create the cubit
                                          child:
                                              CubitLogics(), //then show the logic
                                          //pass the child that checks the cubits/states
                                        )),
                                  ))
                          );*/
                            context.read<AuthenticationService>().signIn(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );



                      //BlocProvider.of<Cubits>(context).getData();

                      //_login();
                    },
                    child:
                          Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
                            decoration: const BoxDecoration(
                              color: kPrimaryColor,
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),

                              child: Container(
                                  child: const Text(
                                    "Login",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),

                          ),


                      ),


                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context)=> const SignUpScreen())
                          );
                          //BlocProvider.of<Cubits>(context).goSignup();

                        },
                        child: const Text(
                          "Don't Have An Account? Signup",
                        ),
                        style: TextButton.styleFrom(
                            primary: kPrimaryColor,
                            //backgroundColor: kPrimaryLightColor,
                            textStyle:
                            const TextStyle(fontSize: 18,)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
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
    return SignUpScreen();
  }
}