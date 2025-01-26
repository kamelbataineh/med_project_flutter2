import 'package:flutter/material.dart';
import 'package:med_project_flutter2/Class_Favorites.dart';
import 'package:med_project_flutter2/More.dart';
import 'package:med_project_flutter2/Screen_favorite.dart';
import 'package:med_project_flutter2/Student_Dormitories.dart';
import 'package:med_project_flutter2/free.dart';
import '../city/U.irbed.dart';
import '../city/U_Amman.dart';
import '../city/U_Aqaba.dart';
import '../city/U_Balqa.dart';
import '../city/U_Maan.dart';
import '../city/U_Tafileh.dart';
import '../city/U_ajlon.dart';
import '../city/U_jarash.dart';
import '../city/U_karak.dart';
import '../city/U_mafraq.dart';
import '../rented/Screen_cities_rented.dart';

class ScreenCitiesUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<ScreenCitiesUser> {
  bool isicon = false;
  @override
  List<Widget> pages = [Free(), FavoritesPage(), MorePage()];
  int indexpage = 0;

  final List<PagesCitis> cities = [
    PagesCitis(
      'Irbid',
      'https://i.pinimg.com/564x/e0/5a/34/e05a3477a58ac454e827aac2ab2ec03c.jpg',
    ),
    PagesCitis(
      'Jarash',
      'https://i.pinimg.com/474x/00/e1/f4/00e1f45e889bb474e710a4533c50d544.jpg',
    ),
    PagesCitis(
      'Ajlon',
      'https://i.pinimg.com/564x/d4/da/1f/d4da1f8c3742f9501681a9e607a29920.jpg',
    ),
    PagesCitis(
      'Mafraq',
      'https://i.pinimg.com/736x/8d/41/ea/8d41ea639119ca1dc2628b76fde9ca8b.jpg',
    ),
    PagesCitis(
      'Amman',
      'https://i.pinimg.com/564x/03/b4/ff/03b4ffbe9860921a696898d41fe25091.jpg',
    ),
    PagesCitis(
      'Mdapa',
      'https://i.pinimg.com/564x/d2/f6/28/d2f628a0612545a60f4781974674149a.jpg',
    ),
    PagesCitis(
      'Balqa',
      'https://i.pinimg.com/236x/71/70/69/717069eb2e3f4d752808749870c1464f.jpg',
    ),
    PagesCitis(
      'Karak',
      'https://i.pinimg.com/564x/13/58/cf/1358cf4a6077d0f67d13ece19f148eb7.jpg',
    ),
    PagesCitis(
      'Tafileh',
      'https://i.pinimg.com/736x/48/13/49/4813497936c9154ff6060fb2ef5c0db8.jpg',
    ),
    PagesCitis(
      'Maan',
      'https://i.pinimg.com/564x/b9/e4/25/b9e425b64550bb7e3b45a272d7de6f74.jpg',
    ),
    PagesCitis(
      'Aqaba',
      'https://i.pinimg.com/564x/9f/d6/83/9fd683479f339e1f9d2a6a62958c379a.jpg',
    ),
  ];

