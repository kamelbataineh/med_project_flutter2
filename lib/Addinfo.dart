import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'City_Housing.dart';
import 'Class_Favorites.dart';

class Addinfo extends StatefulWidget {
  @override
  _AddHousingScreenState createState() => _AddHousingScreenState();
}

class _AddHousingScreenState extends State<Addinfo> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference tasksCollection =
      FirebaseFirestore.instance.collection('AddHousing_rented');

  ///
  ///
  ///
  ///
  ///
  ///
  ///

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

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => CityHousing(),
      //   ),
      // );
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
        title: Text("Add Housing"),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
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
                            'إضافة صور',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            setState(() {
                              pickImages();
                            });
                          },
                        ),
                        if (imageFiles.isNotEmpty) ...[
                          for (var imageFile in imageFiles)
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.file(
                                  imageFile,
                                  fit: BoxFit.cover,
                                  height: 150,
                                  width: 150,
                                ),
                              ),
                            ),
                        ],
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
                          backgroundColor: Colors.blue[900],
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
          prefixIcon: Icon(icon, color: Colors.blue[900]),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey[400]!, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.blue[900]!, width: 2),
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
            borderSide: BorderSide(color: Colors.blue[900]!, width: 2),
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

  ///////////////////////////////////////////////////////////////////////////////
  ///
  /// اضافه عده صور
  ///
  ///////////////////////////////////////////////////////////////////////////////

  List<File> imageFiles = [];

  void pickImages1() async {
    final ImagePicker picker = ImagePicker();

    // اذا بدنا نغير لضوره واحده او فيديو  روح على بكجimage_picker
    // غير هاي

    final List<XFile> pickedImages = await picker.pickMultiImage();

    if (pickedImages.isNotEmpty) {
      setState(() {
        imageFiles = pickedImages.map((xfile) => File(xfile.path)).toList();
      });
    }
  }

  void pickImages() async {
    final ImagePicker picker = ImagePicker();

    // اختيار عدة صور
    final List<XFile> pickedImages = await picker.pickMultiImage();

    if (pickedImages.isNotEmpty) {
      setState(() {
        // تحويل الصور إلى ملفات وإضافتها للقائمة
        imageFiles = pickedImages.map((xfile) => File(xfile.path)).toList();
      });
    }
  }


}
