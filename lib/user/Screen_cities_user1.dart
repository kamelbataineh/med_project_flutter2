import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:med_project_flutter2/Class_Favorites.dart';
import 'package:med_project_flutter2/Screen_favorite.dart';
import 'package:med_project_flutter2/Screen_setting.dart';
import 'package:med_project_flutter2/consr_routes.dart';
import 'package:med_project_flutter2/free.dart';
import 'package:med_project_flutter2/userORrented.dart';

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
import 'Screen_cities_user.dart';

class ScreenCitiesUser1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<ScreenCitiesUser1> {
  bool isicon = false;
  @override
  List<Widget> pages = [
    Free(),
    FavoritesPage(),
  ];
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
      // appBar: AppBar(
      //   title: Center(
      //     child: Text(appBarTitles[indexpage]),
      //   ),
      //   leading: IconButton(
      //     icon: Icon(Icons.search),
      //     onPressed: () {},
      //   ),
      // bottom: indexpage == 0
      //     ? // PreferredSize(
      //     preferredSize: Size(0, 100),
      //     child: SingleChildScrollView(
      //       scrollDirection: Axis.horizontal,
      //       child: Row(children: [
      //         SizedBox(
      //           width: 20,
      //         ),
      //         floatAction("FLIGHTS", Icon(Icons.flight),
      //             Colors.deepOrange[100]!, Colors.deepOrange[400]!),
      //         SizedBox(
      //           width: 10,
      //         ),
      //         floatAction("FOODS", Icon(Icons.fastfood_rounded),
      //             Colors.orange[100]!, Colors.orange),
      //         SizedBox(
      //           width: 10,
      //         ),
      //         floatAction("EVENTS", Icon(Icons.event_note),
      //             Colors.purple[100]!, Colors.pink),
      //         SizedBox(
      //           width: 10,
      //         ),
      //       ]),
      //     ))
      // : null,
      // backgroundColor: Colors.white,
      // ),
      body: indexpage == 0
          ? ScrollNotificationObserver(
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {},
                child: Card(
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
                        child: Image.asset(
                          'imgs/p1.jpg',
                          width: double.infinity,
                          height: 100,
                          fit: BoxFit.fill,
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
                            "jkhki",
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,  // مهم للسماح للشبكة بالتمرير داخل الـ Column
                physics: NeverScrollableScrollPhysics(),  // منع التمرير داخل GridView
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                padding: EdgeInsets.all(5),
                itemCount: cities.length,
                itemBuilder: (context, index) {
                  return City(index);
                },
              ),
            ],
          ),
        ),
      )

      : IndexedStack(
        index: indexpage,
        children: pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        index: indexpage,
        onTap: (index) {
          setState(() {
            indexpage = index;
          });
        },
        items: [
          Icon(Icons.home, color: Colors.black),
          Icon(Icons.favorite, color: Colors.black),
        ],
        color: Color(0xFF15b9b4),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color(0xFF15b9b4),
        animationDuration: Duration(milliseconds: 300),
      ),
      ////////////////////////
      ////////////////////////
      ////////////////////////
      ////////////////////////
      endDrawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF15b9b4),
              ),
              child: Column(
                children: [
                  Image.network(
                    "https://cdn-icons-png.flaticon.com/128/3177/3177440.png",
                    width: 50,
                    fit: BoxFit.fill,
                  ),
                  Center(
                    child: Text(
                      'name: ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            FnListTile("ملف شخصي", Icon(Icons.person)),
            FnListTile("الإعدادات", Icon(Icons.settings)),
            FnListTile("دعم فني", Icon(Icons.support_agent_outlined)),
            FnListTile("تسجيل خروج", Icon(Icons.logout))
          ],
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
        switch (cities[index].name) {
          case 'Irbid':
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => U_irbed(),
            // ));
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
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => ScreenCitiesRented(),
            // ));
            break;
        }
      },
      child: Card(
        shadowColor: Color(0xFF15b9b4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        elevation: 5,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                cities[index].image,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
            ),
            Positioned(
              top: 8,
              right: 8,
              child: GestureDetector(
                onTap: () {
                  if (index >= 0 && index < cities.length) {
                    final city = cities[index];
                    setState(() {
                      if (itemfavorit.favorit.contains(city)) {
                        itemfavorit.favorit.remove(city);
                        print("Removed ${city.name} from favorites.");
                      } else {
                        itemfavorit.favorit.add(city);
                        print("Added ${city.name} to favorites.");
                      }
                    });
                  } else {
                    print("Invalid operation: Index $index is out of range.");
                  }
                },
                child: Icon(
                  itemfavorit.favorit.contains(cities[index])
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: Colors.red,
                  size: 28,
                ),
              ),
            ),
            Positioned(
              top: 8,
              left: 8,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Text(
                  cities[index].name,
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
            ),
          ],
        ),
      ),
    );
  }

  ////////////////////////
  ////////////////////////
  ////////////////////////
  ////////////////////////
  ////////////////////////

  Widget FnListTile(String title, Icon icon) {
    return ListTile(
        leading: icon,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.right,
        ),
        onTap: () {
          switch (title) {
            case "ملف شخصي":
            // Navigator.of(context).push(MaterialPageRoute(
            // builder: (context) => ProfilePage(),
            // ));
              break;

            case "الإعدادات":
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ScreenSetting(),
              ));
              break;

            case "دعم فني":
            // Navigator.of(context).push(MaterialPageRoute(
            // builder: (context) => SupportPage(),
            // ));
              break;

            case "تسجيل خروج":
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('تسجيل خروج'),
                    content: Text('هل تريد تسجيل الخروج؟'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('إلغاء'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Userorrented(),
                          ));
                        },
                        child: Text('خروج'),
                      ),
                    ],
                  );
                },
              );
              break;

            default:
              break;
          }
        });
  }

  Widget floatAction(String text, Icon icon, Color col, Color colIcon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
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
}
