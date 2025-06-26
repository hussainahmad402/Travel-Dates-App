import 'package:flutter/material.dart';
import 'package:traveldates/widgets/custom_textfields.dart';
import 'package:traveldates/widgets/bottom_navigation.dart'; // Import your custom navbar

class AddTripDetailScreen extends StatefulWidget {
  const AddTripDetailScreen({super.key});

  @override
  State<AddTripDetailScreen> createState() => _AddTripDetailScreenState();
}

class _AddTripDetailScreenState extends State<AddTripDetailScreen> {
  DateTime? startDate;
  DateTime? endDate;

  Future<void> _pickDate(BuildContext context, bool isStart) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF23284E),
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.06,
            vertical: size.height * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Trip",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: size.height * 0.025),
              const CustomTextFormField(label: "Origin:"),
              SizedBox(height: size.height * 0.02),
              const CustomTextFormField(label: "Destination:"),
              SizedBox(height: size.height * 0.02),
              // Start Date
              GestureDetector(
                onTap: () => _pickDate(context, true),
                child: AbsorbPointer(
                  child: CustomTextFormField(
                    label: "Start Date:",
                    controller: TextEditingController(
                      text: startDate == null
                          ? ""
                          : "${startDate!.day}/${startDate!.month}/${startDate!.year}",
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              // End Date
              GestureDetector(
                onTap: () => _pickDate(context, false),
                child: AbsorbPointer(
                  child: CustomTextFormField(
                    label: "End Date:",
                    controller: TextEditingController(
                      text: endDate == null
                          ? ""
                          : "${endDate!.day}/${endDate!.month}/${endDate!.year}",
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              const CustomTextFormField(label: "Short Description:"),
              SizedBox(height: size.height * 0.02),
              const CustomTextFormField(label: "Detailed Description:"),
              SizedBox(height: size.height * 0.04),
              // Upload and buttons row
              SizedBox(height: size.height * 0.02),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Left side: Labels and icons
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Add Documents:",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: size.height * 0.008),
                        Icon(Icons.cloud_upload, color: Color(0xFF23284E), size: size.width * 0.08),
                        SizedBox(height: size.height * 0.018),
                        const Text(
                          "Add Images:",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: size.height * 0.008),
                        Icon(Icons.cloud_upload, color: Color(0xFF23284E), size: size.width * 0.08),
                      ],
                    ),
                  ),
                  // Right side: Buttons
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFAF9A73),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.012,
                            horizontal: size.width * 0.08,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Save as draft",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFF23284E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2, // highlight the Trips tab
        onTap: (index) {
          Navigator.of(context).pop(); // or use your navigation logic
        },
        showListView: false,
        showGridView: false,
        isAddTrip: false,
      ),
    );
  }
}