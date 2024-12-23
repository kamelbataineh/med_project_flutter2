import 'package:flutter/material.dart';
import 'Class_Favorites.dart';
import 'Class_Favorites.dart';
import 'Screen_cities_user.dart';

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
