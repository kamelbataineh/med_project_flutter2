import 'package:flutter/material.dart';
import 'package:med_project_flutter2/consr_routes.dart';
import 'package:lottie/lottie.dart';

class ScreenRegisterRented extends StatefulWidget {
  const ScreenRegisterRented({super.key});

  @override
  State<ScreenRegisterRented> createState() => _HomeState();
}

class _HomeState extends State<ScreenRegisterRented> {
  bool isPasswordVisible = true;
  bool isPasswordVisibleConfirm = true;

  String? select;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed(route_Userorrented);
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
                      Navigator.of(context).pushNamed(route_ScreenLoginRented);
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
            buildTextField('الاسم', Icons.person, true),
            buildTextField('الاسم التجاري', Icons.home, false),
            buildTextField('وصف العمل التجاري', Icons.info, false),
            buildTextField('البريد الإلكتروني', Icons.email, true),
            buildPasswordField("كلمة السر", isPasswordVisible, () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            }),
            buildPasswordField("تأكيد كلمة السر", isPasswordVisibleConfirm, () {
              setState(() {
                isPasswordVisibleConfirm = !isPasswordVisibleConfirm;
              });
            }),
            buildTextField('الهاتف', Icons.phone, true),
            buildTextField(
                'العنوان - شارع - بجانب مكان', Icons.location_city, true),
            //////////////
            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(route_ScreenLoginRented);
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
    );
  }

  Widget buildTextField(
    String label,
    IconData icon,
    bool required,
  ) {
    return Padding(

      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
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
      child: TextField(
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
