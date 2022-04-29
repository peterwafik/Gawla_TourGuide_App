import 'package:gawla/models/user_model.dart';

class CheckpointModel{
  int id;
  dynamic tourModel;
  String name;
  String category;
  String img;
  int time;
  String description;
  String location;
  CheckpointModel({
    required this.id,
    required this.tourModel,
    required this.name,
    required this.category,
    required this.img,
    required this.time,
    required this.description,
    required this.location,

  });

  factory CheckpointModel.fromJson(Map<String, dynamic> json) {
    //send info to variable "json"
    return CheckpointModel(
      id: json['id'],
      tourModel: json['tour'],
      name: json["name"],
      category: json["category"],
      img: json["cover_photo"],
      time: json["cost"],
      description: json["description"],
      location: json["location"],

    );
  } //string : as the data types, dynamic: as the data of these types

}