import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:med_project_flutter2/consr_routes.dart';
import 'package:med_project_flutter2/user/Screen_cities_user.dart';

class ScreenLoginUser extends StatefulWidget {
  const ScreenLoginUser({super.key});

  @override
  State<ScreenLoginUser> createState() => _ScreenLoginUserState();
}

class _ScreenLoginUserState extends State<ScreenLoginUser> {
  bool isPasswordVisible = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isValidEmail(String email) {
    String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }

  void validateAndLogin() {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || !isValidEmail(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى إدخال بريد إلكتروني ')),
      );
      return;
    }
    if (password.isEmpty || password.length < 8) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text('كلمة المرور يجب أن تحتوي على 8 أحرف على الأقل')),
      );
      return;
    }

    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ScreenCitiesUser(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text('تسجيل الدخول'),
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
                      Navigator.of(context).pushNamed(route_ScreenRegisterUser);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
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
            SizedBox(
              height: 20,
            ),
            buildTextField(
                'البريد الإلكتروني', Icons.email, false, emailController),
            buildPasswordField("كلمة السر", passwordController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: validateAndLogin,
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF15b9b4),
                padding: EdgeInsets.symmetric(vertical: 10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('تسجيل دخول',
                  style: TextStyle(fontSize: 18, color: Colors.black)),
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
  Widget buildTextField(
      String label, IconData icon, bool x, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          labelText: label,
          prefixIcon: Icon(icon, color: const Color(0xFF15b9b4)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        obscureText: x,
      ),
    );
  }

  Widget buildPasswordField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        ////////////////مهم////////////////////
        controller: controller,
        obscureText: isPasswordVisible,
        ///////////////////////////////////
        decoration: InputDecoration(
          fillColor: Colors.grey[200],
          filled: true,
          labelText: label,
          prefixIcon: Icon(Icons.lock, color: Color(0xFF15b9b4)),
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              color: Color(0xFF15b9b4),
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
