import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
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
import 'package:med_project_flutter2/user/SiginORSigup_user.dart';
import 'package:med_project_flutter2/userORrented.dart';

class ScreenRegisterUser extends StatefulWidget {
  const ScreenRegisterUser({super.key});

  @override
  State<ScreenRegisterUser> createState() => _HomeState();
}

class _HomeState extends State<ScreenRegisterUser> {
  final _formkey = GlobalKey<FormState>();
  bool isPasswordVisible = true;
  bool isPasswordVisibleConfirm = true;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SiginorsigupUser(),
            ));
          },
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: null,
        ),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Align(
                //   alignment: Alignment.center,
                //   child: TextButton(
                //     onPressed: () {
                //       Navigator.of(context).pushNamed(route_ScreenCitiesUser);
                //     },
                //     child: Text(
                //       "دخول دون تسجيل",
                //       style: TextStyle(
                //         color: Colors.black,
                //         fontSize: 10,
                //         fontWeight: FontWeight.bold,
                //       ),
                //     ),
                //   ),
                // ),
                Lottie.network(
                  "https://lottie.host/84ad8c2d-1bdd-4b4a-ba71-16243f26c7c5/zNoEoKMJy6.json",
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),

                SizedBox(height: 20),
                buildTextField('Your email', Icons.email, false),
                buildPasswordField("Password", isPasswordVisible, () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                }),
                // buildPasswordField("تأكيد كلمة السر", isPasswordVisibleConfirm, () {
                //   setState(() {
                //     isPasswordVisibleConfirm = !isPasswordVisibleConfirm;
                //   });
                // }),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      signup();
                    }

                    // Navigator.of(context)
                    //     .pushReplacementNamed(route_ScreenLoginUser);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF15b9b4),
                    padding: EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('Sign Up',
                      style: TextStyle(fontSize: 14, color: Colors.black)),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'or',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                  ],
                )
,
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 70,
                        height: 35,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Colors.grey[200]!, width: 1),
                        ),
                        child: Image.network(
                          'https://imgs.search.brave.com/g17BH7ApM9d8-w9e-JPSNcH8j_6dKtlc-P0jl3lYp6Y/rs:fit:32:32:1:0/g:ce/aHR0cDovL2Zhdmlj/b25zLnNlYXJjaC5i/cmF2ZS5jb20vaWNv/bnMvMGIyNDZlZGM5/Y2MxOTI5ODg1NTU5/YTA0YTYxNTEwMjZi/NTZlZDY4NGE2ODVm/OGVjNTg4MzE3ZDMz/YjdhNDI4Yi93d3cu/Z29vZ2xlLmNvbS8',
                          width: 40,
                          height: 40,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 70,
                        height: 35,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Colors.grey[200]!, width: 1),
                        ),
                        child: Image.network(
                          'https://imgs.search.brave.com/VpOsyUaQQGp5MT_drqEzgpxdO8o12jax0jeq0Vojuto/rs:fit:32:32:1:0/g:ce/aHR0cDovL2Zhdmlj/b25zLnNlYXJjaC5i/cmF2ZS5jb20vaWNv/bnMvMmQzM2JiZDhi/OWVhNGYxZmRkNDli/NzAxODUzMzFhYTNm/ODcxNmE4ZGQ5OTE3/MWU4OGZjNDQyZDdh/NzQ4MWE4YS94LmNv/bS8',
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        width: 70,
                        height: 35,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          border:
                              Border.all(color: Colors.grey[200]!, width: 1),
                        ),
                        child: Image.network(
                          'https://imgs.search.brave.com/dLixlA4UobvGUEiaQkUND9GlJ8LNiMYgm1baQcXkgP4/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9jZG4u/bG9nb2pveS5jb20v/d3AtY29udGVudC91/cGxvYWRzLzIwMjMw/OTIxMTA0NDA4L0Zh/Y2Vib29rLWxvZ28t/NjAweDMxOS5wbmc',
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                )
                ,Divider(
                  color: Colors.grey,
                  thickness: 1,
                  height: 20,
                ),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Sign in",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {

                            },
                        ),
                      ],
                    ),
                  ),
                )

              ],
            ),
          )),
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

  Widget buildTextField(String label, IconData icon, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        onSaved: (e) {
          email = e;
        },
        style: TextStyle(
          fontFamily: 'Arial',
          fontSize: 17.0,
          color: Colors.black,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: Colors.grey[300],
          filled: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
          hintText: label,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }

  Widget buildPasswordField(
      String label, bool isVisible, VoidCallback toggleVisibility) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        onSaved: (p) {
          password = p;
        },

        ////////////////مهم////////////////////
        obscureText: isVisible,
        style: TextStyle(
          fontFamily: 'Arial',
          fontSize: 17.0,
          color: Colors.black,
        ),
        ///////////////////////////////////
        decoration: InputDecoration(
          fillColor: Colors.grey[300],
          filled: true,
          // prefixIcon: Icon(Icons.lock, color: Color(0xFF15b9b4)),
          suffixIcon: IconButton(
              icon: Icon(
                isVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
              onPressed: toggleVisibility),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none),
          contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
          hintText: label,
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
