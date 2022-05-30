import 'package:gawla/models/user_model.dart';

class CheckpointModel{
  int id;
  int tourId;
  int time;
  String name;
  String category;
  String img;
  int detailedLocation;
  String description;
  String location;
  CheckpointModel({
    required this.id,
    required this.tourId,
    required this.time,
    required this.name,
    required this.category,
    required this.img,
    required this.detailedLocation,
    required this.description,
    required this.location,

  });

  factory CheckpointModel.fromJson(Map<String, dynamic> json) {
    //send info to variable "json"
    return CheckpointModel(
      id: json['id'],
      tourId: json['tourId'],
      time: json['time'],
      name: json["name"],
      category: json["category"],
      img: json["photo"],
      detailedLocation: json["cost"],
      description: json["description"],
      location: json["location"],

    );
  } //string : as the data types, dynamic: as the data of these types

}