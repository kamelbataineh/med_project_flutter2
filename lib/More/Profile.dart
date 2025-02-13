import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(
                    'https://via.placeholder.com/150',
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Name",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Name@example.com",
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(height: 30),
                ListTile(
                  leading: Icon(Icons.phone, color: Colors.blue[900]),
                  title: const Text("Phone Number"),
                  subtitle: const Text("+962 00 456 7890"),
                ),
                ListTile(
                  leading: Icon(Icons.location_on, color: Colors.blue[900]),
                  title: const Text("Address"),
                  subtitle: const Text("Jordan"),
                ),
                ListTile(
                  leading: Icon(Icons.person, color: Colors.blue[900]),
                  title: const Text("Username"),
                  subtitle: const Text("name"),
                ),
                const SizedBox(height: 40),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
