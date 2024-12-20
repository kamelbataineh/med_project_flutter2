import 'package:flutter/material.dart';

class CityHousing extends StatelessWidget {

  final String universityName;

  final Map<String, List<Map<String, String>>> apartmentsByUniversity = {
    'جامعة اليرموك': [
      {'name': 'شقة 1 بالقرب من جامعة اليرموك', 'image': 'https://example.com/image1.jpg'},
      {'name': 'شقة 2 بالقرب من جامعة اليرموك', 'image': 'https://example.com/image2.jpg'},
    ],
    'جامعة العلوم والتكنولوجيا الأردنية': [
      {'name': 'شقة 1 بالقرب من الجامعة', 'image': 'https://imgs.search.brave.com/25UQr9gcIq2j4waKQqpQsoUf_JqF3ewemX2qNvzLcV0/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9saDMu/Z29vZ2xldXNlcmNv/bnRlbnQuY29tLzFi/bnBMc2M5SXphMlVQ/TkloOU9FWThvM2Vq/NmVibTVHcUdwM0Q5/a1NIRGlERUhTOWpB/RWJPRVhCUXpTX010/Tmt3RHZ5VnkxRk1Z/QnFzTXRmRlFSSzVQ/d1Nmd1pCcU8xNk5X/TGw9ZTM2NS1wYS1u/dS1zMA.jpeg'},
      {'name': 'شقة 2 بالقرب من الجامعة', 'image': 'https://example.com/image2.jpg'},
    ],
    'جامعة عجلون الوطنية': [
      {'name': 'شقة 1 بالقرب من جامعة عجلون الوطنية', 'image': 'https://example.com/image1.jpg'},
      {'name': 'شقة 2 بالقرب من جامعة عجلون الوطنية', 'image': 'https://example.com/image2.jpg'},
    ],
    'جامعة الحسين بن طلال': [
      {'name': 'شقة 1 بالقرب من الجامعة', 'image': 'https://example.com/image1.jpg'},
      {'name': 'شقة 2 بالقرب من الجامعة', 'image': 'https://example.com/image2.jpg'},
      {'name': 'شقة 3 بالقرب من الجامعة', 'image': 'https://example.com/image3.jpg'},
    ],
    'الجامعة الأردنية': [
      {'name': 'شقة 1 بالقرب من الجامعة الأردنية', 'image': 'https://example.com/image1.jpg'},
      {'name': 'شقة 2 بالقرب من الجامعة الأردنية', 'image': 'https://example.com/image2.jpg'},
    ],
  };

  CityHousing({required this.universityName});

  @override
  Widget build(BuildContext context) {
    final apartments = apartmentsByUniversity[universityName] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text('سكنات $universityName'),
        backgroundColor: Color(0xFF15b9b4),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        padding: EdgeInsets.all(5),
        physics: BouncingScrollPhysics(),
        itemCount: apartments.length,
        itemBuilder: (context, index) {
          return CityCard(
            apartment: apartments[index],
            onTap: () {
              // // تمرير كائن home مع تفاصيل الشقة
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) =>
              //     ),

            },
          );
        },
      ),
    );
  }
}

class CityCard extends StatelessWidget {
  final Map<String, String> apartment;
  final VoidCallback onTap;

  CityCard({required this.apartment, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                apartment['image']!,
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
                  apartment['name']!,
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
      ),
    );
  }
}
