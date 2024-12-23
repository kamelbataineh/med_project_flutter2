import 'package:flutter/material.dart';
import 'Class_Favorites.dart';

class FavoritesPage extends StatefulWidget {

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: itemfavorit.favorit.isNotEmpty
                ? ListView.builder(
              itemCount: itemfavorit.favorit.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3,
                        blurRadius: 5,
                        offset: Offset(0, 3), // Shadow position
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        itemfavorit.favorit[index].image,
                        width: 50,
                        height: 50,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 10),
                      Text(
                        itemfavorit.favorit[index].name,
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
                );
              },
            )
                : Center(
              child: Text(
                "لا توجد عناصر في المفضلة",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
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
