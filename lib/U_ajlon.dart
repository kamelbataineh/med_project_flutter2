import 'package:flutter/material.dart';

class U_Ajlon extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<U_Ajlon> {
  final List<Map<String, String>> ajloun = [
    {'name': 'جامعة عجلون الوطنية', 'image': 'imgs/ANU.png'}
  ];

  String? select;
  Color color = Colors.white38;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('عجلون'),
          backgroundColor:  Color(0xFF15b9b4),
        ),
        backgroundColor: Colors.white,

        body: ListView.builder(
            itemCount: ajloun.length,
            itemBuilder: (context, index) {
              return City(index);
            }));
  }

//////////////////////////////////
/////////////////////////////////
////////////////////////////////
///////////////////////////////
//////////////////////////////

  Widget City(int index) {
    return GestureDetector(
        onTap: () {},
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Image.asset(
              ajloun[index]['image']!,
              width: double.infinity,
              height: 120,
              fit: BoxFit.fill,
              alignment: Alignment.topCenter,
            ),
            Container(
              padding: EdgeInsets.all(4),
              color: Colors.black54,
              child: Text(
                ajloun[index]['name']!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ));
  }
}
