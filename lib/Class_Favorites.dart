import 'package:flutter/material.dart';
import 'Class_Favorites.dart';
import 'Class_Favorites.dart';
import 'user/Screen_cities_user.dart';

class PagesCitis {
  String name;

  String image;

  bool isFavorite;

  PagesCitis(this.name, this.image, {this.isFavorite = false});
}

class FavoritClass {
  late List<PagesCitis> favorit;

  FavoritClass(this.favorit);
}

FavoritClass itemfavorit = FavoritClass([]);
///////////////////////////
///////////////////////////
///////////////////////////
///////////////////////////
///////////////////////////
///////////////////////////
///////////////////////////
class AddHous {
  String name;
  String typename;
  String cityname;
  String images ;
  String phone;
  String map;

  AddHous(this.name, this.images, this.phone, this.cityname, this.map,
      this.typename);
}
///////////////////////////
///////////////////////////
///////////////////////////
///////////////////////////
///////////////////////////
class irbidClass {
  late List<AddHous> favorit;

  irbidClass(this.favorit);
}

irbidClass itemhous = irbidClass([

  AddHous("goo",'https://i.pinimg.com/236x/e2/03/b4/e203b442e640f751c9cdd744261b786d.jpg', "077777777", "Husing", "amman", "Students")
]);
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
class HousingClass {
  final String name;
  final String location;
  final double price;
  final int rooms;
  final String availabilityDate;

  HousingClass({
    required this.name,
    required this.location,
    required this.price,
    required this.rooms,
    required this.availabilityDate,
  });
}
