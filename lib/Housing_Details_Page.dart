import 'package:flutter/material.dart';

import 'Class_Favorites.dart';
class HousingDetailsPage extends StatelessWidget {
  final HousingClass housing;

  HousingDetailsPage({required this.housing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل السكن'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('الاسم: ${housing.name}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('الموقع: ${housing.location}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('السعر: ${housing.price} دولار/شهر', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('عدد الغرف: ${housing.rooms}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text('متاح من: ${housing.availabilityDate}', style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}