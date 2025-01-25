import 'package:flutter/material.dart';
import 'package:med_project_flutter2/Profile.dart';
import 'package:med_project_flutter2/userORrented.dart';
import 'App_Appearance.dart';

class MorePage extends StatefulWidget {
  const MorePage({super.key});

  @override
  State<MorePage> createState() => _MorePageState();
}

class _MorePageState extends State<MorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Account",
                      style: TextStyle(color: Colors.grey[600])),
                ),
                Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                ),
                FnListTile("Profile", Icon(Icons.person)),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Setting",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ),
                Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                ),
                FnListTile("App Appearance", Icon(Icons.palette)),
                FnListTile("Language", Icon(Icons.language)),
                FnListTile("Currency", Icon(Icons.currency_exchange)),
                FnListTile("Notifications", Icon(Icons.notifications_outlined)),
                SizedBox(
                  height: 25,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Information",
                      style: TextStyle(color: Colors.grey[600])),
                ),
                Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                ),
                FnListTile(
                    "Technical support", Icon(Icons.support_agent_outlined)),
                FnListTile("log out", Icon(Icons.logout)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget FnListTile(String title, Icon icon) {
    return ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium,
          textAlign: TextAlign.left,
        ),
        leading: icon ,
        onTap: () {
          switch (title) {
            case "Profile":
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ));
              break;

            case "App Appearance":
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => AppAppearance(),
              ));
              break;

            case "دعم فني":
              // Navigator.of(context).push(MaterialPageRoute(
              // builder: (context) => SupportPage(),
              // ));
              break;

            case "log out":
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
} // ListTile(
//   leading: Icon(Icons.phone, color: Colors.blue[900]),
//   title:  Text("Phone Number"),
//   subtitle:  Text("+123 456 7890"),
// ),
// ListTile(
//   leading: Icon(Icons.location_on, color: Colors.blue[900]),
//   title:  Text("Address"),
//   subtitle:  Text("123 Main Street, City, Country"),
// ),
// ListTile(
//   leading: Icon(Icons.person, color: Colors.blue[900]),
//   title:  Text("Username"),
//   subtitle:  Text("john_doe"),
// ),
