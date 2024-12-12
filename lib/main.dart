import 'package:flutter/material.dart';
import 'package:med_project_flutter2/Screen_login_rented.dart';
import 'package:med_project_flutter2/Screen_register_user.dart';
import 'package:med_project_flutter2/U_Amman.dart';
import 'package:med_project_flutter2/U_Aqaba.dart';
import 'package:med_project_flutter2/U_Balqa.dart';
import 'package:med_project_flutter2/U_Maan.dart';
import 'package:med_project_flutter2/U_Tafileh.dart';
import 'package:med_project_flutter2/U_Zarqa.dart';
import 'package:med_project_flutter2/U_ajlon.dart';
import 'package:med_project_flutter2/U_jarash.dart';
import 'package:med_project_flutter2/U_karak.dart';
import 'package:med_project_flutter2/U_mafraq.dart';
import 'package:med_project_flutter2/consr_routes.dart';
import 'package:med_project_flutter2/userORrented.dart';
import 'Screen_register_rented.dart';
import 'Screen_cities_rented.dart';
import 'U.irbed.dart';
import 'based_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: route_Userorrented,
      onGenerateRoute: RouteClass.generator,
// home:ScreenRegisterUser(),
      //////////////////////////////////
      //////////////////////////////////
      //////////////////////////////////
      //////////////////////////////////
      //////////////////////////////////
      //////////////////////////////////
      //////////////////////////////////

      theme: ThemeData(
        textTheme: TextTheme(
          bodySmall: TextStyle(
              fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(fontSize: 20, color: Colors.black),
          bodyLarge: TextStyle(fontSize: 25, color: Colors.black),
        ),
        //////////////////////////////////
        //////////////////////////////////
        //////////////////////////////////
        //////////////////////////////////
        //////////////////////////////////
        //////////////////////////////////
        //////////////////////////////////
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF15b9b4),
          padding: const EdgeInsets.symmetric(vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        )),
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 10, color: Colors.black),
          filled: true,
          fillColor: Colors.grey[200],
          labelStyle: TextStyle(fontSize: 15),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.red,)),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFF15b9b4), width: 2), // border عند التركيز
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade300, width: 2), // border عند التمكين
          ),
        ),
        ),

    );
  }
}
