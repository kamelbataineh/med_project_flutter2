import 'package:flutter/material.dart';
import 'Class_Favorites.dart';
class CityHousing extends StatelessWidget {
  final HousClass itemhous;

  CityHousing({required this.itemhous});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text('السكنات المضافة', style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Color(0xFF15b9b4),
      ),
      body: ListView.builder(
        itemCount: itemhous.favorit.length,
        itemBuilder: (context, index) {
          final house = itemhous.favorit[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text(house.name),
              subtitle: Text('${house.cityname} - ${house.typename}'),
              trailing: Icon(Icons.location_on),
            ),
          );
        },
      ),
    );
  }
}
