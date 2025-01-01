import 'package:flutter/material.dart';
import 'package:med_project_flutter2/Class_Favorites.dart';

class ScreenSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF15b9b4),
        title: Text('الإعدادات'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
          ThemeService().changeTheme();
              },
              child: Text("تغير لون الخلفيه"),
            ),
          ],
        ),
      ),
    );
  }
}