import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/pages/authPages/Login/fade_animation.dart';
import 'package:gawla/pages/authPages/Login/login_screen.dart';
import 'package:gawla/pages/authPages/components/page1.dart';
import 'package:gawla/pages/authPages/components/page2.dart';
import 'package:gawla/pages/authPages/components/page3.dart';
import 'package:gawla/pages/authPages/components/progress.dart';

import '../../../cubit/cubits.dart';
//import 'package:intl_phone_number_input/intl_phone_number_input.dart';


class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int currentStep = 0;
  //int _value =1;

  late PFormController pformController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pformController = PFormController(3);
  }

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
          child: Stack(
            children: [
          Column(
          children: [
          Container(
            alignment: Alignment.center,
          margin: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              "SIGN UP",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 30),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              // color: const Color(0xfff96d34),
              // color: const Color(0xFFC73800),
              width: 200,
              height: 200,
              margin: const EdgeInsets.only(right: 0),
              child: Image.asset(
                "assets/Authentication/icons/signup.png",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      )
      ],
    ),


              DraggableScrollableSheet(
                  maxChildSize: 0.9,
                  minChildSize: 0.5,
                  initialChildSize: 0.6,
                  builder:(ctx,controller) {
                    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 13,vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30)
                      ),
                      child: SingleChildScrollView(
                        controller: controller,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PForm(
                                controller: pformController,
                                pages: [
                                  //LoginScreen(),
                                  Page1(),
                                  Page2(),
                                  CreditStep(),
                                  //HomePage(),
                            ], title: [
                              PTitle(title: "Personal Info"),
                              PTitle(
                                title: "Professional Info",
                              ),
                              PTitle(title: "Credit Info"),
                            ])
                          ],
                        ),
                      ),
                    );
                  }),
              Positioned(
                  bottom: 20,
                  right: 80,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context)=> const LoginScreen())
                      );
                      //BlocProvider.of<Cubits>(context).goLogin();
                    },
                    child: const Text(
                      'Already Have An Account?',
                    ),
                    style: TextButton.styleFrom(
                        primary: kPrimaryColor,
                        textStyle: const TextStyle(
                          fontSize: 18,
                        )),
                  ))
            ],
          )),

    );

  }
}

