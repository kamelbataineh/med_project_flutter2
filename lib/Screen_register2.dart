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
        appBar: AppBar(
          title: Center(
            child: Text(
              'التسجيل',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          backgroundColor: Color(0xFF15b9b4),
        ),
        //////////
        //////////
        /////////////////////////
        //////////
        //////////

        body: Stack(
          children: [
            // Centered content in the Column
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.network(
                  "https://lottie.host/84ad8c2d-1bdd-4b4a-ba71-16243f26c7c5/zNoEoKMJy6.json",
                  width: 150,
                  height: 150,
                  fit: BoxFit.fill,
                ),
                SizedBox(height: 10),
                // Center(
                //   child: Text(
                //     "ستصل لك رساله",
                //     style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: TextFormField(
                      decoration: decorationPhoneNumber(
                        lab: "رقم الهاتف",
                        hint: "أدخل رقم هاتفك",
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF15b9b4),
                    padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Text(
                    "تأكيد",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.topLeft,
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
          ],
        ),
    );
  }
}
//////////////////////////////////
/////////////////////////////////
////////////////////////////////
///////////////////////////////
//////////////////////////////
InputDecoration decorationPhoneNumber({
  required String lab,
  required String hint,
}) {
  return InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFF15b9b4),
        width: 2,
      ),
      borderRadius: BorderRadius.circular(30),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: Color(0xFF15b9b4),
        width: 2,
      ),
      borderRadius: BorderRadius.circular(20),
    ),
    labelText: lab,
    hintText: hint,
    labelStyle: TextStyle(
        fontSize: 17, color: Colors.black, fontWeight: FontWeight.bold),
    hintStyle: TextStyle(color: Colors.black, fontSize: 15),
    filled: true,
    fillColor: Colors.transparent,
    contentPadding: EdgeInsets.symmetric(horizontal: 10),
    errorStyle: TextStyle(color: Colors.red, fontSize: 10),
  );
}
