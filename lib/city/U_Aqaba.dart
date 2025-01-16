import 'package:flutter/material.dart';
import '../Class_Favorites.dart';
import '../Housing_Details_Page.dart';

class U_Aqaba extends StatefulWidget {
  const U_Aqaba({super.key});

  @override
  _U_AqabaState createState() => _U_AqabaState();
}

class _U_AqabaState extends State<U_Aqaba> {
  List<AddHous> randomHousings = [
     AddHous(1100.0, 'House 2', 'https://i.pinimg.com/236x/3b/4a/b3/3b4ab3a6f53616bc80882372503c2122.jpg', '123-456-7891', 'City 2', 'https://www.google.com/maps/place/City2', 'Type 2', 2),
  AddHous(1700.0, 'House 8', 'https://i.pinimg.com/236x/f5/4b/bc/f54bbc3f479cfe3cad0cc629f72d4b61.jpg', '123-456-7897', 'City 8', 'https://www.google.com/maps/place/City8', 'Type 8', 8),
    AddHous(1800.0, 'House 9', 'https://i.pinimg.com/236x/37/82/38/3782382b3ee3014fd70eb076e4779d78.jpg', '123-456-7898', 'City 9', 'https://www.google.com/maps/place/City9', 'Type 9', 9),
    AddHous(1900.0, 'House 10', 'https://i.pinimg.com/236x/e9/3f/6a/e93f6af0050a329ef87f9df8e30ab742.jpg', '123-456-7899', 'City 10', 'https://www.google.com/maps/place/City10', 'Type 10', 10),
  ];
  List<AddHous> favorit = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Housing"),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Aqaba(),
    );
  }

  Widget Aqaba() {
    return GridView.builder(
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
                builder: (context) => HousingDetailsPage(housing: house),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            house.name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          IconButton(
                            icon: Icon(
                              favorit.contains(house)
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                              size: 28,
                            ),
                            onPressed: () {
                              setState(() {
                                if (favorit.contains(house)) {
                                  favorit.remove(house);
                                } else {
                                  favorit.add(house);
                                }
                              });
                            },
                          ),
                        ],
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
    );
  }}

