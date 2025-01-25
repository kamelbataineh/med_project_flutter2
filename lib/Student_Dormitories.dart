import 'package:flutter/material.dart';

class StudentDormitories extends StatefulWidget {
  const StudentDormitories({super.key});

  @override
  State<StudentDormitories> createState() => _StudentDormitoriesState();
}
class _StudentDormitoriesState extends State<StudentDormitories> {
  final List<String> universities = [
    "الجامعة الأردنية",
    "جامعة اليرموك",
    "جامعة مؤتة",
    "جامعة العلوم والتكنولوجيا",
    "جامعة البلقاء التطبيقية",
    "جامعة الحسين بن طلال",
    "جامعة الطفيلة التقنية",
    "جامعة آل البيت",
    "الجامعة الألمانية الأردنية",
    "جامعة الزيتونة الأردنية"
  ];

  final Map<String, List<String>> dormitories = {
    "الجامعة الأردنية": ["سكن عمان", "سكن الزهور"],
    "جامعة اليرموك": ["سكن النخبة", "سكن الشباب"],
    "جامعة مؤتة": ["سكن الكرامة", "سكن الأمان"],
    "جامعة العلوم والتكنولوجيا": ["سكن المستقبل", "سكن الريادة"],
    "جامعة البلقاء التطبيقية": ["سكن المهندسين", "سكن الطموح"],
    "جامعة الحسين بن طلال": ["سكن الريف", "سكن الأقصى"],
    "جامعة الطفيلة التقنية": ["سكن الإبداع", "سكن الزهور"],
    "جامعة آل البيت": ["سكن النور", "سكن الصفوة"],
    "الجامعة الألمانية الأردنية": ["سكن الراحة", "سكن الهدى"],
    "جامعة الزيتونة الأردنية": ["سكن المستقبل", "سكن الحياة"],
  };

  String? selectedUniversity;
  String? selectedDormitory;
  String selectedGender = "طلاب";
  String confirmationMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
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
               Align(
                 alignment: Alignment.centerLeft,
                 child: Text(
                  "Choose a university",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                               ),
               ),
              Divider(
                color: Colors.grey[400],
                thickness: 1,
                indent: 1,
                endIndent: 1,
              ),
              SizedBox(
                height: 10,
              ),
              DropdownButtonFormField<String>(
                value: selectedUniversity,
                hint: const Text("اختر الجامعة"),
                items: universities.map((String university) {
                  return DropdownMenuItem<String>(
                    value: university,
                    child: Text(university),
                  );
                }).toList(),
                onChanged: (String? value) {
                  setState(() {
                    selectedUniversity = value;
                    selectedDormitory = null;
                    confirmationMessage = "";
                  });
                },
                dropdownColor: Colors.white,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
              ),
              const SizedBox(height: 20),
              if (selectedUniversity != null) ...[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Available accommodation",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(
                  color: Colors.grey[400],
                  thickness: 1,
                  indent: 1,
                  endIndent: 1,
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  dropdownColor: Colors.white,
                  value: selectedDormitory,
                  hint: const Text("اختر السكن"),
                  items: dormitories[selectedUniversity]!.map((String dorm) {
                    return DropdownMenuItem<String>(
                      value: dorm,
                      child: Text(dorm),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      selectedDormitory = value;
                      confirmationMessage = "";
                    });
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
              SizedBox(height: 30),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gender",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 1,
                indent: 1,
                endIndent: 1,
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                    child: RadioListTile<String>(
                      title:Text("طلاب"),
                      value: "طلاب",
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: RadioListTile<String>(
                      title:Text("طالبات"),
                      value:"طالبات",
                      groupValue: selectedGender,
                      onChanged: (value) {
                        setState(() {
                          selectedGender = value!;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (selectedUniversity != null && selectedDormitory != null) {
                      setState(() {
                        confirmationMessage =
                        "University:$selectedUniversity\n"
                        "Housing:$selectedDormitory\nGender: $selectedGender";
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                          content: Text("يرجى اختيار الجامعة والسكن."),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[900],
                    padding:EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                  ),
                  child:Text(
                    "Show",
                    style: TextStyle(fontSize: 18,color: Colors.black),
                  ),
                ),
              ),
               SizedBox(height: 20),
              if (confirmationMessage.isNotEmpty)
                Center(
                  child: Text(
                    confirmationMessage,
                    style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


