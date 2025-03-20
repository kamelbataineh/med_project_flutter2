import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_project_flutter2/consr_routes.dart';
import 'package:lottie/lottie.dart';
import 'package:med_project_flutter2/rented/Screen_login_rented.dart';
import 'package:med_project_flutter2/rented/SiginORSigup_rented.dart';
import 'package:med_project_flutter2/userORrented.dart';

import '../FireBase/AuthService.dart';
import '../user/Screen_login_user.dart';

class ScreenRegisterRented extends StatefulWidget {
  const ScreenRegisterRented({super.key});

  @override
  State<ScreenRegisterRented> createState() => _HomeState();
}

class _HomeState extends State<ScreenRegisterRented> {
  ///////////////////////////////////////////////////////////////////////////////
  bool isPasswordVisible = true;
  bool isPasswordVisibleConfirm = true;
  String? select;

  ///////////////////////////////////////////////////////////////////////////////

  final _formkey = GlobalKey<FormState>();
  int? phone;
  String? business_Name;
  String? email;
  String? password;

  ///////////////////////////////////////////////////////////////////////////////

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => SiginorsigupRented(),
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
                buildTextField(
                  'Trade Name',
                  Icons.home,
                  false,
                      (value) {
                    business_Name = value;
                  },
                ),
                buildTextField('Your email', Icons.email, true, (value) {
                  email = value;
                }),
                buildTextField("Phone", Icons.phone, true, (value) {
                  if (value != null && value.isNotEmpty) {
                    if (value.length <= 10) {
                      phone = int.tryParse(value);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              "The phone number must contain 10 digits or fewer."),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                }),
                buildPasswordField("Password", isPasswordVisible, () {
                  setState(() {
                    isPasswordVisible = !isPasswordVisible;
                  });
                }),
                // bu
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
                          text: "Sign In",
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF15b9b4),
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context).pushReplacement(MaterialPageRoute(
                                builder: (context) => ScreenLoginUser(),
                              ));
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

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////

  ///
  /// firebase Sign up
  ///

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////
  signup() async {

    if (email == null || password == null || business_Name == null || phone == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill in all the fields.")),
      );
      return;
    }


    Authprocess authprocess = await AuthService.registerRented(
      email!, password!, business_Name!, phone!,
    );

    if (authprocess.isValid) {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Good")),
      );

      Future.delayed(Duration(seconds: 2), () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => ScreenLoginRented(),
          ),
        );
      });
    } else {

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(authprocess.errorMsg)),
      );
      print("Error occurred: ${authprocess.errorMsg}");
    }
  }

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////

  ///
  /// TextFormField()  email & password & phone & business_Name
  ///

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////
  final FocusNode _focusNode = FocusNode();

  Widget buildTextField(
      String label,
      IconData icon,
      bool required,
      Function(String?)? onSaved,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        onSaved: onSaved,
        keyboardType:
        label == "Phone" ? TextInputType.number : TextInputType.text,
        inputFormatters:
        label == "Phone" ? [FilteringTextInputFormatter.digitsOnly] : [],
        style: TextStyle(
          fontFamily: 'Arial',
          fontSize: 17.0,
          color: Colors.black,
        ),
        decoration: InputDecoration(
          fillColor: Colors.grey[300],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
          hintText: label,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(icon, color: Color(0xFF15b9b4),size: 15),
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
        style: TextStyle(
          fontFamily: 'Arial',
          fontSize: 17.0,
          color: Colors.black,
        ),
        obscureText: isVisible,
        decoration: InputDecoration(
          fillColor: Colors.grey[300],
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
          hintText: label,
          hintStyle: TextStyle(color: Colors.grey),
          prefixIcon: Icon(Icons.lock, color: Color(0xFF15b9b4),size: 15,),
          suffixIcon: IconButton(
            icon: Icon(
              isVisible ? Icons.visibility_off : Icons.visibility,
              color: Colors.black,size: 15
            ),
            onPressed: toggleVisibility,
          ),
        ),
      ),
    );
  }

}
