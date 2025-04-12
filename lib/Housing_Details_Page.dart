import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class HousingDetailsPage extends StatelessWidget {
  final  housing;

  HousingDetailsPage(this.housing);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Housing Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Housing Name: ${housing['housingName'] ?? 'No name'}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Resident Type: ${housing['residentType'] ?? 'No type'}'),
            Text('Governorate: ${housing['governorate'] ?? 'No governorate'}'),
            Text('Region: ${housing['region'] ?? 'No region'}'),
            Text('Phone: ${housing['phoneNumber'] ?? 'No phone'}'),
            Text('Address: ${housing['address'] ?? 'No address'}'),
            Text('Price: ${housing['price'] ?? 'No price'}'),
            SizedBox(height: 20),
            if (housing['images'] != null && housing['images'].isNotEmpty)
              Column(
                children: housing['images'].map<Widget>((imageUrl) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(imageUrl),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
