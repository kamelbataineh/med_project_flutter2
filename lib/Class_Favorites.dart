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
  double price;

  AddHous(this.price,this.name, this.images, this.phone, this.cityname, this.map,
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

  AddHous(140,"Home1",'https://i.pinimg.com/236x/e2/03/b4/e203b442e640f751c9cdd744261b786d.jpg', "077777777", "Husing", "amman", "Students"),
  AddHous(120,"Home2",'', "077777777", "Husing", "amman", "Students"),
  AddHous(200,"Home3",'https://i.pinimg.com/236x/e2/03/b4/e203b442e640f751c9cdd744261b786d.jpg', "077777777", "Husing", "amman", "Students"),
  AddHous(300,"Home4",'https://i.pinimg.com/236x/e2/03/b4/e203b442e640f751c9cdd744261b786d.jpg', "077777777", "Husing", "amman", "Students"),
  AddHous(150,"Home5",'https://i.pinimg.com/236x/e2/03/b4/e203b442e640f751c9cdd744261b786d.jpg', "077777777", "Husing", "amman", "Students"),

]);
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
class HousingClass {
  final int rooms;
  final String availabilityDate;

  HousingClass({
    required this.rooms,
    required this.availabilityDate,
  });
}
