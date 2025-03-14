import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:med_project_flutter2/FireBase/AuthService.dart';
import 'package:med_project_flutter2/user/Screen_cities_user.dart';
import 'package:med_project_flutter2/More/Screen_favorite.dart';
import 'package:med_project_flutter2/More/App_Appearance.dart';
import 'package:med_project_flutter2/consr_routes.dart';
import 'package:lottie/lottie.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_bottom_navigation_bar/curved_bottom_navigation_bar.dart';
import 'package:med_project_flutter2/user/Screen_login_user.dart';

class ScreenRegisterUserPager extends StatefulWidget {
  const ScreenRegisterUserPager({super.key});

  @override
  State<ScreenRegisterUserPager> createState() => _HomeState();
}

class _HomeState extends State<ScreenRegisterUserPager> {
  final _formkey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  bool isPasswordVisibleConfirm = true;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 320,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("imgs/login5.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 30,
                    width: 80,
                    height: 400,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assetName"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 40,
                    top: 40,
                    width: 80,
                    height: 400,
                    child: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assetName"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromRGBO(143, 148, 251, .2),
                          blurRadius: 20.0,
                          offset: Offset(0, 10),
                        )
                      ],
                    ),
                    child:Column(
                      children: [

                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Adjust padding
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[200] ?? Colors.grey,
                              ),
                            ),
                          ),
                          child: buildTextField("Email or Phone number", true),
                        ),

                        // Password input field
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey[200] ?? Colors.grey,
                              ),
                            ),
                          ),
                          child: buildPasswordField(
                            "Password",
                            isPasswordVisible,
                                () {
                              setState(() {
                                isPasswordVisible = !isPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ],
            ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: LinearGradient(
                        colors: [Colors.black, Colors.black], // Gradient is the same color, can be improved
                      ),
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent, // Make the button background transparent
                        shadowColor: Colors.transparent, // Remove button shadow
                      ),
                      onPressed: () {
                        if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                          signup();
                        }
                      },
                      child: Center(
                        child: Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////
////////////////////////////////////////// sign up
//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////
  signup() async {
    Authprocess authprocess = await AuthService.registerUser(email!, password!);

    if (!authprocess.isValid) {
      print("Error message from AuthService: ${authprocess.errorMsg}");
    }

    if (authprocess.isValid) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Good")),
      );

      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ScreenLoginUser(),
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(authprocess.errorMsg)));
      print("Error occurred: ${authprocess.errorMsg}");
    }
  }

//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////
////////////////////////////////////////// google
//////////////////////////////////////////
//////////////////////////////////////////

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////
//////////////////////////////////////////

  Widget buildTextField(String hint, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextFormField(
        onSaved: (e) {
          email = e;
        },
        obscureText: obscureText,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  Widget buildPasswordField(
      String hint, bool isVisible, VoidCallback toggleVisibility) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        onSaved: (p) {
          password = p;
        },

        ////////////////مهم////////////////////
        obscureText: isVisible,
        ///////////////////////////////////
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[500]),
          suffixIcon: IconButton(

              icon: Icon(
                isVisible ? Icons.visibility_off : Icons.visibility,
                color:         Colors.black
              ),
              onPressed: toggleVisibility),

        ),
        style: TextStyle(fontSize: 14),
      ),
    );
  }
}
