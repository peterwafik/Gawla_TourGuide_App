
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/cubit/cubit_logics.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/pages/authPages/Login/login_screen.dart';
import 'package:gawla/services/data_services.dart';
import 'package:gawla/widgets/app_large_text.dart';
import 'package:gawla/widgets/app_text.dart';
import 'package:gawla/widgets/responsive_button.dart';
import 'package:provider/provider.dart';

import 'authPages/authentication_service.dart';
import 'navPages/home_page.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  _welcomePageState createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  List images = ["one.png","two.jpg","three.png"];
  List texts = ["Forget about the traditional tour guiding ways.","Enhance your career with a new generation of tour-organizing experience.","Leave your creative mark on tourists from all around the world with just the tip of your finger."];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,                            //3 scollable pages
          itemBuilder: (_,index){                  //(default context, index as it will run 3 times)
             return Container(
               width: double.maxFinite,
               height: double.maxFinite,


               child: Container(
                 margin: const EdgeInsets.only(top: 100,left: 20, right: 20),
                 child: Stack(
                   children:
                   [
                     Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           AppLargeText(text: "Gawlah"),
                           //AppText(text: "Egypt",size:30),
                           SizedBox(height: 20,),
                           Container(
                             width: 350,
                             child: AppText(
                               text:texts[index],
                               color: AppColors.textColor2,
                               size: 14,
                             )
                           ),
                           SizedBox(height: 20,),
                           Image(image: AssetImage("assets/img/"+images[index]),
                               width: 350,
                               height: 400,
                               alignment: Alignment.centerRight,
                             ),
                           SizedBox(height: 100,),
                         ],
                       ),
                       Column(
                         children: List.generate(3, (indexDots){
                           return Container(
                             margin: const EdgeInsets.only(bottom: 3),//to leave spaces in between the dots
                             width: 8,
                             height: index==indexDots?25:8,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(8),
                               color: index==indexDots? AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)
                             ),
                           );
                         }),
                       ),
                     ],
                   ),
                     Positioned(
                       bottom: 45,
                       right: 20,
                       child: Container(
                         width: 300,
                         child: GestureDetector(
                           onTap: () {

                             Navigator.push(context,
                                 MaterialPageRoute(builder: (context)=> MultiProvider(
                                   providers: [
                                     Provider<AuthenticationService>(
                                       create: (_) => AuthenticationService(FirebaseAuth.instance),
                                     ),
                                     StreamProvider(
                                       create: (context) => context.read<AuthenticationService>().authStateChanges, initialData: null,
                                     )
                                   ],
                                   child: AuthenticationWrapper(),
                                 ))
                             );
                             //BlocProvider.of<Cubits>(context).getAuthData();//holds the cubit and can access them
                           },
                           child: Container(
                               width: 100,
                               child: Row(
                                 children: [
                                   ResponsiveButton(width: 100,),
                                 ],
                               )),
                         ),
                         alignment: Alignment.bottomRight,


                       ),
                     )

                   ]
                 )
               ),

             );
      }),
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
