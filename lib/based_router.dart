import 'package:flutter/material.dart';
import 'package:med_project_flutter2/Screen_cities.dart';
import 'package:med_project_flutter2/Screen_register.dart';
import 'package:med_project_flutter2/U.irbed.dart';
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
import 'consr_routes.dart';

class RouteClass{
  static Route generator(RouteSettings sttings) {
    switch (sttings.name) {
      case route_register1:
        return builderscreen(ScreenRegister());
      case route_cities2:
        return builderscreen(ScreenCities());
      case route_irbed:
        return builderscreen(U_irbed());
      case route_ajlon:
        return builderscreen(U_Ajlon());
        case route_jarash:
        return builderscreen(U_Jarash());
        case route_karak:
        return builderscreen(U_Karak());
        case route_amman:
        return builderscreen(U_Amman());
        case route_aqaba:
        return builderscreen(U_Aqaba());
        case route_maan:
        return builderscreen(U_Maan());
      case route_mafraq:
        return builderscreen(U_mafraq());
      case route_zarqa:
        return builderscreen(U_Zarqa());
        case route_tafileh:
        return builderscreen(U_Tafileh());
        case route_balqa:
        return builderscreen(U_Balqa());

        default:
        return MaterialPageRoute(
            builder: (_) =>ScreenRegister());
    }
  }
}

MaterialPageRoute builderscreen(Widget screen) {
  return MaterialPageRoute(builder: (_) => screen);
}
