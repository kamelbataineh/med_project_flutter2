import 'package:flutter/material.dart';
import 'package:med_project_flutter2/Class_Favorites.dart';

class AppAppearance extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Appearance",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
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