import 'package:flutter/material.dart';
import 'Housing_Details_Page.dart';
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
        itemCount: itemhous.favorit.length,
        itemBuilder: (context, index) {
          final house = itemhous.favorit[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HousingDetailsPage(
                    housing: HousingClass(
                      rooms: 3,
                      availabilityDate: "2024-12-31",
                    ),
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
