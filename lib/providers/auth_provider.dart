import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gawla/models/user_model.dart';
import 'package:gawla/pages/authPages/components/shared_preferences.dart';

import 'package:http/http.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider extends ChangeNotifier {
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;

  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  Status get registeredInStatus => _registeredInStatus;

  set registeredInStatus(Status value) {
    _registeredInStatus = value;
  }

  Future<FutureOr> register(String email, String password) async {
    final Map<String, dynamic> apiBodyData = {
      'email': email,
      'password': password
    };

    return await post(
      //register new creator url
        "http://appgawla-env.eba-bxx4seec.us-east-1.elasticbeanstalk.com/swagger-ui/index.html#/tour-creator-controller/addTourCreator",
        body: json.encode(apiBodyData),
        headers: {'Content-Type':'application/json'}
    ).then(onValue)
        .catchError(onError);
  }


  notify(){
    notifyListeners();
  }

  static Future<FutureOr> onValue (Response response) async {
    var result ;

    final Map<String, dynamic> responseData = json.decode(response.body);

    print(responseData);

    if(response.statusCode == 200){

      var userData = responseData['data'];

      // now we will create a user model
      DataModel authUser = DataModel.fromJson(responseData);

      // now we will create shared preferences and save data
      //UserPreferences().saveUser(authUser);

      result = {
        'status':true,
        'message':'Successfully registered',
        'data':authUser
      };

    }else{
      result = {
        'status':false,
        'message':'Successfully registered',
        'data':responseData
      };
    }
    return result;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {

    var result;

    final Map<String, dynamic> loginData = {
      'UserName': 'kaliakoirdeo379',
      'Password': 'kaliakoirdeo379@2020'
    };

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    Response response = await get(Uri.parse("http://appgawla-env.eba-bxx4seec.us-east-1.elasticbeanstalk.com/swagger-ui/index.html#/tour-creator-controller/getTourCreator"));

    /*
    Response response = await post(
      AppUrl.login,
      body: json.encode(loginData),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Basic ZGlzYXBpdXNlcjpkaXMjMTIz',
        'X-ApiKey' : 'ZGlzIzEyMw=='
      },
    );*/

    if (response.statusCode == 200) {

      final Map<String, dynamic> responseData = json.decode(response.body);

      print(responseData);

      var userData = responseData['Content'];

      DataModel authUser = DataModel.fromJson(userData);

      //UserPreferences().saveUser(authUser);

      _loggedInStatus = Status.LoggedIn;
      notifyListeners();

      result = {'status': true, 'message': 'Successful', 'user': authUser};

    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {
        'status': false,
        'message': json.decode(response.body)['error']
      };
    }

    return result;

  }


  static onError(error){
    print('the error is ${error.detail}');
    return {
      'status':false,
      'message':'Unsuccessful Request',
      'data':error
    };
  }


}