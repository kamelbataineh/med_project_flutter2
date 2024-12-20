import 'package:flutter/material.dart';
import 'package:med_project_flutter2/consr_routes.dart';

class Addinfo extends StatefulWidget {
  @override
  _AddHousingScreenState createState() => _AddHousingScreenState();
}

class _AddHousingScreenState extends State<Addinfo> {
  String? housingName;
  String? residentType;
  String? governorate;
  String? region;
  String? phoneNumber;
  String? address;
  String googleMapLink = "";
  int imageCount = 1;
  List<String> regions = [''];

  void addImage() {
    if (imageCount < 15) {
      setState(() {
        imageCount++;
      });
    }
  }

  void updateRegions(String selectedGovernorate) {
    setState(() {
      switch (selectedGovernorate) {
        case 'إربد':
          regions = ['جامعة اليرموك', 'جامعة العلوم والتكنولوجيا الأردنية'];
          break;
        case 'عمان':
          regions = ['الجامعة الأردنية', 'جامعة الأميرة سمية للتكنولوجيا', 'جامعة البترا', 'الجامعة الألمانية الأردنية', 'جامعة الشرق الأوسط'];
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
      region = null; });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text('إضافة سكن', style: TextStyle(color: Colors.black)),
        ),
        backgroundColor: Color(0xFF15b9b4),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Icon(Icons.camera_alt, color: Colors.grey),
                Spacer(),
                Text('$imageCount / 15', style: TextStyle(color: Colors.grey)),
                SizedBox(width: 8),
                TextButton(
                  onPressed: addImage,
                  child: Text(
                    'إضافة صور',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10),
            buildTextField('اسم السكن', Icons.apartment),

            buildDropdown(
              'اختر نوع الساكنين',
              ['طالبات', 'طلاب'],
                  (value) {
                setState(() => residentType = value);
              },
            ),

            buildDropdown(
              'اختر المحافظة',
              ['إربد', 'عمان', 'الزرقاء', 'العقبة', 'مأدبا', 'السلط', 'جرش', 'عجلون', 'الكرك', 'الطفيلة', 'معان'],
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

            buildTextField('الهاتف', Icons.phone, initialValue: '0796932237'),

            buildTextField('العنوان - شارع - بجانب مكان', Icons.location_on),

            buildTextField('رابط جوجل ماب', Icons.map),

            SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: () {

              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF15b9b4),
                padding: EdgeInsets.symmetric(vertical: 15),
              ),
              child: Text('إضافة السكن', style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTextField(String label, IconData icon, {String? initialValue}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon, color: Colors.grey),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  Widget buildDropdown(String label, List<String> items, Function(String?) onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: DropdownButtonFormField<String>(
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
        value: items.contains(label == 'اختر المحافظة' ? governorate : region)
            ? (label == 'اختر المحافظة' ? governorate : region)
            : null,
      ),
    );
  }
}
