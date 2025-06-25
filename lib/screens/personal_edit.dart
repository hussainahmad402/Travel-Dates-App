import 'package:flutter/material.dart';
import 'package:traveldates/screens/main_screen.dart';
import 'package:traveldates/screens/profile_screen.dart';
import 'package:traveldates/widgets/custom_textfields.dart';

class PersonalEditScreen extends StatelessWidget {
  const PersonalEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Vertical bar
          Container(
            width: size.width * 0.03,
            height: double.infinity,
            color: const Color(0xFF23284E),
          ),
          // Main content
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07,
                  vertical: size.height * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back arrow
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ProfileScreen()));
                      },
                      child: Icon(Icons.arrow_back, size: size.width * 0.08),
                    ),
                    SizedBox(height: size.width * 0.09),
                    // Title
                    const Text(
                      "Edit",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    // CustomTextFormField widgets
                    CustomTextFormField(label: "First Name: *"),
                    SizedBox(height: size.height * 0.015),
                    CustomTextFormField(label: "Last Name:*"),
                    SizedBox(height: size.height * 0.015),
                    CustomTextFormField(label: "Email: *"),
                    SizedBox(height: size.height * 0.015),
                    CustomTextFormField(label: "Home, City: *"),
                    SizedBox(height: size.height * 0.015),
                    CustomTextFormField(label: "add secondary email: (optional)"),
                    SizedBox(height: size.height * 0.015),
                    CustomTextFormField(label: "company name:"),
                    const Spacer(),
                    // Save button
                    Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                        onPressed: () {
                          // Save logic here
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFAF9A73),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom TextFormField widge