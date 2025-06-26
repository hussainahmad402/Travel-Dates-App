import 'package:flutter/material.dart';
import 'package:traveldates/screens/main_screen.dart';
import 'package:traveldates/screens/personal_edit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

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
                  vertical: size.height * 0.04,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back arrow
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        );
                      },
                      child: Icon(Icons.arrow_back, size: size.width * 0.08),
                    ),
                    SizedBox(height: size.height * 0.01),
                    // Title and edit icon
                    Row(
                      children: [
                        const Expanded(
                          child: Text(
                            "Personal Information",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w600,
                              fontSize: 32,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit, color: Color(0xFF23284E), size: 24),
                          onPressed: () {
                            // Navigate to edit screen (to be implemented)
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PersonalEditScreen()));
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.04),
                    // Name
                    const Text(
                      "Name:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Color(0xFF23284E),
                      ),
                    ),
                    SizedBox( height: size.width * 0.019),
                    const Text(
                      "John Smith",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        color: Color(0xff23284E),
                      ),
                    ),
                    SizedBox(height: size.height * 0.065),
                    // Home, City
                    const Text(
                      "Home, City:",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Color(0xFF23284E),
                      ),
                    ),
                     SizedBox(height:  size.width * 0.024),
                    const Text(
                      "Los Angeles, California",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: size.height * 0.065),
                    // Email
                    const Text(
                      "Email",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w700,
                        fontSize: 25,
                        color: Color(0xFF23284E),
                      ),
                    ),
                     SizedBox(height:  size.width * 0.024),
                    const Text(
                      "abcd1234@gmail.com",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 18,
                        color: Colors.black,
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