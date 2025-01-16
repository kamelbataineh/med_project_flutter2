import 'package:flutter/material.dart';
import '../Class_Favorites.dart';
import '../Housing_Details_Page.dart';

class U_Ajlon extends StatefulWidget {
  const U_Ajlon({super.key});

  @override
  _U_AjlonState createState() => _U_AjlonState();
}

class _U_AjlonState extends State<U_Ajlon> {
  List<AddHous> randomHousings = [
    AddHous(
        1000.0,
        'House 1',
        'https://i.pinimg.com/236x/3e/08/45/3e084507fe82c5fd9098f5eb1cce758e.jpg',
        '123-456-7890',
        'City 1',
        'https://www.google.com/maps/place/City1',
        'Type 1',
        1),
    AddHous(
        1100.0,
        'House 2',
        'https://i.pinimg.com/236x/3b/4a/b3/3b4ab3a6f53616bc80882372503c2122.jpg',
        '123-456-7891',
        'City 2',
        'https://www.google.com/maps/place/City2',
        'Type 2',
        2),
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
      body: Ajlon(),
    );
  }
  Widget Ajlon() {
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
  }


}