  List<String> list = ["تسجيل دخول", "حساب جديد", "تسجيل خروج"];
  String? select;
  Color color = Colors.white38;
  List<String> appBarTitles = ["City", "favorite"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: indexpage == 0
          ? SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => StudentDormitories(),
                          ));
                        },
                        child: Card(
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  'imgs/p5.jpg',
                                  width: double.infinity,
                                  height: 90,
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  " Student dormitories ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(30.0),
                              // ),
                              elevation: 5,
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'imgs/p2.jpg',
                                      width: 100,
                                      height: 120,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Flights",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(30.0),
                              // ),
                              // elevation: 5,
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'imgs/p6.jpg',
                                      width: 100,
                                      height: 120,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Explore",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Card(
                              // shape: RoundedRectangleBorder(
                              //   borderRadius: BorderRadius.circular(30.0),
                              // ),
                              // elevation: 5,
                              child: Stack(
                                alignment: Alignment.topRight,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                      'imgs/p4.jpg',
                                      width: 100,
                                      height:120,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Hotels",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),

                    ////////////////////////////////////////////////
                    ////////////////////////////////////////////////
                    ////////////////////////////////////////////////
                    ////////////////////////////////////////////////
                    ////////////////////////////////////////////////
                    PreferredSize(
                        preferredSize: Size(10, 100),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(children: [
                            SizedBox(
                              width: 20,
                            ),
                            floatAction(
                                "FLIGHTS",
                                Icon(
                                  Icons.flight,
                                ),
                                Colors.blue[900]!,
                                Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            floatAction(
                                "FLIGHTS",
                                Icon(
                                  Icons.flight,
                                ),
                                Colors.blue[900]!,
                                Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            floatAction(
                                "FLIGHTS",
                                Icon(
                                  Icons.flight,
                                ),
                                Colors.blue[900]!,
                                Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            floatAction("FOODS", Icon(Icons.access_alarm),
                                Colors.blue[900]!, Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            floatAction("FOODS", Icon(Icons.access_alarm),
                                Colors.blue[900]!, Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            floatAction("FOODS", Icon(Icons.access_alarm),
                                Colors.blue[900]!, Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            floatAction("EVENTS", Icon(Icons.event_note),
                                Colors.blue[900]!, Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            floatAction("EVENTS", Icon(Icons.event_note),
                                Colors.blue[900]!, Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                            floatAction("EVENTS", Icon(Icons.event_note),
                                Colors.blue[900]!, Colors.white),
                            SizedBox(
                              width: 10,
                            ),
                          ]),
                        )),
                    SizedBox(
                      height: 100,
                    ),
                    Divider(
                      color: Colors.grey[400],
                      thickness: 1,
                      indent: 1,
                      endIndent: 1,
                    ),
                    ////////////////////////////////////////////////
                    ////////////////////////////////////////////////
                    ////////////////////////////////////////////////
                    ////////////////////////////////////////////////
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "  Explore more places in Jordan",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                    SizedBox(
                      height: 10,
                    ),
                    buildCityList(),
                    SizedBox(
                      height: 50,
                    ),
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                    /////////////////////////////////////////////
                  ],
                ),
              ),
            )
          : IndexedStack(
              index: indexpage,
              children: pages,
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'More',
          ),
        ],
        backgroundColor: Colors.white,
        currentIndex: indexpage,
        selectedItemColor: Colors.blue[900],
        unselectedItemColor: Colors.grey,
         onTap: (index) {
            setState(() {
              indexpage = index;
            });
        },
      ),

    );
  }

//////////////////////////////////
/////////////////////////////////
////////////////////////////////
///////////////////////////////
//////////////////////////////
  Widget buildCityList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: cities.map((city) {
          return GestureDetector(
            onTap: () {
              switch (city.name) {
                case 'Irbid':
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => ScreenCitiesUser1()),
                  // );
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => U_irbed(),
                  ));
                  break;
                case 'Jarash':
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => U_Jarash(),
                  ));
                  break;
                case 'Ajloun':
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => U_Ajlon(),
                  ));
                  break;
                case 'Mafraq':
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => U_mafraq(),
                  ));
                  break;
                case 'Amman':
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => U_Amman(),
                  ));
                  break;
                case 'Madaba':
                  // Navigator.of(context).push(MaterialPageRoute(
                  //   builder: (context) => U_Mdaba(),
                  // ));
                  break;
                case 'Balqa':
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => U_Balqa(),
                  ));
                  break;
                case 'Karak':
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => U_Karak(),
                  ));
                  break;
                case 'Tafileh':
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => U_Tafileh(),
                  ));
                  break;
                case 'Maan':
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => U_Maan(),
                  ));
                  break;
                case 'Aqaba':
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => U_Aqaba(),
                  ));
                  break;
                default:
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenCitiesRented(),
                  ));
                  break;
              }
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Column(
                  children: [
                    Image.network(
                      city.image,
                      width: 200,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            city.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            
                          ),
                        ),
                        Icon(Icons.location_on_sharp)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
  ////////////////////////
  ////////////////////////
  ////////////////////////
  ////////////////////////
  ////////////////////////



  Widget floatAction(String text, Icon icon, Color col, Color colIcon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: FloatingActionButton(
            onPressed: () {
              switch (text) {
                case "FLIGHTS":
                  break;
                case "FOODS":
                  break;
                case "EVENTS":
                  break;
                default:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ScreenCitiesUser()),
                  );
                  break;
              }
            },
            backgroundColor: col,
            foregroundColor: colIcon,
            child: icon,
          ),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 14, color: Colors.black),
        ),
        SizedBox(height: 6),
      ],
    );
  }

  Widget FristIcon(String title, IconData icon, Color color) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 25, color: color),
          onPressed: () {},
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
