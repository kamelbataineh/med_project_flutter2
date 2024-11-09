import 'package:flutter/material.dart';
import 'package:med_project_flutter2/consr_routes.dart';
import 'package:lottie/lottie.dart';

class ScreenRegisterUser extends StatefulWidget {
  const ScreenRegisterUser({super.key});

  @override
  State<ScreenRegisterUser> createState() => _HomeState();
}

class _HomeState extends State<ScreenRegisterUser> {
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
            Lottie.network(
              "https://lottie.host/84ad8c2d-1bdd-4b4a-ba71-16243f26c7c5/zNoEoKMJy6.json",
              width: 100,
              height: 100,
              fit: BoxFit.none,
            ),
            SizedBox(height: 20),
            // حقول التسجيل
            buildTextField('البريد الإلكتروني', Icons.email, true),
            buildTextField('كلمة السر', Icons.lock, true),
            buildTextField('تأكيد كلمة السر', Icons.lock_outline, true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(route_cities2);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF15b9b4),
                padding: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('تسجيل', style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, bool obscureText) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Color(0xFF15b9b4)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
