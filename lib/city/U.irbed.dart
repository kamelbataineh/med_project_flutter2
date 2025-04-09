import 'package:flutter/material.dart';
import 'package:med_project_flutter2/Card_Housing.dart';
import '../Class_Favorites.dart';
import '../Housing_Details_Page.dart';

class U_irbed extends StatefulWidget {
  const U_irbed({super.key});

  @override
  _U_irbedState createState() => _U_irbedState();
}

class _U_irbedState extends State<U_irbed> {

  List<AddHous> randomHousings = [

  ];

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
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: irbed(),
    );
  }

  Widget irbed() {
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
                            child:
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  bool flag = itemfavorit.favorit.any((
                                      flagHouse) =>
                                  flagHouse.name == house.name &&
                                      flagHouse.image == house.images);

                                  if (flag) {
                                    itemfavorit.favorit.removeWhere((
                                        flagHouse) =>
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
                        '${house.cityname} - ${house.typename} \$${house
                            .price}',
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