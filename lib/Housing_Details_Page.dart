import 'package:flutter/material.dart';
import 'Class_Favorites.dart';

class HousingDetailsPage extends StatelessWidget {
  final irbidClass itemhous;

  HousingDetailsPage({required this.itemhous, required HousingClass housing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('تفاصيل السكن'),
      ),
      body: ListView.builder(
        itemCount: itemhous.favorit.length,
        itemBuilder: (context, index) {
          final house = itemhous.favorit[index]; // Access the individual house based on index

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text('عدد الغرف: ${house.phone}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('متاح من: ${house.price}', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                Text('السعر: ${house.price} دولار/شهر', style: TextStyle(fontSize: 18)),
                SizedBox(height: 8),
                // If there's an image or additional info, you can add it below
                // Example for displaying an image if it's part of the HousingClass
                // Image.network(house.imageUrl),
              ],
            ),
          );
        },
      ),
    );
  }
}
