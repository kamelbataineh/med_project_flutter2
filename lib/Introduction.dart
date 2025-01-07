// import 'package:flutter/material.dart';
//
// class U_Zarqa extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _HomeState();
//   }
// }
//
// class _HomeState extends State<U_Zarqa> {
//   final List<Map<String, String>> zarqa = [
//     {
//       'name': 'الجامعة الهاشمية',
//       'image': 'imgs/HU.png',
//     },
//   ];
//
//   String? select;
//   Color color = Colors.white38;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('الزرقاء'),
//           backgroundColor: Color(0xFF15b9b4),
//         ),
//         backgroundColor: Colors.white,
//         body: ListView.builder(
//             itemCount: zarqa.length,
//             itemBuilder: (context, index) {
//               return City(index);
//             }));
//   }
//
// //////////////////////////////////
// /////////////////////////////////
// ////////////////////////////////
// ///////////////////////////////
// //////////////////////////////
//
//   Widget City(int index) {
//     return GestureDetector(
//         onTap: () {},
//         child: Stack(
//           alignment: Alignment.topRight,
//           children: [
//             Image.asset(
//               zarqa[index]['image']!,
//               width: double.infinity,
//               height: 120,
//               fit: BoxFit.fill,
//               alignment: Alignment.bottomCenter,
//             ),
//             Container(
//               padding: EdgeInsets.all(4),
//               color: Colors.black54,
//               child: Text(
//                 zarqa[index]['name']!,
//                 style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 20,
//                 ),
//               ),
//             ),
//           ],
//         ));
//   }
// }
