import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:med_project_flutter2/Housing_Details_Page.dart';

import '../Class_Favorites.dart';

class FavoritesPage extends StatefulWidget {
  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<DocumentSnapshot> housings = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Favorite",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: itemfavorit.favorit.isNotEmpty
                ? ListView.builder(
                itemCount: itemfavorit.favorit.length,
                itemBuilder: (context, index) {
                  final favorite = itemfavorit.favorit[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HousingDetailsPage(favorite),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              favorite.image,
                              width: 100,
                              height: 70,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(Icons.image_not_supported, size: 50);
                              },
                            ),
                          ),
                          SizedBox(width: 10),
                          Text(
                            favorite.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                itemfavorit.favorit.removeAt(index);
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                })
                : Center(
              child: Text(
                "There are no items in favorites.",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'Class_Favorites.dart';
//
// class FavoritesPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("المفضلة"),
//         backgroundColor: Colors.blue,
//       ),
//       body: itemfavorit.favorit.isNotEmpty
//           ? ListView.builder(
//         itemCount: itemfavorit.favorit.length,
//         itemBuilder: (context, index) {
//           return Container(
//             margin: EdgeInsets.all(10),
//             padding: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white,
//               boxShadow: [
//                 BoxShadow(
//                   color: Colors.grey.withOpacity(0.2),
//                   spreadRadius: 3,
//                   blurRadius: 5,
//                   offset: Offset(0, 3), // Shadow position
//                 ),
//               ],
//             ),
//             child: Row(
//               children: [
//                 Image.network(
//                   itemfavorit.favorit[index].image,
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.cover,
//                 ),
//                 SizedBox(width: 10),
//                 Text(
//                   itemfavorit.favorit[index].name,
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Spacer(),
//                 IconButton(
//                   icon: Icon(Icons.delete),
//                   onPressed: () {
//                     // قم بإضافة منطق الحذف هنا
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       )
//           : Center(
//         child: Text(
//           "لا توجد عناصر في المفضلة",
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Colors.black,
//           ),
//         ),
//       ),
//     );
//   }
// }
