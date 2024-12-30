// import 'package:flutter/material.dart';
// import 'Class_Favorites.dart';
//
// class HousingDetailsPage extends StatelessWidget {
//   final irbidClass itemhous;
//   HousingDetailsPage({required this.itemhous});
//
//   @override
//   Widget build(BuildContext context) {
//     final house = itemhous.favorit[0]; // Access the first house/item from the favorit list
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('تفاصيل السكن'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Display the image if you have an image URL or asset
//             Image.network(house.phone), // Make sure house.imageUrl is properly defined
//             SizedBox(height: 8),
//             Text('اسم السكن: ${house.name}', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             Text('عدد الغرف: ${house.images}', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             Text('متاح من: ${house.cityname}', style: TextStyle(fontSize: 18)),
//             SizedBox(height: 8),
//             Text('السعر: ${house.price} دولار/شهر', style: TextStyle(fontSize: 18)),
//           ],
//         ),
//       ),
//     );
//   }
// }
