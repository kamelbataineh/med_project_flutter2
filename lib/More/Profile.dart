import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../FireBase/Read_FireBase.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////
  CollectionReference users = FirebaseFirestore.instance.collection('Rented');

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////
  final credential = FirebaseAuth.instance.currentUser;

  ///////////////////////////////////////////////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////////

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.grey,
                    backgroundImage: NetworkImage(
                      'https://via.placeholder.com/150',
                    ),
                  ),
                  SizedBox(height: 20),
                  ReadFirebase(
                    documentId: credential!.uid,
                    fieldName: "BusinessName",
                    showEditButton: false,
                    location1: MainAxisAlignment.center,
                    location2: CrossAxisAlignment.center,
                    Edit: 'BusinessName',
                    showDeleteButton: false,
                  ),
                  ReadFirebase(
                    documentId: credential!.uid,
                    fieldName: "Email",
                    showEditButton: false,
                    Edit: 'Email',
                    showDeleteButton: false,
                  ),
                  SizedBox(height: 30),
                  ListTile(
                    leading: Icon(Icons.phone, color: Colors.blue[900]),
                    title: Text("Phone Number"),
                    subtitle: ReadFirebase(
                      documentId: credential!.uid,
                      fieldName: "Phone",
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      showEditButton: true,
                      Edit: 'Phone',
                      showDeleteButton: true,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.email, color: Colors.blue[900]),
                    title: Text("Email"),
                    subtitle: ReadFirebase(
                      documentId: credential!.uid,
                      fieldName: "Email",
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      showEditButton: true,
                      Edit: 'Email',
                      showDeleteButton: true,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.person, color: Colors.blue[900]),
                    title: Text("Username"),
                    subtitle: ReadFirebase(
                      documentId: credential!.uid,
                      fieldName: "BusinessName",
                      textStyle:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                      showEditButton: true,
                      Edit: 'BusinessName',
                      showDeleteButton: true,
                    ),
                  ),
                  SizedBox(height: 40),
                ]),
          ),
        ),
      ),
    );
  }
}
