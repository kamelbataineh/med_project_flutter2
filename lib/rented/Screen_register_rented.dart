import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:med_project_flutter2/consr_routes.dart';
import 'package:lottie/lottie.dart';
import 'package:med_project_flutter2/rented/Screen_login_rented.dart';
import 'package:med_project_flutter2/userORrented.dart';

import '../FireBase/AuthService.dart';

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
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Userorrented(),
              ),
            );
          },
        ),
        title: Align(
          alignment: Alignment.centerRight,
          child: Text('تسجيل'),
        ),
        backgroundColor: Color(0xFF15b9b4),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .popAndPushNamed(route_ScreenRegisterRented);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF15b9b4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'حساب جديد',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamed(route_ScreenLoginRented);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'تسجيل دخول',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(route_ScreenCitiesUser);
                  },
                  child: Text(
                    "دخول دون تسجيل",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              Lottie.network(
                "https://lottie.host/84ad8c2d-1bdd-4b4a-ba71-16243f26c7c5/zNoEoKMJy6.json",
                width: 100,
                height: 100,
                fit: BoxFit.none,
              ),
              SizedBox(
                height: 20,
              ),
              ///////////////
              buildTextField(
                'الاسم التجاري',
                Icons.home,
                false,
                (value) {
                  business_Name = value;
                },
              ),
              buildTextField('البريد الإلكتروني', Icons.email, true, (value) {
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
                            "رقم الهاتف يجب أن يحتوي على 10 أرقام أو أقل."),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              }),
              buildPasswordField("كلمة السر", isPasswordVisible, () {
                setState(() {
                  isPasswordVisible = !isPasswordVisible;
                });
              }),
              // buildPasswordField("تأكيد كلمة السر", isPasswordVisibleConfirm, () {
              //   setState(() {
              //     isPasswordVisibleConfirm = !isPasswordVisibleConfirm;
              //   });
              // }),

              //////////////
              SizedBox(height: 10),

              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    signup();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF15b9b4),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text('حساب جديد',
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
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
        decoration: InputDecoration(
          labelText: label,
          fillColor: Colors.grey[200],
          filled: true,
          prefixIcon: Icon(icon, color: Color(0xFF15b9b4)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
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
        ///////////////////////////////////
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          labelText: label,
          prefixIcon: Icon(Icons.lock, color: Color(0xFF15b9b4)),
          suffixIcon: IconButton(
              icon: Icon(
                isVisible ? Icons.visibility_off : Icons.visibility,
                color: Color(0xFF15b9b4),
              ),
              onPressed: toggleVisibility),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
