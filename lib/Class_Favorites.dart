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
  List<String> images = [];
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

irbidClass itemhous = irbidClass([]);
