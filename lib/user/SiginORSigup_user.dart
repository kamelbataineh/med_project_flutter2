import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:med_project_flutter2/rented/Screen_login_rented.dart';

import '../userORrented.dart';
import 'Screen_login_user.dart';
import 'Screen_register_user.dart';
class SiginorsigupUser extends StatefulWidget {
  const SiginorsigupUser({super.key});

  @override
  State<SiginorsigupUser> createState() => _SiginorsigupState();
}

class _SiginorsigupState extends State<SiginorsigupUser> {
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
      body:   Column(

        children: [
SizedBox(height: 160,),
          Lottie.network(
            "https://lottie.host/84ad8c2d-1bdd-4b4a-ba71-16243f26c7c5/zNoEoKMJy6.json",
            width: double.infinity,
            height: 100,

            fit: BoxFit.none,
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
                        builder: (context) => ScreenRegisterUser(),
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
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(onPressed: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenLoginUser(),
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
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
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
