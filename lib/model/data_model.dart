// import 'dart:convert';

class DataModel {
  String name;
  String img;
  int people;
  int stars;
  int price;
  String description;
  String location;
  DataModel({
    required this.name,
    required this.img,
    required this.people,
    required this.stars,
    required this.price,
    required this.description,
    required this.location
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'], 
      img: json['img'], 
      people: json['people'], 
      stars: json['stars'], 
      price: json['price'], 
      description: json['description'], 
      location: json['location']
    );
  }
}