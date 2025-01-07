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
    AddHous(1000.0, 'House 1', 'https://i.pinimg.com/236x/3e/08/45/3e084507fe82c5fd9098f5eb1cce758e.jpg', '123-456-7890', 'City 1', 'https://www.google.com/maps/place/City1', 'Type 1', 1),
    AddHous(1100.0, 'House 2', 'https://i.pinimg.com/236x/3b/4a/b3/3b4ab3a6f53616bc80882372503c2122.jpg', '123-456-7891', 'City 2', 'https://www.google.com/maps/place/City2', 'Type 2', 2),
    AddHous(1200.0, 'House 3', 'https://i.pinimg.com/236x/5a/96/07/5a960747b6fa3fb1ebc970c7b56e4c51.jpg', '123-456-7892', 'City 3', 'https://www.google.com/maps/place/City3', 'Type 3', 3),
    AddHous(1300.0, 'House 4', 'https://i.pinimg.com/236x/7f/6f/0a/7f6f0a8668aa2da61d9025859406e2f1.jpg', '123-456-7893', 'City 4', 'https://www.google.com/maps/place/City4', 'Type 4', 4),
    AddHous(1400.0, 'House 5', 'https://i.pinimg.com/236x/7f/6f/0a/7f6f0a8668aa2da61d9025859406e2f1.jpg', '123-456-7894', 'City 5', 'https://www.google.com/maps/place/City5', 'Type 5', 5),
    AddHous(1500.0, 'House 6', 'https://i.pinimg.com/236x/47/cb/d8/47cbd8a4788a99f1b762c2c2098e5ad4.jpg', '123-456-7895', 'City 6', 'https://www.google.com/maps/place/City6', 'Type 6', 6),
    AddHous(1600.0, 'House 7', 'https://i.pinimg.com/236x/56/cc/f0/56ccf056ed9db9c5c4b0be5edb69b7bd.jpg', '123-456-7896', 'City 7', 'https://www.google.com/maps/place/City7', 'Type 7', 7),
    AddHous(1700.0, 'House 8', 'https://i.pinimg.com/236x/f5/4b/bc/f54bbc3f479cfe3cad0cc629f72d4b61.jpg', '123-456-7897', 'City 8', 'https://www.google.com/maps/place/City8', 'Type 8', 8),
    AddHous(1800.0, 'House 9', 'https://i.pinimg.com/236x/37/82/38/3782382b3ee3014fd70eb076e4779d78.jpg', '123-456-7898', 'City 9', 'https://www.google.com/maps/place/City9', 'Type 9', 9),
    AddHous(1900.0, 'House 10', 'https://i.pinimg.com/236x/e9/3f/6a/e93f6af0050a329ef87f9df8e30ab742.jpg', '123-456-7899', 'City 10', 'https://www.google.com/maps/place/City10', 'Type 10', 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [


        ],
        title:
        Align(
          alignment: Alignment.centerRight,
          child:
          Text(
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
                        // GestureDetector(
                        //   onTap: () {
                        //     if (index >= 0 && index < randomHousings.length) {
                        //       final city = randomHousings[index];
                        //       setState(() {
                        //         if (itemfavorit.favorit.contains(city)) {
                        //           itemfavorit.favorit.remove(city);
                        //           print("Removed ${city.name} from favorites.");
                        //         } else {
                        //           itemfavorit.favorit.add(city as PagesCitis);
                        //           print("Added ${city.name} to favorites.");
                        //         }
                        //       });
                        //     } else {
                        //       print("Invalid operation: Index $index is out of range.");
                        //     }
                        //   },
                        //   child: Icon(
                        //     itemfavorit.favorit.contains(itemhous)
                        //         ? Icons.favorite
                        //         : Icons.favorite_border,
                        //     color: Colors.red,
                        //     size: 28,
                        //   ),
                        // ),
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
