import 'package:flutter/material.dart';
import 'package:gawla/pages/create_tour_page.dart';
import 'package:gawla/pages/main_page.dart';
import 'package:gawla/pages/tour_page.dart';
import 'package:gawla/pages/welcome_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.white
      ),
      home: MainPage(),
    );
  }
}
