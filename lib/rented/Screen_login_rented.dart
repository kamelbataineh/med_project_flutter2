import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:med_project_flutter2/consr_routes.dart';

class ScreenLoginRented extends StatefulWidget {
  const ScreenLoginRented({super.key});

  @override
  State<ScreenLoginRented> createState() => _ScreenLoginRentedState();
}

class _ScreenLoginRentedState extends State<ScreenLoginRented> {
  bool isPasswordVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushNamed(route_register1); 
          },
        ),
        title:  Align(
          alignment: Alignment.centerRight,
          child:Text('تسجيل الدخول'),),
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
                    Navigator.of(context).pushNamed(route_ScreenRegisterRented);

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text('حساب جديد',style: TextStyle(color: Colors.black),),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(route_ScreenLoginRented);

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF15b9b4),
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
            Lottie.network(
              "https://lottie.host/84ad8c2d-1bdd-4b4a-ba71-16243f26c7c5/zNoEoKMJy6.json",
              width: 100,
              height: 100,
              fit: BoxFit.none,
            ),
            SizedBox(height: 20,),
            buildTextField('البريد الإلكتروني', Icons.email, false),
            buildPasswordField('كلمة السر'),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacementNamed(route_ScreenCitiesRented);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF15b9b4),
                padding: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('تسجيل دخول', style: TextStyle(fontSize: 18,color: Colors.black)),
            ),
            SizedBox(height: 20),
           ],
        ),
      ),
    );
  }

  ///////////////////////////////////
  ///////////////////////////////////
  ///////////////////////////////////
  ///////////////////////////////////
//////////////////////////////////////

  Widget buildTextField(String label, IconData icon,bool x) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          labelText: label,
          prefixIcon: Icon(icon, color: Color(0xFF15b9b4)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),

          ),

        ),
        obscureText: x,
      ),
    );
  }
  Widget buildPasswordField(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        ////////////////مهم////////////////////
        obscureText: isPasswordVisible,
        ///////////////////////////////////
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          labelText: label,
          prefixIcon:  Icon(Icons.lock, color: Color(0xFF15b9b4)),
          suffixIcon: IconButton(
            icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color:  Color(0xFF15b9b4),
            ),
            onPressed: () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}