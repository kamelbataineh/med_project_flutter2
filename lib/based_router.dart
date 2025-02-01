import 'package:flutter/material.dart';
import 'package:med_project_flutter2/rented/Screen_cities_rented.dart';
import 'package:med_project_flutter2/rented/Screen_login_rented.dart';
import 'package:med_project_flutter2/rented/Screen_register_rented.dart';
import 'package:med_project_flutter2/user/Screen_cities_user.dart';
import 'package:med_project_flutter2/user/Screen_login_user.dart';
import 'package:med_project_flutter2/user/Screen_register_user.dart';
import 'package:med_project_flutter2/userORrented.dart';
import 'Addinfo.dart';
import 'Introduction.dart';
import 'city/U.irbed.dart';
import 'city/U_Amman.dart';
import 'city/U_Aqaba.dart';
import 'city/U_Balqa.dart';
import 'city/U_Maan.dart';
import 'city/U_Tafileh.dart';
import 'city/U_Zarqa.dart';
import 'city/U_ajlon.dart';
import 'city/U_jarash.dart';
import 'city/U_karak.dart';
import 'city/U_mafraq.dart';
import 'consr_routes.dart';

class RouteClass {
  static Route generator(RouteSettings sttings) {
    switch (sttings.name) {
      //////////////////// Rented ////////////////////////

      case route_ScreenRegisterRented:
        return builderscreen(ScreenRegisterRented());

      case route_ScreenCitiesRented:
        return builderscreen(ScreenCitiesRented());

      case route_Addinfo:
        return builderscreen(Addinfo());


 case route_Userorrented:
        return builderscreen(Userorrented());

      case route_ScreenLoginRented:
        return builderscreen(ScreenLoginRented());

      ////////////////////// User //////////////////////

      case route_ScreenRegisterUser:
        return builderscreen(ScreenRegisterUser());


        case route_ScreenLoginUser:
        return builderscreen(ScreenLoginUser());

        case route_ScreenCitiesUser:
        return builderscreen(ScreenCitiesUser());

      ///////////////////////////////////////////

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

////////////////////////////////////////////////
      case route_Userorrented:
        return builderscreen(Userorrented());


////////////////////////////////////////////////
      default:
        return MaterialPageRoute(builder: (_) => Userorrented());
    }
  }
}

MaterialPageRoute builderscreen(Widget screen) {
  return MaterialPageRoute(builder: (_) => screen);
}
