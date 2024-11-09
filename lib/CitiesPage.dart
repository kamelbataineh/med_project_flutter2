import 'package:flutter/material.dart';
import 'package:med_project_flutter2/consr_routes.dart';

class CitiesPage extends StatelessWidget {
  final List<String> jordanCities = [
    'إربد',
    'عمان',
    'الزرقاء',
    'العقبة',
    'مأدبا',
    'السلط',
    'جرش',
    'عجلون',
    'الكرك',
    'الطفيلة',
    'معان'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('جميع مدن الأردن'),
        backgroundColor: Color(0xFF15b9b4),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: jordanCities.map((city) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 6.0),
                child: ElevatedButton(
                  onPressed: () {
                    switch (city) {
                      case 'عمان':
                        break;
                      case 'إربد':
                        // Navigator.of(context).pushNamed(route_Addirbed);
                        break;
                      case 'الزرقاء':
                        break;
                      case 'العقبة':
                        break;
                      case 'مأدبا':
                        break;
                      case 'السلط':
                        break;
                      case 'جرش':
                        break;
                      case 'عجلون':
                        break;
                      case 'الكرك':
                        break;
                      case 'الطفيلة':
                        break;
                      case 'معان':
                        break;
                      default:
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF15b9b4),
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    city,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}
