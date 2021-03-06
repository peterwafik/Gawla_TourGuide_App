import 'dart:convert';

import 'package:gawla/models/user_model.dart';
import 'package:gawla/models/tour_model.dart';
import 'package:http/http.dart' as http;

class DataServices{
  //the below baseUrl is of "laravel backend"
  //from "postman's Uri", beside Dropdown menu Get/Post
  String baseUrl = "http://appgawla-env.eba-bxx4seec.us-east-1.elasticbeanstalk.com";//depends on kind of back-end used

  Future<List<DataModel>>getTourguideInfo() async{
    var apiUrl = '/tourCreators';//combined-Uri
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(res.statusCode==200){//there's actual response from the server
        List<dynamic>list = json.decode(res.body);//cuz flutter doen't understand json but understands "mapping"
        //Now each list represents a block of code in between each []
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }else{
        return <DataModel>[];

      }
    }catch(e){
      print(e);
      return <DataModel>[];
    }
  }
  Future<List<dynamic>>getTourInfo() async {
    var apiUrl = '/tours';//combined-Uri
    var link;
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(res.statusCode==200){//there's actual response from the server
        List<dynamic>list = json.decode(res.body);//cuz flutter doen't understand json but understands "mapping"
        //Now each list represents a block of code in between each []
        //print(list);
        //link =list.map((e) => TourModel.fromJson(e)).toList();
        //print(link);
        return list.map((e) => TourModel.fromJson(e)).toList();//
      }else{
        return <TourModel>[];

      }
    }catch(e){
      print(e);
      return <TourModel>[];
    }
  }
  Future<dynamic> postTourInfo(
      String name,
      String category,
      String img,
      int price,
      String description,
      String location,
      int maxParticipants,
      ) async{
    http.Response response;
    try {
       response = await http.post("http://appgawla-env.eba-bxx4seec.us-east-1.elasticbeanstalk.com/tours",
         headers: {
           'Content-Type': 'application/json; charset=UTF-8',
         },
        body: jsonEncode(<String, dynamic>{
          "name": name.toString(),
          "category": category.toString(),
          "cover_photo": img.toString(),
          "cost": price,
          "description": description.toString(),
          "location": location.toString(),
          "max_participants": maxParticipants,
        }),
      );
       print(response.body);
    }
    catch(e){
      print(e);
    }
  }
  Future<dynamic> postCheckpointInfo(
      String name,
      String category,
      String img,
      int price,
      String description,
      String location,
      int maxParticipants,
      ) async{
    http.Response response;
    try {
      response = await http.post("http://appgawla-env.eba-bxx4seec.us-east-1.elasticbeanstalk.com/tours",
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          "name": name.toString(),
          "category": category.toString(),
          "cover_photo": img.toString(),
          "cost": price,
          "description": description.toString(),
          "location": location.toString(),
          "max_participants": maxParticipants,
        }),
      );
      print(response.body);
    }
    catch(e){
      print(e);
    }
  }




}