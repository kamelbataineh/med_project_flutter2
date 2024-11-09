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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerRight,
          child: Text('إضافة سكن', style: TextStyle(color: Colors.black)),
        ),

    leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
    Navigator.of(context).pushNamed(route_cities2);
    },

      ),
        backgroundColor: Color(0xFF15b9b4),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Add Image Button
            Row(
              children: [
                Icon(Icons.camera_alt, color: Colors.grey),
                Spacer(),
                Text('0 / 15', style: TextStyle(color: Colors.grey)),
                SizedBox(width: 8),
                TextButton(
                  onPressed: () {

                  },
                  child: Text(
                    'إضافة صور',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            // Housing Name Field
            buildTextField('اسم السكن', Icons.apartment),

            // Resident Type Dropdown
            buildDropdown('اختر نوع الساكنين', ['طالبات', 'طلاب', 'أسر'],
                (value) {
              setState(() => residentType = value);
            }),

            // Governorate Dropdown
            buildDropdown('اختر المحافظة', [
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
              'معان'
            ],
                (value) {
              setState(() => governorate = value);
            }),

            // Region Dropdown
            buildDropdown('بقرب من ', ['بوشر', 'السيب', 'الخوض'], (value) {
              setState(() => region = value);
            }),

            // Phone Number Field
            buildTextField('الهاتف', Icons.phone, initialValue: '0796932237'),

            // Address Field
            buildTextField('العنوان - شارع - بجانب مكان', Icons.location_on),

            // Google Map Link Field
            buildTextField('رابط جوجل ماب', Icons.map),

            SizedBox(height: 20),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                // Implement submit logic
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

  Widget buildDropdown(
      String label, List<String> items, Function(String?) onChanged) {
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
      ),
    );
  }
}
