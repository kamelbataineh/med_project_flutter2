import 'package:flutter/material.dart';
import '../Class_Favorites.dart';
import '../Housing_Details_Page.dart';

class U_Maan extends StatefulWidget {
  const U_Maan({super.key});

  @override
  _U_MaanState createState() => _U_MaanState();
}

class _U_MaanState extends State<U_Maan> {
  List<AddHous> randomHousings = [
    AddHous(1400.0, 'House 5', 'https://i.pinimg.com/236x/7f/6f/0a/7f6f0a8668aa2da61d9025859406e2f1.jpg', '123-456-7894', 'City 5', 'https://www.google.com/maps/place/City5', 'Type 5', 5),
    AddHous(1500.0, 'House 6', 'https://i.pinimg.com/236x/47/cb/d8/47cbd8a4788a99f1b762c2c2098e5ad4.jpg', '123-456-7895', 'City 6', 'https://www.google.com/maps/place/City6', 'Type 6', 6),
    AddHous(1600.0, 'House 7', 'https://i.pinimg.com/236x/56/cc/f0/56ccf056ed9db9c5c4b0be5edb69b7bd.jpg', '123-456-7896', 'City 7', 'https://www.google.com/maps/place/City7', 'Type 7', 7),
    AddHous(1100.0, 'House 2', 'https://i.pinimg.com/236x/3b/4a/b3/3b4ab3a6f53616bc80882372503c2122.jpg', '123-456-7891', 'City 2', 'https://www.google.com/maps/place/City2', 'Type 2', 2),
    AddHous(1200.0, 'House 3', 'https://i.pinimg.com/236x/5a/96/07/5a960747b6fa3fb1ebc970c7b56e4c51.jpg', '123-456-7892', 'City 3', 'https://www.google.com/maps/place/City3', 'Type 3', 3),
    AddHous(1300.0, 'House 4', 'https://i.pinimg.com/236x/7f/6f/0a/7f6f0a8668aa2da61d9025859406e2f1.jpg', '123-456-7893', 'City 4', 'https://www.google.com/maps/place/City4', 'Type 4', 4),
    AddHous(1700.0, 'House 8', 'https://i.pinimg.com/236x/f5/4b/bc/f54bbc3f479cfe3cad0cc629f72d4b61.jpg', '123-456-7897', 'City 8', 'https://www.google.com/maps/place/City8', 'Type 8', 8),
    AddHous(1800.0, 'House 9', 'https://i.pinimg.com/236x/37/82/38/3782382b3ee3014fd70eb076e4779d78.jpg', '123-456-7898', 'City 9', 'https://www.google.com/maps/place/City9', 'Type 9', 9),
  ];
  List<AddHous> favorit = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
      body: Maan(),
    );
  }

  Widget Maan() {
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
                    borderRadius:
                    BorderRadius.vertical(top: Radius.circular(10)),
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
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  bool flag = itemfavorit.favorit.any(
                                          (flagHouse) =>
                                      flagHouse.name == house.name &&
                                          flagHouse.image == house.images);

                                  if (flag) {
                                    itemfavorit.favorit.removeWhere(
                                            (flagHouse) =>
                                        flagHouse.name == house.name &&
                                            flagHouse.image == house.images);
                                  } else {
                                    itemfavorit.favorit.add(
                                        PagesCitis(house.name, house.images));
                                  }
                                });
                              },
                              child: Icon(
                                itemfavorit.favorit.any((flagHouse) =>
                                flagHouse.name == house.name &&
                                    flagHouse.image == house.images)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: itemfavorit.favorit.any((flagHouse) =>
                                flagHouse.name == house.name &&
                                    flagHouse.image == house.images)
                                    ? Colors.red
                                    : Colors.grey,
                                size: 28,
                              ),
                            ),
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

