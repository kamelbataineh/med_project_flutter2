import 'package:flutter/material.dart';

class U_Jarash extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<U_Jarash> {
  final List<Map<String, String>> jerash = [
    {
      'name': 'جامعة جرش',
      'image':
          'https://josor.org/wp-content/uploads/2019/12/31-5-e1578996473750.jpg',
    },
  ];

  String? select;
  Color color = Colors.white38;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('جرش'),
          backgroundColor: Color(0xFF15b9b4),
        ),
        backgroundColor: Colors.white,

        body: ListView.builder(
            itemCount: jerash.length,
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
              jerash[index]['image']!,
              width: double.infinity,
              height: 120,
              fit: BoxFit.fill,
              alignment: Alignment.bottomCenter,
            ),
            Container(
              padding: EdgeInsets.all(4),
              color: Colors.black54,
              child: Text(
                jerash[index]['name']!,
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
