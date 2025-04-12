import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:med_project_flutter2/FireBase/AuthService.dart';
import 'package:med_project_flutter2/consr_routes.dart';
import 'package:med_project_flutter2/rented/Screen_cities_rented.dart';
import 'package:med_project_flutter2/user/Screen_cities_user.dart';
import 'package:med_project_flutter2/user/Screen_register_user.dart';

class ScreenLoginRented extends StatefulWidget {
  const ScreenLoginRented({super.key});

  @override
  State<ScreenLoginRented> createState() => _ScreenLoginRentedState();
}

class _ScreenLoginRentedState extends State<ScreenLoginRented> {
///////////////////////////////////////////////////////////////////////////////
  bool isPasswordVisible = true;

///////////////////////////////////////////////////////////////////////////////
  /// firebase value
///////////////////////////////////////////////////////////////////////////////
  final _formkey = GlobalKey<FormState>();
  String? email;
  String? password;

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                Lottie.network(
                  "https://lottie.host/84ad8c2d-1bdd-4b4a-ba71-16243f26c7c5/zNoEoKMJy6.json",
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
                SizedBox(
                  height: 20,
                ),
                buildTextField('Your email', Icons.email, false),
                buildPasswordField("Password", isPasswordVisible, () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                }),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_formkey.currentState!.validate()) {
                      _formkey.currentState!.save();
                      login();
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
                  child: Text('Sign In',
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
                      text: "New to Skanat? ",
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      children: [
                        TextSpan(
                          text: "Create an account",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF15b9b4),
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => ScreenRegisterUser(),
                              ));   },
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

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////

  ///
  /// firebase login
  ///

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////

  login() async {
    Authprocess authprocess = await AuthService.Login(email!, password!);
    if (authprocess.isValid == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Good")),
      );

      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ScreenCitiesRented(),
          ),
        );
      });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(authprocess.errorMsg)));
      print("Errorrrr");
    }
  }

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////

  ///
  /// TextFormField()  email & password
  ///

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////

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
                  color: Colors.black,size: 15
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
