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
    );
  }
}
