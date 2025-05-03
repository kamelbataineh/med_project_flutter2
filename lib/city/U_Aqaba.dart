import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:med_project_flutter2/Add_housing/AddHousing.dart';

import '../Class_Favorites.dart';
import '../Housing_Details_Page.dart';

class U_Aqaba extends StatefulWidget {
  const U_Aqaba({super.key});

  @override
  _U_AqabaState createState() => _U_AqabaState();
}

class _U_AqabaState extends State<U_Aqaba> {
  List<AddHous> favorit = [];



  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<DocumentSnapshot> housings = [];
  bool isLoading = true;

  Future<void> getHousing() async {
    try {
      QuerySnapshot querySnapshot = await firebaseFirestore
          .collection('AddHousing')
          .where('governorate', isEqualTo: 'Aqaba')
          .get();

      setState(() {
        housings = querySnapshot.docs;
        isLoading = false;
      });
    } catch (e) {
      print("Error fetching housing data: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getHousing();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
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
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.75,
        ),
        padding: EdgeInsets.all(10),
        physics: BouncingScrollPhysics(),
        itemCount: housings.length,
        itemBuilder: (context, index) {
          final house = housings[index].data() as Map<String, dynamic>;
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HousingDetailsPage(house),
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
                        house['images']?.isNotEmpty ?? false
                            ? house['images'][0]
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
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              house['housingName'] ?? 'Unknown',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          '${house['governorate']} \n${house['residentType']} \$${house['price']['monthly']}',
                          // '${house['governorate']} - ${house['residentType']} \$${house['price']}',
                          style: TextStyle(
                              color: Colors.grey[600], fontSize: 14),
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
