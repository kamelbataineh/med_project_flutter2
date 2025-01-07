import 'package:flutter/material.dart';
import 'Addinfo.dart';
import 'Housing_Details_Page.dart';
import 'Class_Favorites.dart';
class CityHousing extends StatefulWidget {
  const CityHousing({super.key});

  @override
  State<CityHousing> createState() => _CityHousingState(itemhous: []);
}

class _CityHousingState extends State<CityHousing> {
  final List<AddHous> itemhous;
  _CityHousingState({required this.itemhous});


  List<AddHous> randomHousings = [
    AddHous(1000.0, 'House 1', 'https://via.placeholder.com/150', '123-456-7890', 'City 1', 'https://www.google.com/maps/place/City1', 'Type 1', 1),
    AddHous(1100.0, 'House 2', 'https://via.placeholder.com/150', '123-456-7891', 'City 2', 'https://www.google.com/maps/place/City2', 'Type 2', 2),
    AddHous(1200.0, 'House 3', 'https://via.placeholder.com/150', '123-456-7892', 'City 3', 'https://www.google.com/maps/place/City3', 'Type 3', 3),
    AddHous(1300.0, 'House 4', 'https://via.placeholder.com/150', '123-456-7893', 'City 4', 'https://www.google.com/maps/place/City4', 'Type 4', 4),
    AddHous(1400.0, 'House 5', 'https://via.placeholder.com/150', '123-456-7894', 'City 5', 'https://www.google.com/maps/place/City5', 'Type 5', 5),
    AddHous(1500.0, 'House 6', 'https://via.placeholder.com/150', '123-456-7895', 'City 6', 'https://www.google.com/maps/place/City6', 'Type 6', 6),
    AddHous(1600.0, 'House 7', 'https://via.placeholder.com/150', '123-456-7896', 'City 7', 'https://www.google.com/maps/place/City7', 'Type 7', 7),
    AddHous(1700.0, 'House 8', 'https://via.placeholder.com/150', '123-456-7897', 'City 8', 'https://www.google.com/maps/place/City8', 'Type 8', 8),
    AddHous(1800.0, 'House 9', 'https://via.placeholder.com/150', '123-456-7898', 'City 9', 'https://www.google.com/maps/place/City9', 'Type 9', 9),
    AddHous(1900.0, 'House 10', 'https://via.placeholder.com/150', '123-456-7899', 'City 10', 'https://www.google.com/maps/place/City10', 'Type 10', 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(
            'المضافة',
            style: TextStyle(color: Colors.black),
          ),
        ),
        backgroundColor: Color(0xFF15b9b4),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        padding: EdgeInsets.all(10),
        physics: BouncingScrollPhysics(),
        itemCount: randomHousings.length,
        itemBuilder: (context, index) {
          final house = randomHousings[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HousingDetailsPage(
                    housing: house,
                  ),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                      child: Image.network(
                        house.images.isNotEmpty
                            ? house.images
                            : 'https://via.placeholder.com/150',
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          house.name,
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${house.cityname} - ${house.typename} \$${house.price}',
                          style: TextStyle(color: Colors.grey[600], fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
