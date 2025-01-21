import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_common/get_reset.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'Class_Favorites.dart';
import 'Class_Favorites.dart';
// price?.toString() ?? 'N/A'
class PagesCitis {
  String name;

  String image;
  int ?price;

  bool isFavorite;

  PagesCitis(this.name, this.image, {this.isFavorite = false}) ;

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
  int rooms;
  String phone;
  String map;
  double price;

  AddHous(this.price, this.name, this.images, this.phone, this.cityname,
      this.map, this.typename, this.rooms);
}

///////////////////////////
///////////////////////////
///////////////////////////
///////////////////////////
///////////////////////////
// class irbidClass {
//   late List<AddHous> favorit;
//
//   irbidClass(this.favorit);
// }
//
// irbidClass itemhous = irbidClass([
//   // AddHous(
//   //   140,
//   //   "Home1",
//   //   'https://i.pinimg.com/236x/e2/03/b4/e203b442e640f751c9cdd744261b786d.jpg',
//   //   "077777777",
//   //   "Husing",
//   //   "amman",
//   //   "Students",
//   //   3,
//   // ),
//   // AddHous(120, "Home2", '', "077777777", "Husing", "amman", "Students", 4),
//   // AddHous(
//   //     200,
//   //     "Home3",
//   //     'https://i.pinimg.com/236x/e2/03/b4/e203b442e640f751c9cdd744261b786d.jpg',
//   //     "077777777",
//   //     "Husing",
//   //     "amman",
//   //     "Students",
//   //     5),
//   // AddHous(
//   //     300,
//   //     "Home4",
//   //     'https://i.pinimg.com/236x/e2/03/b4/e203b442e640f751c9cdd744261b786d.jpg',
//   //     "077777777",
//   //     "Husing",
//   //     "amman",
//   //     "Students",
//   //     6),
//   // AddHous(
//   //     150,
//   //     "Home5",
//   //     'https://i.pinimg.com/236x/e2/03/b4/e203b442e640f751c9cdd744261b786d.jpg',
//   //     "077777777",
//   //     "Husing",
//   //     "amman",
//   //     "Students",
//   //     4),
// ]);

////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
////////////////////////////////
// class HousingClass {
//   final int rooms;
//   final String availabilityDate;
//
//   HousingClass({
//     required this.rooms,
//     required this.availabilityDate,
//   });
// }

//////////////////////
//////////////////////
//////////////////////
//////////////////////

class ThemeService {
  final lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.blueGrey.shade300,
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF15b9b4),
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    ),
    canvasColor: Colors.black,
    dividerColor: Colors.black,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey,
      hintStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      labelStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.black45),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFF15b9b4), width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.black45, width: 1),
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
      iconColor: Colors.black,
      backgroundColor: Colors.white54,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    )),
    /////////////////////
    /////////////////////
    /////////////////////
    /////////////////////
    /////////////////////
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.grey,
      hintStyle: TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      labelStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.black45),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Color(0xFF15b9b4), width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: Colors.black45, width: 1),
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
//البحث
// Expanded(
// child: Container(
// height: 50,
// decoration: BoxDecoration(
// boxShadow: [
// BoxShadow(
// color: Colors.black.withOpacity(0.3),
// blurRadius: 6.0,
// spreadRadius: 0.5,
// ),
// ],
// borderRadius: BorderRadius.circular(10),
// ),
// child: TextField(
// onChanged: null,
// decoration: InputDecoration(
// hintText: "ابحث هنا...",
// hintStyle:
// TextStyle(color: Colors.black, fontSize: 16),
// border: InputBorder.none,
// contentPadding: EdgeInsets.all(12),
// ),
// ),
// ),
// ),