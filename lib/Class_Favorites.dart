import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
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
  String images;

  String phone;
  String map;
  double price;

  AddHous(this.price, this.name, this.images, this.phone, this.cityname,
      this.map, this.typename);
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
  AddHous(
      140,
      "Home1",
      'https://i.pinimg.com/236x/e2/03/b4/e203b442e640f751c9cdd744261b786d.jpg',
      "077777777",
      "Husing",
      "amman",
      "Students"),
  AddHous(120, "Home2", '', "077777777", "Husing", "amman", "Students"),
  AddHous(
      200,
      "Home3",
      'https://i.pinimg.com/236x/e2/03/b4/e203b442e640f751c9cdd744261b786d.jpg',
      "077777777",
      "Husing",
      "amman",
      "Students"),
  AddHous(
      300,
      "Home4",
      'https://i.pinimg.com/236x/e2/03/b4/e203b442e640f751c9cdd744261b786d.jpg',
      "077777777",
      "Husing",
      "amman",
      "Students"),
  AddHous(
      150,
      "Home5",
      'https://i.pinimg.com/236x/e2/03/b4/e203b442e640f751c9cdd744261b786d.jpg',
      "077777777",
      "Husing",
      "amman",
      "Students"),
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

//////////////////////
//////////////////////
//////////////////////
//////////////////////






class ThemeService {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey.shade300,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.blueGrey,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    dividerColor: Colors.black12,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blueGrey.shade300,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );

  final darkTheme = ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    dividerColor: Colors.white54,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.shade800,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
  );

  final _getStorage = GetStorage();
  final _darkThemeKey = 'isDarkTheme';

  void saveThemeData(bool isDarkTheme) {
    _getStorage.write(_darkThemeKey, isDarkTheme);
  }

  bool isSavedDarkMode() {
    return _getStorage.read(_darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSavedDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeTheme() {
    bool isDark = isSavedDarkMode();
    Get.changeThemeMode(isDark ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isDark);
  }
}
//
// class ThemeSerrvice{
//   final lightTeme= ThemeData.light().copyWith(
//     primaryColor: Colors.blueGrey.shade300,
//     appBarTheme: const AppBarTheme(),
//     dividerColor: Colors.black12,
//   );
//
//   final darkTeme= ThemeData.dark().copyWith(
//     primaryColor: Colors.blue,
//     appBarTheme: const AppBarTheme(),
//     dividerColor: Colors.white54,
//   );
// final _getStorage=GetStorage();
// final _darkThemeKey='isDarkTheme';
//
// void saveThemeData(bool isDarkTheme)
// {
//  _getStorage.write(_darkThemeKey,isDarkTheme);
// }
//
//
// bool isSaveDartMode()
//   {
//   return _getStorage.read(_darkThemeKey) ?? false;
//   }
//
//   ThemeMode getThemeMode()
//   {
//   return isSaveDartMode() ? ThemeMode.light:ThemeMode.dark;
//   }
//
//
//   void changeTheme(){
//   Get.changeThemeMode(isSaveDartMode()?ThemeMode.light:ThemeMode.dark);
//   saveThemeData(!isSaveDartMode());
//   }
// }
///////////////////////
///////////////////////
///////////////////////
///////////////////////
///////////////////////
///////////////////////
