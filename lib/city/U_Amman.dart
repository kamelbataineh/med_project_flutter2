import 'package:flutter/material.dart';

import 'package:med_project_flutter2/City_Housing.dart';
import 'package:med_project_flutter2/consr_routes.dart';

class U_Amman extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<U_Amman> {
  final List<Map<String, String>> amman = [
    {'name': 'جامعة الأردنية', 'image': 'imgs/JU.png'}
  ];

  String? select;
  Color color = Colors.white38;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('عمان'),
        backgroundColor:  Color(0xFF15b9b4),
      ),
      backgroundColor: Colors.white,

      body: Padding(
        padding: const EdgeInsets.all(4.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            mainAxisSpacing: 2.0,
            childAspectRatio: 4/1.5 ,
          ),
          padding: EdgeInsets.all(5),
          physics: BouncingScrollPhysics(),
          itemCount: amman.length,
          itemBuilder: (context, index) {
            return City(index);
          },
        ),
      ),
    );
  }

//////////////////////////////////
/////////////////////////////////
////////////////////////////////
///////////////////////////////
//////////////////////////////

  Widget City(int index) {
    return GestureDetector(
        onTap: () {
          print("objaect");
          switch (amman[index]['name']) {
          // case 'جامعة عجلون الوطنية':
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) =>
          //           CityHousing(universityName: 'جامعة عجلون الوطنية'),
          //     ),
          //   );
          //   break;
            default:
              Navigator.of(context).pushNamed(route_ScreenCitiesUser);
              break;
          }
        },
        child:Card(
          shadowColor: Colors.blue,
          shape: RoundedRectangleBorder(

            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 5,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(amman[index]['image']!,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.fill,
                  alignment: Alignment.center,
                ),
              ),
              Card(
                color: Colors.black54,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 2,
                child: Container(
                  padding: EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.black54, Colors.transparent],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Text(
                    amman[index]['name']!,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 5.0,
                          color: Colors.black.withOpacity(0.7),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ));  }
}
