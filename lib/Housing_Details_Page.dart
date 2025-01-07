import 'package:flutter/material.dart';

import 'Class_Favorites.dart';

class HousingDetailsPage extends StatelessWidget {

  final AddHous  housing;
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
          children:[
          Text('نوع السكن: ${housing.typename}', style: TextStyle(fontSize: 18)),
          SizedBox(height: 8),
          Text('عدد الغرف: ${housing.rooms}', style: TextStyle(fontSize: 18)),
          SizedBox(height: 8),
          Text('متاح من: ${housing.cityname}', style: TextStyle(fontSize: 18)),
          SizedBox(height: 8),
          Text('السعر: \$${housing.price} دولار/شهر', style: TextStyle(fontSize: 18)),
          SizedBox(height: 8),
          Text('الهاتف: ${housing.phone}', style: TextStyle(fontSize: 18)),
          SizedBox(height: 8),
          Text('الموقع: ${housing.map}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            housing.images.isNotEmpty
                ? Image.network(housing.images)
                : Container(),

          ],
        ),
      ),
    );
  }
}
