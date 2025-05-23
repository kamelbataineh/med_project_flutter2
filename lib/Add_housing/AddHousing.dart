import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  TextEditingController priceController         = TextEditingController();
  TextEditingController housingNameController   = TextEditingController();
  TextEditingController residentTypeController  = TextEditingController();
  TextEditingController governorateController   = TextEditingController();
  TextEditingController regionController        = TextEditingController();
  TextEditingController phoneNumberController   = TextEditingController();
  TextEditingController addressController       = TextEditingController();
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
  double? dailyPrice;
  double? weeklyPrice;
  double? monthlyPrice;

  void updateRegions(String selectedGovernorate) {
    setState(() {
      switch (selectedGovernorate) {
        case 'Irbid':
          regions = [
            'Yarmouk University',
            'Jordan University of Science and Technology',
          ];
          break;
        case 'Amman':
          regions = [
            'University of Jordan',
            'German Jordanian University',
          ];
          break;
        case 'Zarqa':
          regions = ['Hashemite University'];
          break;
        case 'Aqaba':
          regions = ['University of Jordan - Aqaba Branch'];
          break;
        case 'Madaba':
          regions = ['American University of Madaba']; // جامعة خاصة
          break;
        case 'Salt':
          regions = ['Al-Balqa Applied University'];
          break;
        case 'Jerash':
          regions = ['Jerash University']; // جامعة خاصة
          break;
        case 'Ajloun':
          regions = ['Ajloun National University']; // جامعة خاصة
          break;
        case 'Mafraq':
          regions = ['Al al-Bayt University'];
          break;
        case 'Karak':
          regions = ['Mutah University'];
          break;
        case 'Tafilah':
          regions = ['Tafila Technical University'];
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
  pickImages() async {
    final ImagePicker picker = ImagePicker();
    try {
      final List<XFile> pickedImages = await picker.pickMultiImage();

      if (pickedImages.isNotEmpty) {
        setState(() {
          imageFiles = pickedImages.map((xfile) => File(xfile.path)).toList();
        });
      }
    } catch (e) {
      print("Error picking images: $e");
    }
  }


  List<QueryDocumentSnapshot> data = [];
  bool isLoading = true;

  getHousing() async {
    setState(() {
      isLoading = true;
    });
    QuerySnapshot querySnapshot = await AddCollection.where('uid',
            isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {
      data = querySnapshot.docs;
      isLoading = false;
    });
  }

  addHousingItem() async {
    if (housingName != null &&
        residentType != null &&
        governorate != null &&
        region != null &&
        phoneNumber != null &&
        address != null &&
        googleMapLink != null &&
        dailyPrice != null &&
        weeklyPrice != null &&
        monthlyPrice != null &&
        imageFiles.isNotEmpty) {
      try {
        List<String> imageUrls = [];

        for (File image in imageFiles) {
          String fileName = DateTime.now().millisecondsSinceEpoch.toString();
          Reference ref = FirebaseStorage.instance
              .ref()
              .child('images')
              .child(fileName);

          try {
            UploadTask uploadTask = ref.putFile(image);
            TaskSnapshot snapshot = await uploadTask;
            String imageUrl = await snapshot.ref.getDownloadURL();
            imageUrls.add(imageUrl);
          } catch (e) {
            print("Error uploading image: $e");
          }
        }

        await FirebaseFirestore.instance.collection('AddHousing').add({
          'uid': FirebaseAuth.instance.currentUser!.uid,
          'housingName': housingName,
          'residentType': residentType,
          'governorate': governorate,
          'region': region,
          'phoneNumber': phoneNumber,
          'address': address,
          'googleMapLink': googleMapLink,
          'price': {
            'daily': dailyPrice,
            'weekly': weeklyPrice,
            'monthly': monthlyPrice,
          },  'images': imageUrls,
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('تم إضافة السكن بنجاح')),
        );

        setState(() {
          data.clear();
          getHousing();
          Navigator.pop(context);
        });
      } catch (e) {
        print('خطأ أثناء إضافة السكن: ');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('فشل في إضافة السكن: ')),
        );
      }
    } else {
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

  Widget buildTextField(String label, IconData icon,
      {Function(String)? onChanged}) {
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

  Widget buildDropdown(
      String label, List<String> options, Function(String?)? onChanged) {
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
            child: Text(
              option,
              style: TextStyle(fontSize: 14),
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          );
        }).toList(),
        onChanged: onChanged,
        dropdownColor: Colors.grey[300],
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
                          //////////////////////
                          onPressed: pickImages,
                          child: Text(
                            'إضافة صور',
                            style: TextStyle(color: Colors.black),
                          ),
                          // onPressed: pickImages,
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
            // Form
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  buildTextField(
                    'Housing Name',
                    Icons.apartment,
                    onChanged: (value) {
                      if (value.length <= 10) {
                        housingName = value;
                      }                    },
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
                      'Jerash',
                      'Ajloun',
                      'Mafraq',
                      'Amman',
                      'Zarqa',
                      'Mdapa',
                      'Balqa',
                      'Madaba',
                      'Karak',
                      'Tafilah',
                      'Maan',
                      'Aqaba',
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
                      if (value.length <= 10) {
                        phoneNumber = value;
                      }                    },
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
                    'Daily Price',
                    Icons.attach_money,
                    onChanged: (value) {

                      if (value.length <= 10) {
                      dailyPrice = double.tryParse(value);
                      }
                    },
                  ),
                  buildTextField(
                    'Weekly Price',
                    Icons.attach_money,
                    onChanged: (value) {
                      if (value.length <= 10) {
                        weeklyPrice = double.tryParse(value);
                      }                    },
                  ),
                  buildTextField(
                    'Monthly Price',
                    Icons.attach_money,
                    onChanged: (value) {
                      if (value.length <= 10) {
                        monthlyPrice = double.tryParse(value);
                      }                    },
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      addHousingItem();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900],
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 40),
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
