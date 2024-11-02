import 'package:flutter/material.dart';
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
import 'Screen_register.dart';
import 'Screen_cities.dart';
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
      initialRoute: route_register1,
      onGenerateRoute: RouteClass.generator,
// home: U_Balqa(),
    );
  }
}
