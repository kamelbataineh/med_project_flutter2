import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:med_project_flutter2/rented/Screen_cities_rented.dart';
import 'package:med_project_flutter2/user/Screen_cities_user.dart';
import 'Class_Favorites.dart';
import 'based_router.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// @override
//   void initState(){
//     super.initState();
//     FirebaseAuth.instance.authStateChanges().listen((User? user) {
//       if (user == null) {
//         print('User is currently signed out!');
//       } else {
//         print('User is signed in!');
//       }
//     });
//   }
//


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: "Userorrented",
      // onGenerateRoute: RouteClass.generator,
 home:ScreenCitiesRented(),
      //////////////////////////////////
      //////////////////////////////////
      //////////////////////////////////
      //////////////////////////////////
      //////////////////////////////////
      //////////////////////////////////
    //   //////////////////////////////////
    //     theme: ThemeService().lightTheme,
    // darkTheme: ThemeService().darkTheme,
    // themeMode: ThemeService().getThemeMode()
    //
    //











  //     theme:
  //     ThemeData(
  //       textTheme: TextTheme(
  //         bodySmall: TextStyle(
  //             fontSize: 13, color: Colors.black, fontWeight: FontWeight.bold),
  //         bodyMedium: TextStyle(fontSize: 20, color: Colors.black),
  //         bodyLarge: TextStyle(fontSize: 25, color: Colors.black),
  //       ),
  //       //////////////////////////////////
  //       //////////////////////////////////
  //       //////////////////////////////////
  //       //////////////////////////////////
  //       //////////////////////////////////
  //       //////////////////////////////////
  //       //////////////////////////////////
  //       elevatedButtonTheme: ElevatedButtonThemeData(
  //           style: ElevatedButton.styleFrom(
  //         backgroundColor: const Color(0xFF15b9b4),
  //         padding: const EdgeInsets.symmetric(vertical: 10),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(8),
  //         ),
  //       )),
  //       inputDecorationTheme: InputDecorationTheme(
  //         hintStyle: TextStyle(fontSize: 10, color: Colors.black),
  //         filled: true,
  //         fillColor: Colors.grey[200],
  //         labelStyle: TextStyle(fontSize: 15),
  //         border: OutlineInputBorder(
  //             borderRadius: BorderRadius.circular(10),
  //             borderSide: BorderSide(color: Colors.red,)),
  //         contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
  //         focusedBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(8),
  //           borderSide: BorderSide(color: Color(0xFF15b9b4), width: 2), // border عند التركيز
  //         ),
  //         enabledBorder: OutlineInputBorder(
  //           borderRadius: BorderRadius.circular(8),
  //           borderSide: BorderSide(color: Colors.grey.shade300, width: 2), // border عند التمكين
  //         ),
  //       ),
  //
  //       bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //         backgroundColor: Colors.green,
  //         selectedItemColor: Colors.white,
  //         unselectedItemColor: Colors.grey,
  //       ),
  //       ),
  //
    );

  }



}
