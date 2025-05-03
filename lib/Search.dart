import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:searchable_listview/searchable_listview.dart';

import 'Housing_Details_Page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Future<List<HousingItem>> fetchHousings() async {
    final snapshot =
    await FirebaseFirestore.instance.collection('AddHousing').get();
    return snapshot.docs.map((doc) {
      final data = doc.data() as Map<String, dynamic>;
      final image = (data['images'] != null && data['images'].isNotEmpty)
          ? data['images'][0]
          : 'https://via.placeholder.com/150';
      return HousingItem(
          name: data['housingName'] ?? '', image: image, data: data);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Search Housing")),
      body: FutureBuilder<List<HousingItem>>(
        future: fetchHousings(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return Center(child: Text('Error: ${snapshot.error}'));

          final housings = snapshot.data ?? [];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchableList<HousingItem>(
              initialList: housings,
              itemBuilder: (housing) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HousingDetailsPage(housing.data),
                      ),
                    );
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 10,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                          child: Image.network(
                            housing.image.isNotEmpty ? housing.image : 'https://imgs.search.brave.com/pv3F3m44Zxe8fcgTmakeHvsUXeHGI2E-cBuFyd28Xtw/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9ibG9n/Z2VyLmdvb2dsZXVz/ZXJjb250ZW50LmNv/bS9pbWcvYi9SMjl2/WjJ4bC9BVnZYc0Vp/Vkhva2FSZkV6WG90/bmJueUM1RWh6LW1W/OUI1WFRyczJ0bENp/aUhCaHhaTW1SNnRj/Q2V0aU5MUjh0Y3FP/YWk0VHU0TjJTdC1z/c1ZDd3A5b3ExMTQ3/VFpfa0pPaWNENGRp/MkI2UEQ5MW1DWlRI/c0h0bDhacjUxcEgz/Y0plYUxkbUNmOGc0/Nlh1MDBaeU5wSTRE/ZDFsME5RZEw1akdL/UkZ6cUdVWXppU1hV/UDdpUVBwcnNUTFJE/U1pBencvdzUxMi1o/NjQwLXJ3LyVEOCVC/NSVEOSU4OCVEOCVC/MS0lRDglQjMlRDkl/ODglRDglQUYlRDgl/QTctMS5qcGc',
                            width: double.infinity,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                housing.data['housingName'] ?? 'Unknown',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '${housing.data['governorate'] ?? ''} - '
                                    '${housing.data['residentType'] ?? ''} '
                                    '\$${housing.data['price']?['monthly'] ?? '0'}',
                                style: TextStyle(color: Colors.grey[600], fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              filter: (value) => housings
                  .where((item) =>
                  item.name.toLowerCase().contains(value.toLowerCase()))
                  .toList(),
              emptyWidget: const Center(child: Text("No housing found")),
              inputDecoration: InputDecoration(
                labelText: "Search Housing",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
          );
        },
      ),
    );
  }
}

class HousingItem {
  final String name;
  final String image;
  final Map<String, dynamic> data;

  HousingItem({required this.name, required this.image, required this.data});
}
