import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:med_project_flutter2/Class_Favorites.dart';
import 'package:med_project_flutter2/Screen_favorite.dart';
import 'package:med_project_flutter2/Screen_setting.dart';
import 'package:med_project_flutter2/consr_routes.dart';
import 'package:med_project_flutter2/free.dart';
import 'package:med_project_flutter2/userORrented.dart';

class ScreenCitiesUser extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeState();
  }
}

class _HomeState extends State<ScreenCitiesUser> {
  bool isicon = false;
  @override
  List<Widget> pages = [
    Free(),
    FavoritesPage(),
  ];
  int indexpage = 0;

  final List<PagesCitis> cities = [
    PagesCitis(
      'اربد',
      'https://i.pinimg.com/564x/e0/5a/34/e05a3477a58ac454e827aac2ab2ec03c.jpg',
    ),
    PagesCitis(
      'جرش',
      'https://i.pinimg.com/474x/00/e1/f4/00e1f45e889bb474e710a4533c50d544.jpg',
    ),
    PagesCitis(
      'عجلون',
      'https://i.pinimg.com/564x/d4/da/1f/d4da1f8c3742f9501681a9e607a29920.jpg',
    ),
    PagesCitis(
      'المفرق',
      'https://i.pinimg.com/736x/8d/41/ea/8d41ea639119ca1dc2628b76fde9ca8b.jpg',
    ),
    PagesCitis(
      'عمان',
      'https://i.pinimg.com/564x/03/b4/ff/03b4ffbe9860921a696898d41fe25091.jpg',
    ),
    PagesCitis(
      'مادبا',
      'https://i.pinimg.com/564x/d2/f6/28/d2f628a0612545a60f4781974674149a.jpg',
    ),
    PagesCitis(
      'البلقاء',
      'https://i.pinimg.com/236x/71/70/69/717069eb2e3f4d752808749870c1464f.jpg',
    ),
    PagesCitis(
      'الكرك',
      'https://i.pinimg.com/564x/13/58/cf/1358cf4a6077d0f67d13ece19f148eb7.jpg',
    ),
    PagesCitis(
      'الطفيلة',
      'https://i.pinimg.com/736x/48/13/49/4813497936c9154ff6060fb2ef5c0db8.jpg',
    ),
    PagesCitis(
      'معان',
      'https://i.pinimg.com/564x/b9/e4/25/b9e425b64550bb7e3b45a272d7de6f74.jpg',
    ),
    PagesCitis(
      'العقبة',
      'https://i.pinimg.com/564x/9f/d6/83/9fd683479f339e1f9d2a6a62958c379a.jpg',
    ),
  ];

  List<String> list = ["تسجيل دخول", "حساب جديد", "تسجيل خروج"];
  String? select;
  Color color = Colors.white38;
  List<String> appBarTitles = ["مدن", "المفضلة"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.center,
          child: Text(appBarTitles[indexpage]),
        ),
        backgroundColor: Color(0xFF15b9b4),
        //   actions: [
        //     PopupMenuButton(
        //         icon: Icon(
        //           Icons.density_medium,
        //           size: 25,
        //           color: Colors.black,
        //         ),
        //         itemBuilder: (context) {
        //           return list.map((element) {
        //             return PopupMenuItem(
        //               value: element,
        //               child: Row(
        //                 children: [
        //                   Icon(
        //                     element == "تسجيل دخول"
        //                         ? Icons.person
        //                         : element == "حساب جديد"
        //                         ? Icons.person_add
        //                         : Icons.logout,
        //                     color: Colors.black54,
        //                     size: 25,
        //                   ),
        //                   SizedBox(width: 30),
        //                   Text(
        //                     element,
        //                     style:
        //                     TextStyle(fontSize: 20, color: Colors.black87),
        //                   ),
        //                 ],
        //               ),
        //             );
        //           }).toList();
        //         },
        //         color: Colors.white,
        //         onCanceled: () {
        //           print("object");
        //         },
        //         onSelected: (value) {
        //           setState(() {
        //             select = value;
        //             switch (select) {
        //               case "تسجيل دخول":
        //                 Navigator.of(context).pushNamed(route_Userorrented);
        //
        //                 break;
        //               case "حساب جديد":
        //                 Navigator.of(context)
        //                     .pushNamed(route_ScreenRegisterUser);
        //
        //                 break;
        //               case "تسجيل خروج":
        //                 Navigator.of(context).pushNamed(route_Userorrented);
        //                 break;
        //               default:
        //                 Navigator.of(context).pushNamed(route_ScreenCitiesUser);
        //             }
        //           });
        //         })
        //  - ],
      ),
      body: indexpage == 0
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        child: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: CircleBorder(),
                          padding: EdgeInsets.all(16),
                          backgroundColor: Color(0xFF15b9b4),
                        ),
                      ),
                      SizedBox(width: 8),
                      Expanded(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                blurRadius: 6.0,
                                spreadRadius: 0.5,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextField(
                            onChanged: null,
                            decoration: InputDecoration(
                              hintText: "ابحث هنا...",
                              hintStyle:
                                  TextStyle(color: Colors.black, fontSize: 16),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.all(12),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
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
                ),
              ],
            )
          : IndexedStack(
              index: indexpage,
              children: pages,
            ),
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
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
              builder: (context) =>ScreenSetting(),
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
                          Navigator.of(context).pop();
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
}
