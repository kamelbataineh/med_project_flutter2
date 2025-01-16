import 'package:flutter/material.dart';
import 'City_Housing.dart';
import 'Class_Favorites.dart';

class Addinfo extends StatefulWidget {
  @override
  _AddHousingScreenState createState() => _AddHousingScreenState();
}

class _AddHousingScreenState extends State<Addinfo> {
  String? imageUrl = '';
  String? imageUrl1 = '';
  double? price;
  String? housingName;
  String? residentType;
  String? governorate;
  String? region;
  String? phoneNumber;
  String? address;
  String? googleMapLink;

  List<String> regions = [];

  void updateRegions(String selectedGovernorate) {
    setState(() {
      switch (selectedGovernorate) {
        case 'إربد':
          regions = ['جامعة اليرموك', 'جامعة العلوم والتكنولوجيا الأردنية'];
          break;
        case 'عمان':
          regions = [
            'الجامعة الأردنية',
            'جامعة الأميرة سمية للتكنولوجيا',
            'جامعة البترا',
            'الجامعة الألمانية الأردنية',
            'جامعة الشرق الأوسط'
          ];
          break;
        case 'الزرقاء':
          regions = ['جامعة الهاشمية'];
          break;
        case 'العقبة':
          regions = ['فرع الجامعة الأردنية - العقبة'];
          break;
        case 'مأدبا':
          regions = ['جامعة الزيتونة الأردنية', 'جامعة الإسراء'];
          break;
        case 'السلط':
          regions = ['جامعة البلقاء التطبيقية'];
          break;
        case 'جرش':
          regions = ['جامعة جرش'];
          break;
        case 'عجلون':
          regions = ['جامعة عجلون الوطنية'];
          break;
        case 'الكرك':
          regions = ['جامعة مؤتة'];
          break;
        case 'الطفيلة':
          regions = ['جامعة الطفيلة التقنية'];
          break;
        case 'معان':
          regions = ['جامعة الحسين بن طلال'];
          break;
        default:
          regions = [];
      }
      region = null;
    });
  }

