import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:med_project_flutter2/Screen_favorite.dart';
import 'package:med_project_flutter2/Screen_setting.dart';
import 'package:med_project_flutter2/consr_routes.dart';
import 'package:med_project_flutter2/userORrented.dart';

class ScreenCitiesUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<ScreenCitiesUser> {
  List<Widget> pages = [

    ScreenSetting(),
    ScreenSetting(),
    ScreenFavorite()
  ];
  int indexpage =0;

  final List<Map<String, String>> cities = [
    {
      'name': 'اربد',
      'image':
      'https://i.pinimg.com/564x/e0/5a/34/e05a3477a58ac454e827aac2ab2ec03c.jpg',
    },
    {
      'name': 'جرش',
      'image':
      'https://i.pinimg.com/474x/00/e1/f4/00e1f45e889bb474e710a4533c50d544.jpg',
    },
    {
      'name': 'عجلون',
      'image':
      'https://i.pinimg.com/564x/d4/da/1f/d4da1f8c3742f9501681a9e607a29920.jpg',
    },
    {
      'name': 'المفرق',
      'image':
      'https://i.pinimg.com/736x/8d/41/ea/8d41ea639119ca1dc2628b76fde9ca8b.jpg',
    },
    {
      'name': 'عمان',
      'image':
      'https://i.pinimg.com/564x/03/b4/ff/03b4ffbe9860921a696898d41fe25091.jpg',
    },
    {
      'name': 'مادبا',
      'image':
      'https://i.pinimg.com/564x/d2/f6/28/d2f628a0612545a60f4781974674149a.jpg',
    },
    {
      'name': 'البلقاء',
      'image':
      'https://i.pinimg.com/236x/71/70/69/717069eb2e3f4d752808749870c1464f.jpg',
    },
    {
      'name': 'الكرك',
      'image':
      'https://i.pinimg.com/564x/13/58/cf/1358cf4a6077d0f67d13ece19f148eb7.jpg',
    },
    {
      'name': 'الطفيلة',
      'image':
      'https://i.pinimg.com/736x/48/13/49/4813497936c9154ff6060fb2ef5c0db8.jpg',
    },
    {
      'name': 'معان',
      'image':
      'https://i.pinimg.com/564x/b9/e4/25/b9e425b64550bb7e3b45a272d7de6f74.jpg',
    },
    {
      'name': 'العقبة',
      'image':
      'https://i.pinimg.com/564x/9f/d6/83/9fd683479f339e1f9d2a6a62958c379a.jpg',
    },
  ];
  List<String> list = ["تسجيل دخول", "حساب جديد", "تسجيل خروج"];
  String? select;
  Color color = Colors.white38;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text("المدن"),
        ),
        backgroundColor: Colors.blue,
        actions: [
          PopupMenuButton(
              icon: Icon(
                Icons.density_medium,
                size: 25,
                color: Colors.black,
              ),
              itemBuilder: (context) {
                return list.map((element) {
                  return PopupMenuItem(
                    value: element,
                    child: Row(
                      children: [
                        Icon(
                          element == "تسجيل دخول"
                              ? Icons.person
                              : element == "حساب جديد"
                              ? Icons.person_add
                              : Icons.logout,
                          color: Colors.black54,
                          size: 25,
                        ),
                        SizedBox(width: 30),
                        Text(
                          element,
                          style:
                          TextStyle(fontSize: 20, color: Colors.black87),
                        ),
                      ],
                    ),
                  );
                }).toList();
              },
              color: Colors.white,
              onCanceled: () {
                print("object");
              },
              onSelected: (value) {
                setState(() {
                  select = value;
                  switch (select) {
                    case "تسجيل دخول":
                      Navigator.of(context).pushNamed(route_Userorrented);

                      break;
                    case "حساب جديد":
                      Navigator.of(context)
                          .pushNamed(route_ScreenRegisterUser);

                      break;
                    case "تسجيل خروج":
                      Navigator.of(context).pushNamed(route_Userorrented);
                      break;
                    default:
                      Navigator.of(context).pushNamed(route_ScreenCitiesUser);
                  }
                });
              })
        ],
      ),
      body:
      Row(
        children: [
          IndexedStack(
            index: indexpage,
            children: pages,
          ),
          GridView.builder(
                  gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                  ),
                  padding: EdgeInsets.all(5),
                  physics: BouncingScrollPhysics(),
                  itemCount: cities.length,
                  itemBuilder: (context, index) {
                    return City(index);
                  },
                ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        index: indexpage,
        onTap: (index) {
          setState(() {
            indexpage = index;
          });
        },
        items: const [
          Icon(Icons.home, color: Colors.black),
          Icon(Icons.search, color: Colors.black),
          Icon(Icons.notifications, color: Colors.black),
          Icon(Icons.person, color: Colors.black),
        ],
        color: Colors.blue,
        backgroundColor: Colors.white,
        buttonBackgroundColor: Colors.blue,
        animationDuration:  Duration(milliseconds: 300),
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
          switch (cities[index]['name']) {
            case 'اربد':
              Navigator.of(context).pushNamed(route_irbed);
              break;
            case 'جرش':
              Navigator.of(context).pushNamed(route_jarash);
              break;
            case 'عجلون':
              Navigator.of(context).pushNamed(route_ajlon);
              break;
            case 'المفرق':
              Navigator.of(context).pushNamed(route_mafraq);
              break;
            case 'عمان':
              Navigator.of(context).pushNamed(route_amman);
              break;
            case 'مادبا':
              Navigator.of(context).pushNamed(route_maan);
              break;
            case 'البلقاء':
              Navigator.of(context).pushNamed(route_balqa);
              break;
            case 'الكرك':
              Navigator.of(context).pushNamed(route_karak);
              break;
            case 'الطفيلة':
              Navigator.of(context).pushNamed(route_tafileh);
              break;
            case 'معان':
              Navigator.of(context).pushNamed(route_maan);
              break;
            case 'العقبة':
              Navigator.of(context).pushNamed(route_aqaba);
              break;
            default:
              Navigator.of(context).pushNamed(route_ScreenCitiesUser);
              break;
          }
        },
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
                child: Image.network(
                  cities[index]['image']!,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
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
                    cities[index]['name']!,
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

        )

    );

  }}