
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/widgets/app_large_text.dart';
import 'package:gawla/widgets/app_text.dart';
import 'package:gawla/widgets/responsive_button.dart';

class welcomePage extends StatefulWidget {
  const welcomePage({Key? key}) : super(key: key);

  @override
  _welcomePageState createState() => _welcomePageState();
}

class _welcomePageState extends State<welcomePage> {
  List images = ["one.png","two.jpg","three.png"];
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
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         AppLargeText(text: "Gawlah"),
                         //AppText(text: "Egypt",size:30),
                         SizedBox(height: 20,),
                         Container(
                           width: 250,
                           child: AppText(
                             text:"Spice your trip with tours like no other.",
                             color: AppColors.textColor2,
                             size: 14,
                           )
                         ),
                         SizedBox(height: 20,),
                         Image(image: AssetImage("assets/img/"+images[index]),
                             width: 300,
                             height: 300,
                             alignment: Alignment.center,
                           ),
                         SizedBox(height: 100,),
                         Container(
                           width: 300,
                             child: GestureDetector(
                               onTap: (){
                                 BlocProvider.of<Cubits>(context).getAuthData();//holds the cubit and can access them
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


                         )

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
                 )
               ),

             );
      }),
    );
  }
}