  void addHousingItem() {
    if (price != null &&
        housingName != null &&
        residentType != null &&
        governorate != null &&
        phoneNumber != null &&
        address != null &&
        googleMapLink != null &&
        imageUrl != null) {
      AddHous newHouse = AddHous(price!, housingName!, imageUrl!, phoneNumber!,
          governorate!, googleMapLink!, residentType!, address as int);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم إضافة السكن بنجاح!')),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CityHousing(),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('يرجى تعبئة جميع الحقول!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("Add Housing"),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Icon(Icons.camera_alt, color: Colors.grey),
                        SizedBox(width: 8),
                        TextButton(
                          child: Text(
                            'إضافة صورة',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            setState(() {
                              imageUrl =
                                  'https://i.pinimg.com/236x/f5/4b/bc/f54bbc3f479cfe3cad0cc629f72d4b61.jpg';
                              imageUrl1 =
                                  'https://i.pinimg.com/236x/3b/4a/b3/3b4ab3a6f53616bc80882372503c2122.jpg'; // Second image URL
                            });
                          },
                        ),
                        // First image
                        if (imageUrl != null && imageUrl!.isNotEmpty)
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                                bottom: Radius.circular(10)),
                            child: Image.network(
                              imageUrl!,
                              fit: BoxFit.cover,
                            ),
                          ),
                        SizedBox(
                          width: 10,
                        ),
                        if (imageUrl1 != null && imageUrl1!.isNotEmpty)
                          ClipRRect(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                                bottom: Radius.circular(10)),
                            child: Image.network(
                              imageUrl1!,
                              fit: BoxFit.fill,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      buildTextField(
                        'اسم السكن',
                        Icons.apartment,
                        onChanged: (value) {
                          housingName = value;
                        },
                      ),
                      buildDropdown(
                        'اختر نوع الساكنين',
                        ['طالبات', 'طلاب'],
                        (value) {
                          setState(() => residentType = value);
                        },
                      ),
                      buildDropdown(
                        'اختر المحافظة',
                        [
                          'إربد',
                          'عمان',
                          'الزرقاء',
                          'العقبة',
                          'مأدبا',
                          'السلط',
                          'جرش',
                          'عجلون',
                          'الكرك',
                          'الطفيلة',
                          'معان',
                        ],
                        (value) {
                          setState(() {
                            governorate = value;
                            updateRegions(value!);
                          });
                        },
                      ),
                      buildDropdown(
                        'بقرب من',
                        regions,
                        (value) {
                          setState(() => region = value);
                        },
                      ),
                      buildTextField(
                        'الهاتف',
                        Icons.phone,
                        onChanged: (value) {
                          phoneNumber = value;
                        },
                      ),
                      buildTextField(
                        'العنوان - شارع - بجانب مكان',
                        Icons.location_on,
                        onChanged: (value) {
                          address = value;
                        },
                      ),
                      buildTextField(
                        'رابط جوجل ماب',
                        Icons.map,
                        onChanged: (value) {
                          googleMapLink = value;
                        },
                      ),
                      buildTextField(
                        'السعر',
                        Icons.monetization_on_outlined,
                        onChanged: (value) {
                          price = double.tryParse(value);
                        },
                      ),
                      SizedBox(height: 20),
                      ElevatedButton(
                        onPressed: addHousingItem,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF15b9b4),
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 5,
                        ),
                        child: Text(
                          'إضافة السكن',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
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

  Widget buildTextField(String label, IconData icon,
      {Function(String)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[600]),
          prefixIcon: Icon(icon, color: Color(0xFF15b9b4)),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFF15b9b4), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(
      String label, List<String> items, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey[600]),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Color(0xFF15b9b4), width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
        value: items.contains(label == 'اختر المحافظة' ? governorate : region)
            ? (label == 'اختر المحافظة' ? governorate : region)
            : null,
        dropdownColor: Colors.white,
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'Class_Favorites.dart';
//
// class Addinfo extends StatefulWidget {
//   @override
//   _AddHousePageState createState() => _AddHousePageState();
// }
//
// class _AddHousePageState extends State<Addinfo> {
//   final TextEditingController priceController = TextEditingController();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController linkController = TextEditingController();
//   final TextEditingController typeController = TextEditingController();
//   final TextEditingController idController = TextEditingController();
//
//   void addHouse() {
//     final double price = double.tryParse(priceController.text) ?? 0.0;
//     final String name = nameController.text;
//     final String phone = phoneController.text;
//     final String city = cityController.text;
//     final String link = linkController.text;
//     final String type = typeController.text;
//     final int id = int.tryParse(idController.text) ?? 0;
//
//     final newHouse = AddHous(price, name, 'https://via.placeholder.com/150', phone, city, link, type, id);
//
//     Navigator.pop(context, newHouse);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add New House'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ScrollNotificationObserver(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               TextField(
//                 controller: priceController,
//                 decoration: InputDecoration(labelText: 'Price'),
//                 keyboardType: TextInputType.number,
//               ),
//               TextField(
//                 controller: nameController,
//                 decoration: InputDecoration(labelText: 'House Name'),
//               ),
//               TextField(
//                 controller: phoneController,
//                 decoration: InputDecoration(labelText: 'Phone'),
//               ),
//               TextField(
//                 controller: cityController,
//                 decoration: InputDecoration(labelText: 'City'),
//               ),
//               TextField(
//                 controller: linkController,
//                 decoration: InputDecoration(labelText: 'Location Link'),
//               ),
//               TextField(
//                 controller: typeController,
//                 decoration: InputDecoration(labelText: 'Type'),
//               ),
//               TextField(
//                 controller: idController,
//                 decoration: InputDecoration(labelText: 'House ID'),
//                 keyboardType: TextInputType.number,
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: addHouse,
//                 child: Text('Add House'),
//                 style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
