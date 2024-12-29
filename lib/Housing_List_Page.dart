import 'package:flutter/material.dart';
import 'Class_Favorites.dart';
import 'Housing_Details_Page.dart';
class HousingListPage extends StatelessWidget {
  final List<HousingClass> housings = [
    HousingClass(
      name: 'شقة في إربد',
      location: 'الحصن',
      price: 300,
      rooms: 2,
      availabilityDate: '2023-12-01',
    ),
    HousingClass(
      name: 'شقة في إربد',
      location: 'دوار الثقافة',
      price: 350,
      rooms: 3,
      availabilityDate: '2024-01-10',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('قائمة السكن'),
      ),
      body: ListView.builder(
        itemCount: housings.length,
        itemBuilder: (context, index) {
          final housing = housings[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(housing.name),
              subtitle: Text('${housing.price} دولار/شهر'),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HousingDetailsPage(housing: housing),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
