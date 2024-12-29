import 'package:flutter/material.dart';

class ScreenSetting extends StatelessWidget {
  final Function(bool) onThemeChanged;
  const ScreenSetting({super.key, required this.onThemeChanged});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text('الإعدادات'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              onThemeChanged(!isDarkMode);  // Toggle the theme
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: isDarkMode ? Colors.black : Colors.white,
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            ),
            child: Text(
              isDarkMode ? 'تفعيل الوضع النهاري' : 'تفعيل الوضع الليلي',
              style: TextStyle(
                color: isDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
