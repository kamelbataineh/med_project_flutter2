import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReadFirebase extends StatefulWidget {
  final String documentId;
  final String fieldName;
  final TextStyle textStyle;
  final bool showEditButton;
  final bool showDeleteButton;
  final MainAxisAlignment location1;
  final CrossAxisAlignment location2;
  final dynamic Edit;

  ReadFirebase(
      {required this.documentId,
      required this.fieldName,
      this.textStyle =
          const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      required this.showEditButton,
      this.location1 = MainAxisAlignment.center,
      this.location2 = CrossAxisAlignment.center,
      required this.Edit, required this.showDeleteButton});

  @override
  State<ReadFirebase> createState() => _ReadFirebaseState();
}

class _ReadFirebaseState extends State<ReadFirebase> {
///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////

  /// creat sign up User
  /// creat sign up Rented
  ///

///////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////
  TextEditingController textEditingController = TextEditingController();
  final credential = FirebaseAuth.instance.currentUser;
  CollectionReference users = FirebaseFirestore.instance.collection('Rented');

  showEditDialog(data, mykey) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("$mykey"),
          content: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: data[mykey],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (textEditingController.text.isNotEmpty) {
                  users
                      .doc(credential!.uid)
                      .update({mykey: textEditingController.text});
                  setState(() {
                    Navigator.pop(context);
                  });
                }
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  /////////////////
  /////////////////
  /////////////////
  showDeleteDialog(String mykey) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Delete"),
          content: Text("Are you sure you want to delete this item?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                users.doc(credential!.uid).update({mykey: FieldValue.delete()});
                setState(() {
                  Navigator.pop(context);
                });
              },
              child: Text("Delete", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Rented');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          if (data.containsKey(widget.fieldName)) {
            return Row(
              children: [
                Text("${data[widget.fieldName]}", style: widget.textStyle),
                Spacer(),
                if (widget.showEditButton)
                  IconButton(
                    onPressed: () {
                      showEditDialog(data, widget.Edit);
                    },
                    icon: Icon(Icons.edit, size: 15),
                  ),
                if (widget.showDeleteButton)
                IconButton(
                  onPressed: () {
                    showDeleteDialog(widget.fieldName);
                  },
                  icon: Icon(Icons.delete, size: 15),
                ),
              ],
            );
          } else {
            return Text("Field does not exist");
          }
        }

        return Text("Loading...");
      },
    );
  }
}
