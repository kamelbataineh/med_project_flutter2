import 'package:flutter/material.dart';
import 'package:med_project_flutter2/Screen_favorite.dart';
import 'package:med_project_flutter2/Screen_setting.dart';
import 'package:med_project_flutter2/consr_routes.dart';
import 'package:lottie/lottie.dart';

class ScreenRegisterUser extends StatefulWidget {
  const ScreenRegisterUser({super.key});

  @override
  State<ScreenRegisterUser> createState() => _HomeState();
}

class _HomeState extends State<ScreenRegisterUser> {
  List<Widget> pages = [
    ScreenRegisterUser(),
    ScreenFavorite(),
    ScreenSetting(),
  ];
int indexpage =0;
  bool isPasswordVisible = true;
  bool isPasswordVisibleConfirm = true;

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
                          .popAndPushNamed(route_ScreenRegisterUser);
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
                      Navigator.of(context).pushNamed(route_ScreenLoginUser);
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
            SizedBox(height: 20),
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
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .pushReplacementNamed(route_ScreenLoginUser);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF15b9b4),
                padding: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('تسجيل',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
        CurvedBottomNavigationBar(
          selectedIndex: 0,
          onItemTapped: (index) {
            print("Tapped on item: $index");
          },
          icons: [Icons.home, Icons.search, Icons.notifications, Icons.person],
          labels: ['Home', 'Search', 'Notifications', 'Profile'],
          screens: [
            Center(child: Text("Home Screen")),
            Center(child: Text("Search Screen")),
            Center(child: Text("Notifications Screen")),
            Center(child: Text("Profile Screen")),
          ],
          backgroundColor: Colors.blue,
          selectedIconColor: Colors.white,
          unselectedIconColor: Colors.white70,
          selectedItemFontStyle: TextStyle(fontSize: 14, color: Colors.white),
          unselectedItemFontStyle: TextStyle(fontSize: 12, color: Colors.white70),
        )

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

  Widget buildPasswordField(
      String label, bool isVisible, VoidCallback toggleVisibility) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        ////////////////مهم////////////////////
        obscureText: isVisible,
        ///////////////////////////////////
        decoration: InputDecoration(
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
