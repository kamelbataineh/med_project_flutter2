import 'package:flutter/material.dart';
import 'package:med_project_flutter2/consr_routes.dart';
import 'package:lottie/lottie.dart';


class ScreenRegister extends StatefulWidget {
  const ScreenRegister({super.key});

  @override
  State<ScreenRegister> createState() => _HomeState();
}

class _HomeState extends State<ScreenRegister> {
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
                      Navigator.of(context).popAndPushNamed(route_register1);

                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF15b9b4),
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
                      Navigator.of(context).pushNamed(route_login);

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
                  Navigator.of(context).pushNamed(route_cities2);
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

            Lottie.network("https://lottie.host/84ad8c2d-1bdd-4b4a-ba71-16243f26c7c5/zNoEoKMJy6.json",
              width: 100,
              height: 100,
              fit: BoxFit.none,
            ),
            SizedBox(height: 20,),
            ///////////////
            buildTextField('الاسم', Icons.person, true),
            buildTextField('الاسم التجاري', Icons.home, false),
            buildTextField('وصف العمل التجاري', Icons.info, false),
            buildTextField('البريد الإلكتروني', Icons.email, true),
            buildTextField('كلمة السر', Icons.visibility, true ),
            buildTextField('تأكيد كلمة السر', Icons.visibility, true,),
            buildTextField('الهاتف', Icons.phone, true),
            buildTextField('العنوان - شارع - بجانب مكان', Icons.location_city, true),
            //////////////
            SizedBox(height: 10),

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
              child: Text('حساب جديد', style: TextStyle(fontSize: 18,color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, bool required,) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
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


