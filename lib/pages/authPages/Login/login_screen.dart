import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gawla/constants.dart';

class LoginScreen extends StatelessWidget {
  //static AfterAuthScreen afterScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [kPrimaryColor, Colors.white],
                      begin: Alignment.topCenter,
                      end:  Alignment.bottomCenter

                  )
              ),



              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "SIGN IN",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: kPrimaryLightColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        SvgPicture.asset(
                          "assets/Authentication/icons/login.svg",
                          height: 190,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            DraggableScrollableSheet(
                maxChildSize: 0.6,
                minChildSize: 0.6,
                initialChildSize: 0.6,
                builder:(ctx,controller) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 18,vertical: 20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: SingleChildScrollView(
                      controller: controller,
                    ),
                  );

                }
            ),
            Positioned(
              bottom: 10,
              right: 80,
              child:TextButton(
                onPressed: () {},
                child: const Text(
                    "Don't Have An Account?",
                ),
                style: TextButton.styleFrom(
                    primary: kPrimaryColor,
                    backgroundColor: kPrimaryLightColor,
                    textStyle:
                    const TextStyle(fontSize: 18,)),
              ),
            )
          ]
      ),
    );
  }
}
