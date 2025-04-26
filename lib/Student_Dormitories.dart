import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Housing_Details_Page.dart';

class StudentDormitories extends StatefulWidget {
  const StudentDormitories({super.key});

  @override
  State<StudentDormitories> createState() => _StudentDormitoriesState();
}

class _StudentDormitoriesState extends State<StudentDormitories> {
  final List<String> universities = [
    "University of Jordan",
    "Yarmouk University",
    "Mutah University",
    "Jordan University of Science and Technology",
    "Al-Balqa Applied University",
    "Al-Hussein Bin Talal University",
    "Tafila Technical University",
    "Al al-Bayt University",
    "German-Jordanian University",
    "Zarqa Private University"
  ];
  String? selectedGender;
  String? selectedUniversities;
  List<DocumentSnapshot> housings = [];
  bool isLoading = false;
  bool showHousing = false;

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> getHousing() async {
    if (selectedUniversities == null) {
      setState(() {
        housings = [];
        isLoading = false;
      });
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      QuerySnapshot querySnapshot = await firebaseFirestore
          .collection('AddHousing')
          .where('region', isEqualTo: selectedUniversities)
          .where('residentType', isEqualTo: selectedGender)
          .get();

      setState(() {
        housings = querySnapshot.docs;
      });
    } catch (e) {
      print("Error fetching housing data: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Student Dormitories",
          style: TextStyle(fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Choose a city",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
              Divider(color: Colors.grey[400], thickness: 1),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: selectedUniversities,
                hint: Text("Choose a city"),
                items: universities.map((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedUniversities = value;
                    showHousing = false;
                  });
                  getHousing();
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),

              SizedBox(height: 30),
            Divider(color: Colors.grey[400], thickness: 1),
            SizedBox(height: 10),
            Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text("Male Students", style: TextStyle(fontSize: 15)),
                      value: "Male Students",
                      groupValue: selectedGender,
                      onChanged: (String? value) {
                        setState(() {
                          selectedGender = value;
                          showHousing = false;
                        });
                        getHousing();
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title: Text("Female Students", style: TextStyle(fontSize: 15)),
                      value: "Female Students",
                      groupValue: selectedGender,
                      onChanged: (String? value) {
                        setState(() {
                          selectedGender = value;
                          showHousing = false;
                        });
                        getHousing();
                      },
                    ),
                  ),
                ],),
              Center(
                child: ElevatedButton(
                  onPressed: housings.isEmpty
                      ? null
                      : () {
                    setState(() {
                      showHousing = !showHousing;
                    });
                  },
                  child: Text(showHousing ? "Hide Information" : "Show Information"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                ),
              ),


              SizedBox(height: 30),
              if (isLoading)
                Center(child: CircularProgressIndicator())
              else if (showHousing && housings.isNotEmpty)
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0,
                    childAspectRatio: 0.75,
                  ),
                  itemCount: housings.length,
                  itemBuilder: (context, index) {
                    final house = housings[index].data() as Map<String, dynamic>;
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HousingDetailsPage(house),
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
                            Expanded(
                              child: ClipRRect(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                                child: Image.network(
                                  house['images']?.isNotEmpty ?? false
                                      ? house['images'][0]
                                      : 'https://via.placeholder.com/150',
                                  width: double.infinity,
                                  height: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    house['housingName'] ?? 'Unknown',
                                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '${house['governorate'] ?? ''}\n${house['residentType'] ?? ''} \$${house['price']?['monthly'] ?? ''}',
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
                )
              else if (showHousing)
                  Center(
                    child: Text(
                      "No housing available for the selected city.",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
            ],
          ),
        ),
      ),
    );
  }
}


// هاي اذا بدي اضيف خيار ثاني

//
// const SizedBox(height: 20),
// if (selectedUniversity != null) ...[
// Align(
// alignment: Alignment.centerLeft,
// child: Text(
// "Available accommodation",
// style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
// ),
// ),
// Divider(
// color: Colors.grey[400],
// thickness: 1,
// indent: 1,
// endIndent: 1,
// ),
// SizedBox(
// height: 10,
// ),
// DropdownButtonFormField<String>(
// dropdownColor: Colors.white,
// value: selectedDormitory,
// hint: const Text("Choose housing"),
// items: dormitories[selectedUniversity]!.map((String dorm) {
// return DropdownMenuItem<String>(
// value: dorm,
// child: Text(dorm),
// );
// }).toList(),
// onChanged: (String? value) {
// setState(() {
// selectedDormitory = value;
// confirmationMessage = "";
// });
// },
// decoration: InputDecoration(
// border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
// ),
// ),
// ],
//
// final Map<String, List<String>> dormitories = {
//   "University of Jordan": ["Amman Dorm", "Zuhur Dorm"],
//   "Yarmouk University": ["Elite Dorm", "Shabab Dorm"],
//   "Mutah University": ["Karama Dorm", "Aman Dorm"],
//   "Jordan University of Science and Technology": ["Mostaqbal Dorm", "Riyada Dorm"],
//   "Al-Balqa Applied University": ["Engineers Dorm", "Tomooh Dorm"],
//   "Al-Hussein Bin Talal University": ["Reef Dorm", "Aqsa Dorm"],
//   "Tafila Technical University": ["Ebda3 Dorm", "Zuhur Dorm"],
//   "Al al-Bayt University": ["Noor Dorm", "Sofwa Dorm"],
//   "German-Jordanian University": ["Raha Dorm", "Huda Dorm"],
//   "Zarqa Private University": ["Mostaqbal Dorm", "Hayah Dorm"],
// };

