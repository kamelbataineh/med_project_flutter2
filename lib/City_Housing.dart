import 'package:flutter/material.dart';
import 'package:med_project_flutter2/Housing_Details_Page.dart';
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
          child: Text(' المضافة', style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Color(0xFF15b9b4),
      ),
      body:Expanded(
    child: GridView.builder(
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 1,
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
          leading: Image.network(
            house.images,
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
          title: Text(house.name),
          subtitle: Text('${house.cityname} - ${house.typename}'),
          trailing: Icon(Icons.location_on),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HousingDetailsPage(housing: HousingClass(name: "dd", location:"amman", price: 13, rooms:3, availabilityDate:"2002")),
              ),
            );
          },
        ),
      );},
    ),
    ),

    );
  }
}
