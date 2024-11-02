import 'package:flutter/material.dart';

class U_Karak extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<U_Karak> {
  final List<Map<String, String>> karak = [
    {
      'name': 'جامعة مؤتة',
      'image': 'imgs/MU.png',
    },
  ];

  String? select;
  Color color = Colors.white38;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('الكرك'),
          backgroundColor: Colors.blue,
        ),
        backgroundColor: Colors.black,

        body: ListView.builder(
            itemCount: karak.length,
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
              karak[index]['image']!,
              width: double.infinity,
              height: 120,
              fit: BoxFit.fill,
              alignment: Alignment.bottomCenter,
            ),
            Container(
              padding: EdgeInsets.all(4),
              color: Colors.black54,
              child: Text(
                karak[index]['name']!,
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
