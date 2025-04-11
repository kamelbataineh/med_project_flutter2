import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class AddHousing extends StatefulWidget {
  const AddHousing({super.key});

  @override
  State<AddHousing> createState() => _AddHousingState();
}

class _AddHousingState extends State<AddHousing> {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference AddCollection =
  FirebaseFirestore.instance.collection('AddHousing');

  // Controllers for additional fields
  TextEditingController priceController = TextEditingController();
  TextEditingController housingNameController = TextEditingController();
  TextEditingController residentTypeController = TextEditingController();
  TextEditingController governorateController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController googleMapLinkController = TextEditingController();

  List<File> imageFiles = [];
  List<String> regions = [];
  String? housingName;
  String? residentType;
  String? governorate;
  String? region;
  String? phoneNumber;
  String? address;
  String? googleMapLink;
  double? price;

  void updateRegions(String selectedGovernorate) {
    setState(() {
      switch (selectedGovernorate) {
        case 'Irbid':
          regions = ['Yarmouk University', 'Jordan University of Science and Technology'];
          break;
        case 'Amman':
          regions = [
            'University of Jordan',
            'Princess Sumaya University for Technology',
            'Petra University',
            'German Jordanian University',
            'Middle East University'
          ];
          break;
        case 'Zarqa':
          regions = ['Al-Hussein Bin Talal University'];
          break;
        case 'Aqaba':
          regions = ['University of Jordan - Aqaba Branch'];
          break;
        case 'Madaba':
          regions = ['Zaytoonah University of Jordan', 'Al-Israa University'];
          break;
        case 'Salt':
          regions = ['Balqa Applied University'];
          break;
        case 'Jerash':
          regions = ['Jerash University'];
          break;
        case 'Ajloun':
          regions = ['Ajloun National University'];
          break;
        case 'Karak':
          regions = ['Mutah University'];
          break;
        case 'Tafilah':
          regions = ['Al-Tafila Technical University'];
          break;
        case 'Maan':
          regions = ['Hussein Bin Talal University'];
          break;
        default:
          regions = [];
      }
      region = null;
    });
  }


  // // Method to pick multiple images
  // pickImages() async {
  //   final ImagePicker picker = ImagePicker();
  //
  //   // Pick multiple images
  //   final List<XFile> pickedImages = await picker.pickMultiImage();
  //
  //   if (pickedImages.isNotEmpty) {
  //     setState(() {
  //       imageFiles = pickedImages.map((xfile) => File(xfile.path)).toList();
  //     });
  //   }
  // }
  List<QueryDocumentSnapshot> data = [];
  bool isLoading = true;



  getHousing() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot querySnapshot = await AddCollection
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      data = querySnapshot.docs;
      isLoading = false;
    });
  }






  addHousingItem() {

    if (housingName != null && residentType != null && governorate != null &&
        region != null && phoneNumber != null && address != null &&
        googleMapLink != null && price != null //&& imageFiles.isNotEmpty
         ) {
      FirebaseFirestore.instance.collection('AddHousing').add({
        'uid': FirebaseAuth.instance.currentUser!.uid,
        'housingName': housingName,
        'residentType': residentType,
        'governorate': governorate,
        'region': region,
        'phoneNumber': phoneNumber,
        'address': address,
        'googleMapLink': googleMapLink,
        'price': price,
        // 'images': imageFiles,
      }).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم إضافة السكن بنجاح')),
        );
      }).catchError((e) {
        print('خطأ أثناء إضافة السكن: ');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('فشل في إضافة السكن: ')),
        );
      });

      // Update UI state
      setState(() {
        data.clear();
        getHousing();
      });
    }else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('الرجاء ملء جميع الحقول و إضافة صور')),
      );
    }
  }
  @override
  void initState() {
    getHousing();
    super.initState();
  }

  Widget buildTextField(String label, IconData icon, {Function(String)? onChanged}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(),
        ),
        onChanged: onChanged,
      ),
    );
  }


  Widget buildDropdown(String label, List<String> options, Function(String?)? onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        items: options.map((option) {
          return DropdownMenuItem(
            value: option,
            child: Text(option),
          );
        }).toList(),
        onChanged: onChanged,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white70,
        title: Text(
          "Housing App",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Horizontal Scroll for Images
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
                        // TextButton(
                        //   child: Text(
                        //     'إضافة صور',
                        //     style: TextStyle(color: Colors.black),
                        //   ),
                        //   // onPressed: pickImages,
                        // ),
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
            // Form
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  buildTextField(
                    'Housing Name',
                    Icons.apartment,
                    onChanged: (value) {
                      housingName = value;
                    },
                  ),
                  buildDropdown(
                    'Select Resident Type',
                    ['Female Students', 'Male Students'],
                        (value) {
                      setState(() => residentType = value);
                    },
                  ),
                  buildDropdown(
                    'Select Governorate',
                    [
                      'Irbid',
                      'Amman',
                      'Zarqa',
                      'Aqaba',
                      'Madaba',
                      'Salt',
                      'Jerash',
                      'Ajloun',
                      'Karak',
                      'Tafilah',
                      'Maan',
                    ],
                        (value) {
                      setState(() {
                        governorate = value;
                        updateRegions(value!);
                      });
                    },
                  ),
                  buildDropdown(
                    'Nearby To',
                    regions,
                        (value) {
                      setState(() => region = value);
                    },
                  ),
                  buildTextField(
                    'Phone Number',
                    Icons.phone,
                    onChanged: (value) {
                      phoneNumber = value;
                    },
                  ),
                  buildTextField(
                    'Address - Street - Near Place',
                    Icons.location_on,
                    onChanged: (value) {
                      address = value;
                    },
                  ),
                  buildTextField(
                    'Google Map Link',
                    Icons.map,
                    onChanged: (value) {
                      googleMapLink = value;
                    },
                  ),
                  buildTextField(
                    'Price',
                    Icons.monetization_on_outlined,
                    onChanged: (value) {
                      price = double.tryParse(value);
                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed:(){
                      addHousingItem();
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                    ),
                    child: Text(
                      'Add Housing',
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

          ],
        ),
      ),
    );
  }
}
