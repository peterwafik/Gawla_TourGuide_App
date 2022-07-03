import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gawla/constants.dart';
import 'package:gawla/cubit/cubits.dart';
import 'package:gawla/widgets/app_large_text.dart';
import 'package:gawla/widgets/app_text.dart';

import '../cubit/cubit_states.dart';
class CheckpointPage extends StatefulWidget {
  CheckpointPage({Key? key}) : super(key: key);

  @override
  State<CheckpointPage> createState() => _CheckpointPageState();
}

class _CheckpointPageState extends State<CheckpointPage> {
  bool isSwitched = false;
  final  items = ["English", "Arabic","French"];
  String empty(){
    String x = "";
    return x;
  }

  Future<void> f2() async {
    return;
  }
  void toggleSwitch(bool value) {

    if(isSwitched == false)
    {
      setState(() {
        isSwitched = true;

      });
      print('Switch Button is ON');
    }
    else
    {
      setState(() {
        isSwitched = false;

      });
      print('Switch Button is OFF');
    }
  }
  final  categories =['Marine','Safari','Religious','Medical','Cultural'];
  String? value;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocBuilder<Cubits, CubitStates>(
        builder: (context, state) {
          return SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Container(
              width: double.maxFinite,
              height: double.maxFinite,
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(children: [
                SizedBox(
                  height: 40,
                ),
                //******* Back navigation arrow *********//
                Row(
                  children: [
                    IconButton(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.zero,
                        constraints: BoxConstraints(),
                        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                        onPressed: () {
                          BlocProvider.of<Cubits>(context).goCreateTour();
                          //Navigator.of(context, rootNavigator: true).pushNamed('/home');
                        }),
                  ],
                ),

                SizedBox(
                  height: 20,
                ),

                Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text("Checkpoint info",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Ubuntu',
                              letterSpacing: 1.2)),
                    ),
                  ],
                ),

                SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //TO PUSH BOTH SIDES TO THE EDGE
                    children: [
                      AppText(text: "Category", color: Colors.black),
                      Spacer(), //Separator
                      Container(
                        //width: 60,
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.buttonBackground
                            //border: Border.all(color: Colors.deepPurpleAccent)
                            ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              items: categories.map((String categories) {
                                return DropdownMenuItem(
                                  value: categories,
                                  child: Text(categories),
                                );
                              }).toList(),
                              onChanged: (String? newValue) {
                                setState(() {});
                              }),
                        ),
                      ) //Drop down list
                    ]),
                SizedBox(height: 15),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //TO PUSH BOTH SIDES TO THE EDGE
                    children: [
                      AppText(text: "Name", color: Colors.black),
                      Spacer(),
                      Container(
                        width: 130,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Tour name',
                              contentPadding: const EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onChanged: (value) {
                            // do something
                          },
                        ),
                      ),
                    ]),
                SizedBox(height: 15),

                Row(
                  children: [
                    Text(
                      "Cover Photo",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Ubuntu',
                          letterSpacing: 1.2),
                    ),
                    Spacer(),
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.grey[300],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Text('+',
                          style: TextStyle(fontSize: 18, color: Colors.grey)),
                    ),
                  ],
                ),

                SizedBox(height: 15),

                Row(
                  children: [
                    Text(
                      "Timed",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Ubuntu',
                          letterSpacing: 1.2),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        SizedBox(
                          width: 50,
                        ),
                        Switch(
                          onChanged: toggleSwitch,
                          value: isSwitched,
                          activeColor: kPrimaryColor,
                          activeTrackColor: kPrimaryLightColor,
                          inactiveThumbColor: Colors.black,
                          inactiveTrackColor: Colors.grey,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                          width: 130,
                          child: TextField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                                hintText: '30:00',
                                contentPadding: const EdgeInsets.all(15),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            onChanged: (value) {
                              // do something
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      "Location",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Ubuntu',
                          letterSpacing: 1.2),
                    ),
                    Spacer(),
                    Container(
                      width: 130,
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            hintText: 'Latitude and longitude',
                            contentPadding: const EdgeInsets.all(15),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15))),
                        onChanged: (value) {
                          // do something
                        },
                      ),
                    ),
                  ],
                ),
                /*
            Column(
              children: [
                Container(
                width: 250,
                height: 50,
                  child: GoogleMap(initialCameraPosition:CameraPosition(target: LatLng(29.9792, 31.1342)),
                ),
              ),
                SizedBox(height:15),


                Container(
                  height: 35,
                  width: 200,
                  child: TextField(decoration: InputDecoration(
                    labelText: "Latitude and longitude",
                  )),
                ),

              ],

            ),
            */
                SizedBox(height: 15),

                Row(
                  children: [
                    Text(
                      "Description",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Ubuntu',
                          letterSpacing: 1.2),
                    ),
                    /*Container(
                  height: 25,
                  width: 45,
                  child: DropdownButton(items:items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(), onChanged: (String? newValue) {
                    setState(() {
                    });}
                  ),
                ),*/
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 40,
                      child: RaisedButton(
                        onPressed: () {
                          openDescriptionDialog();
                        },
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        child: Text('+',
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Question",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Ubuntu',
                          letterSpacing: 1.2),
                    ),
                    /*Container(
                  height: 25,
                  width: 45,
                  child: DropdownButton(items:items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(), onChanged: (String? newValue) {
                    setState(() {
                    });}
                  ),
                ),*/
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 40,
                      child: RaisedButton(
                        onPressed: () {
                          openQuestionDialog();
                        },
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        child: Text('+',
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "General knowledge",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Ubuntu',
                          letterSpacing: 1.2),
                    ),
                    /*Container(
                  height: 25,
                  width: 45,
                  child: DropdownButton(items:items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(), onChanged: (String? newValue) {
                    setState(() {
                    });}
                  ),
                ),*/
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 40,
                      child: RaisedButton(
                        onPressed: () {
                          openGKDialog();
                        },
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        child: Text('+',
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Clue",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Ubuntu',
                          letterSpacing: 1.2),
                    ),
                    /*Container(
                  height: 25,
                  width: 45,
                  child: DropdownButton(items:items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(), onChanged: (String? newValue) {
                    setState(() {
                    });}
                  ),
                ),*/
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 40,
                      child: RaisedButton(
                        onPressed: () {
                          openClueDialog();
                        },
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(80)),
                        child: Text('+',
                            style: TextStyle(fontSize: 18, color: Colors.grey)),
                      ),
                    ),
                  ],
                ),
                /*Align(
              widthFactor: MediaQuery.of(context).size.width,
              child: Row(
                children: [

                  Column(
                    children: [
                      Text("Photo"),
                      RaisedButton(onPressed:() {},
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Text('+', style: TextStyle(fontSize: 18 , color: Colors.grey)),

                      ),
                    ],
                  ),
                  SizedBox(width: 15),
                  // SizedBox(width: 15),
                  Column(
                    children: [
                      Text("Video"),
                      RaisedButton(onPressed:() {},
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Text('+', style: TextStyle(fontSize: 18 , color: Colors.grey)),

                      ),
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    children: [
                      Text("Audio"),
                      RaisedButton(onPressed:() {},
                        color: Colors.grey[300],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        child: Text('+', style: TextStyle(fontSize: 18 , color: Colors.grey)),

                      ),
                    ],
                  )
                ],
              ),
            ),*/
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  onPressed: () {
                    BlocProvider.of<Cubits>(context).postCheckpointData();

                    //Navigator.of(context).pop(context);
                  },
                  color: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Text('Done',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }

  Future openDescriptionDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: Text('Description(s)'),
            content: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Description Name"),
                      SizedBox(width: 20,),
                      Container(
                        width: 100,
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintText: 'Describe',
                              contentPadding: const EdgeInsets.all(15),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15))),
                          onChanged: (value) {
                            // do something
                          },
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,//TO PUSH BOTH SIDES TO THE EDGE
                      children: [
                        AppText(text: "Language",color: Colors.black),
                        Spacer(),//Separator
                        Container(
                          //width: 60,
                          padding: EdgeInsets.symmetric(horizontal: 12,vertical: 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.buttonBackground
                            //border: Border.all(color: Colors.deepPurpleAccent)
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton(items:items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(), onChanged: (String? newValue) {
                              setState(() {
                              });}
                            ),
                          ),
                        )//Drop down list
                      ]
                  ),

                  SizedBox(height: 20,),

                  Row(children: [
                  Column(
                    children: [
                      Text("Photo"),
                      Container(
                        width: 60,
                        child: RaisedButton(
                          onPressed: () {},
                          color: kPrimaryLightColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text('+',
                              style: TextStyle(fontSize: 18, color: Colors.grey)),
                        ),
                      ),
                      ]
                  ),
                  SizedBox(width: 15),

                  Column(
                    children:[
                      Text("Audio"),
                      Container(
                        width: 60,
                        child: RaisedButton(
                          onPressed: () {},
                          color: kPrimaryLightColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Text('+',
                              style: TextStyle(fontSize: 18, color: Colors.grey)),
                        ),
                      ),
                      ]
                  ),
                  SizedBox(width: 15),
                  Column(
                        children: [
                          Text("Text"),
                          RaisedButton(
                            onPressed: () {},
                            color: kPrimaryLightColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: Text('+',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.grey)),
                          ),
                        ]
                      )
                        ],
                      ),
                  SizedBox(height: 20,),
                  RaisedButton(
                    onPressed: () {
                      BlocProvider.of<Cubits>(context).postCheckpointData();

                      //Navigator.of(context).pop(context);
                    },
                    color: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: Text('Add',
                        style: TextStyle(fontSize: 18, color: Colors.white)),
                  ),

                ],
                  ),
             )
        ),

  );
  Future openQuestionDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
        title: Text('Question'),
        content: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  Text("Question"),
                  Spacer(),
                  Container(
                    width: 100,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Question',
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onChanged: (value) {
                        // do something
                      },
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Correct Answer"),
                  Spacer(),
                  Container(
                    width: 100,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Answer',
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onChanged: (value) {
                        // do something
                      },
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Wrong Answer"),
                  Spacer(),
                  Container(
                    width: 100,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Answer',
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onChanged: (value) {
                        // do something
                      },
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Wrong Answer"),
                  Spacer(),
                  Container(
                    width: 100,
                    child: TextField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintText: 'Answer',
                          contentPadding: const EdgeInsets.all(15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                      onChanged: (value) {
                        // do something
                      },
                    ),
                  ),

                ],
              ),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: () {
                  BlocProvider.of<Cubits>(context).postCheckpointData();

                  //Navigator.of(context).pop(context);
                },
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text('Add',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ],
          ),
        )
    ),

  );  Future openGKDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
        title: Text('Fact/General Knowledge'),
        content: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Column(
                children: [
                  Text("State a fact, historical event \n or any piece of general \n knowledge related to this location"),
                  SizedBox(height: 20,),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 1,
                            color: Colors.purple,
                            style: BorderStyle.solid)),
                    child: TextField(
                      minLines: 10,
                      maxLines: 20,
                      decoration: const InputDecoration(
                          hintText: 'Type something here',
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,//TO PUSH BOTH SIDES TO THE EDGE
                  children: [
                    AppText(text: "Language",color: Colors.black),
                    Spacer(),//Separator
                    Container(
                      //width: 60,
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.buttonBackground
                        //border: Border.all(color: Colors.deepPurpleAccent)
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(items:items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(), onChanged: (String? newValue) {
                          setState(() {
                          });}
                        ),
                      ),
                    )//Drop down list
                  ]
              ),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: () {
                  BlocProvider.of<Cubits>(context).postCheckpointData();

                  //Navigator.of(context).pop(context);
                },
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text('Add',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),


            ],
          ),
        )
    ),

  );
  Future openClueDialog() => showDialog(
    context: context,
    builder: (context) => AlertDialog(
        title: Text('Clue!'),
        content: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Column(
                children: [
                  Text("Give a hint about the checkpoint"),
                  SizedBox(height: 20,),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 1,
                            color: Colors.purple,
                            style: BorderStyle.solid)),
                    child: TextField(
                      minLines: 10,
                      maxLines: 20,
                      decoration: const InputDecoration(
                          hintText: 'Hint',
                          contentPadding: EdgeInsets.all(15),
                          border: InputBorder.none),
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,//TO PUSH BOTH SIDES TO THE EDGE
                  children: [
                    AppText(text: "Language",color: Colors.black),
                    Spacer(),//Separator
                    Container(
                      //width: 60,
                      padding: EdgeInsets.symmetric(horizontal: 12,vertical: 0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: AppColors.buttonBackground
                        //border: Border.all(color: Colors.deepPurpleAccent)
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(items:items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(), onChanged: (String? newValue) {
                          setState(() {
                          });}
                        ),
                      ),
                    )//Drop down list
                  ]
              ),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: () {
                  BlocProvider.of<Cubits>(context).postCheckpointData();

                  //Navigator.of(context).pop(context);
                },
                color: kPrimaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: Text('Add',
                    style: TextStyle(fontSize: 18, color: Colors.white)),
              ),


            ],
          ),
        )
    ),

  );
}