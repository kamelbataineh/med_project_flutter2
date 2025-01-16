import 'package:flutter/material.dart';
import '../Class_Favorites.dart';
import '../Housing_Details_Page.dart';

class U_Tafileh extends StatefulWidget {
  const U_Tafileh({super.key});

  @override
  _U_TafilehState createState() => _U_TafilehState();
}

class _U_TafilehState extends State<U_Tafileh> {
  List<AddHous> randomHousings = [
    AddHous(1400.0, 'House 5', 'https://i.pinimg.com/236x/7f/6f/0a/7f6f0a8668aa2da61d9025859406e2f1.jpg', '123-456-7894', 'City 5', 'https://www.google.com/maps/place/City5', 'Type 5', 5),
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
      body: Tafileh(),
    );
  }

  Widget Tafileh() {
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
                                if (index >= 0 &&
                                    index < randomHousings.length) {
                                  final house = randomHousings[index];
                                  setState(() {
                                    if (itemfavorit.favorit.contains(house)) {
                                      itemfavorit.favorit.remove(house);
                                    } else {
                                      itemfavorit.favorit.add(PagesCitis(
                                          house.name, house.cityname));

                                    }
                                  });
                                } else {

                                }
                              },
                              child: Icon(
                                itemfavorit.favorit.contains(house)
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: itemfavorit.favorit.contains(house)
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

