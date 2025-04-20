import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'Class_Favorites.dart';

class HousingDetailsPage extends StatefulWidget {
  final housing;

  HousingDetailsPage( this.housing);

  @override
  State<HousingDetailsPage> createState() => _HousingDetailsPageState();
}

class _HousingDetailsPageState extends State<HousingDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Housing Details'),

        ),
        body: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.housing['housingName'] ?? 'No name',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.green[800],
                        ),
                      ),
                      Divider(height: 20, thickness: 1.2),
                      _buildInfoRow(" Resident Type", widget.housing['residentType']),
                      _buildInfoRow(" Governorate", widget.housing['governorate']),
                      _buildInfoRow(" Region", widget.housing['region']),
                      _buildInfoRow(" Phone", widget.housing['phoneNumber']),
                      _buildInfoRow(" Address", widget.housing['address']),
                      SizedBox(height: 10),
                      Text(
                        'Prices:',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.blueGrey[800]),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '• Daily: \$${widget.housing['price']['daily'] ?? 'No price'}',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        '• Weekly: \$${widget.housing['price']['weekly'] ?? 'No price'}',
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        '• Monthly: \$${widget.housing['price']['monthly'] ?? 'No price'}',
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 20),
                      if (widget.housing['images'] != null &&
                          widget.housing['images'].isNotEmpty)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Images:',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blueGrey[800]),
                            ),
                            SizedBox(height: 10),
                            Column(
                              children:
                                  widget.housing['images'].map<Widget>((imageUrl) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      imageUrl,
                                      height: 200,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              bool flag = itemfavorit.favorit.any(
                                      (flagHouse) =>
                                  flagHouse.name == widget.housing['housingName'] &&
                                      flagHouse.image == widget.housing['images']);

                              if (flag) {
                                itemfavorit.favorit.removeWhere(
                                        (flagHouse) =>
                                    flagHouse.name == widget.housing['housingName'] &&
                                        flagHouse.image == widget.housing['images']);
                              } else {
                                itemfavorit.favorit.add(
                                    PagesCitis(widget.housing['housingName'], widget.housing['images']));
                              }
                            });
                          },
                          child: Icon(
                            itemfavorit.favorit.any((flagHouse) =>
                            flagHouse.name ==widget.housing['housingName'] &&
                                flagHouse.image == widget.housing['images'])
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: itemfavorit.favorit.any((flagHouse) =>
                            flagHouse.name == widget.housing['housingName']&&
                                flagHouse.image == widget.housing['images'])
                                ? Colors.red
                                : Colors.grey,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(5, (index) {
                      return Icon(
                        index < 4 ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 24,
                      );
                    }),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    double selectedRating = 4.0;
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        title: Text(
                          'Rate This Housing',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        contentPadding: EdgeInsets.all(16),
                        content: StatefulBuilder(
                          builder: (context, setState) {
                            return SizedBox(
                              width: MediaQuery.of(context).size.width *
                                  0.8,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: List.generate(5, (index) {
                                        return IconButton(
                                          padding: EdgeInsets.zero,
                                          constraints: BoxConstraints(),
                                          icon: Icon(
                                            index < selectedRating
                                                ? Icons.star
                                                : Icons.star_border,
                                            color: Colors.amber,
                                            size: 25,
                                          ),
                                          onPressed: () {
                                            setState(() {
                                              selectedRating = index + 1.0;
                                            });
                                          },
                                        );
                                      }),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "Your Rating: ${selectedRating.toInt()}",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        actions: [
                          TextButton(
                            child: Text("Cancel"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green),
                            child: Text("Submit"),
                            onPressed: () {
                              print('Rated: $selectedRating stars');
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                  child: Text(
                    'Rate',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }

  Widget _buildInfoRow(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(
        '$label: ${value ?? "Not available"}',
        style: TextStyle(fontSize: 15),
      ),
    );
  }
}
