import 'package:flutter/material.dart';
import 'dart:ui';


//************ Colors constants *****************//

const kPrimaryColor = Color(0xFF5A68BD);
const kPrimaryLightColor = Color(0xFFF1F1FB);
const colorDark= Color(0xFF5d69b3);
const colorMedium= Color(0xFF989acd);
const colorLight= Color(0xFFf1f1f9);
class AppColors{
  static final Color textColor1= Color(0xFF989acd);
  static final Color textColor2 = Color(0xFF878593);
  static final Color bigTextColor=Color(0xFF2e2e31);
  static final Color mainColor= Color(0xFF5d69b3);
  static final Color starColor = Color(0xFFe7bb4e);
  static final Color mainTextColor = Color(0xFFababad);
  static final Color buttonBackground = Color(0xFFf1f1f9);
}
//************ Back-end constants ***************//

//the below baseUrl is of "laravel backend"
//from "postman's Uri", beside Dropdown menu Get/Post
const String baseUrl = 'http://appgawla-env.eba-bxx4seec.us-east-1.elasticbeanstalk.com';
const String tours = '/tours';
const String tourCreators = '/tourCreators';
const loggedIn = "loggedin";
const USER_NAME_ERROR = "Minimun 3 and maximum 10 charectors allowed.";
const PASSWORD_ERROR = "Minimun 3 and maximum 10 charectors allowed.";

const categoryList = [
  'New',
  'Popular',
  'Most viewed',
  'All tours',
];

class Config {
  static final String apiKey = '85u9gh4kpf2c';

  static final String tokenPeter =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoicGV0ZXIifQ.NSEcti19pLUV6LI6XIlVO0X6abty1YO1HQ_ynX_jHrA';
  static final String idPeter = 'peter';
}
