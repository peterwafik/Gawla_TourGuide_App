class TourModel{
  String name;
  String category;
  String img;
  int price;
  int checkpoints;
  int stars;
  String description;
  String location;
  TourModel({
    required this.name,
    required this.category,
    required this.img,
    required this.price,
    required this.checkpoints,
    required this.stars,
    required this.description,
    required this.location,

});

  factory TourModel.fromJson(Map<String, dynamic> json) {
    //send info to variable "json"
    return TourModel(
        name: json["name"],
        category: json["category"],
        img: json["img"],
        price: json["price"],
        checkpoints: json["checkpoints"],
        stars: json["stars"],
        description: json["description"],
        location: json["location"]);
  } //string : as the data types, dynamic: as the data of these types

}