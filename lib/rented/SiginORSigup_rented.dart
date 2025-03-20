import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:med_project_flutter2/rented/Screen_login_rented.dart';
import 'package:med_project_flutter2/rented/Screen_register_rented.dart';

import '../user/Screen_login_user.dart';
import '../user/Screen_register_user.dart';
import '../userORrented.dart';
class SiginorsigupRented extends StatefulWidget {
  const SiginorsigupRented({super.key});

  @override
  State<SiginorsigupRented> createState() => _SiginorsigupRentedState();
}

class _SiginorsigupRentedState extends State<SiginorsigupRented> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => Userorrented(),
            ));

          },
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child:null,
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body:   Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
SizedBox(height: 160,),
          Lottie.network(
            "https://lottie.host/84ad8c2d-1bdd-4b4a-ba71-16243f26c7c5/zNoEoKMJy6.json",
            width: 80,
            height: 80,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 100,),

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ScreenRegisterRented(),
                      ));

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF15b9b4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 12,
                        color:Colors.black,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenLoginRented(),
                    ));

                  },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF15b9b4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ), ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
