import 'package:flutter/material.dart';

import 'Class_Favorites.dart';

class HousingDetailsPage extends StatelessWidget {
  final AddHous housing;

  HousingDetailsPage({required this.housing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'تفاصيل السكن',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF15b9b4),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: housing.images.isNotEmpty
                    ? Image.network(
                  housing.images,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
                    : Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.home,
                    size: 100,
                    color: Colors.grey[700],
                  ),
                ),
              ),
              SizedBox(height: 16),

              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      _buildDetailRow(Icons.home, 'Housing Type:', housing.typename),
                      SizedBox(height: 8),
                      _buildDetailRow(Icons.meeting_room, 'Number of Rooms:', housing.rooms.toString()),
                      SizedBox(height: 8),
                      _buildDetailRow(Icons.location_city, 'Location:', housing.cityname),
                      SizedBox(height: 8),
                      _buildDetailRow(Icons.attach_money, 'Price:', '\$${housing.price} / month'),
                      SizedBox(height: 8),
                      _buildDetailRow(Icons.phone, 'Phone:', housing.phone),
                      SizedBox(height: 8),
                      _buildDetailRow(Icons.map, 'Map Link:', housing.map),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: Colors.green),
        SizedBox(width: 10),
        Expanded(
          child: Text(
            '$label $value',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
      ],
    );
  }
}
