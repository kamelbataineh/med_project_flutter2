import 'package:flutter/material.dart';
import 'Class_Favorites.dart';
class CityHousing extends StatelessWidget {
  final irbidClass itemhous;

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
      body:Expanded(
    child: GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: 8.0,
    mainAxisSpacing: 8.0,
    ),
    padding: EdgeInsets.all(5),
    physics: BouncingScrollPhysics(),
    itemCount:itemhous.favorit.length,
    itemBuilder: (context, index) {
    final house = itemhous.favorit[index];

    return Card(
        margin: EdgeInsets.all(10),
        child: ListTile(
          title: Text(house.name),
          subtitle: Text('${house.cityname} - ${house.typename}'),
          trailing: Icon(Icons.location_on),
        ),
      );},
    ),
    ),

        //   .builder(
        // itemCount: itemhous.favorit.length,
        // itemBuilder: (context, index) {
        //   final house = itemhous.favorit[index];
        //   return Card(
        //     margin: EdgeInsets.all(10),
        //     child: ListTile(
        //       title: Text(house.name),
        //       subtitle: Text('${house.cityname} - ${house.typename}'),
        //       trailing: Icon(Icons.location_on),
        //     ),
        //   );

    );
  }
}
