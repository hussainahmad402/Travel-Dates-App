import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:traveldates/screens/delete_screen.dart';
import 'package:traveldates/screens/main_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Vertical bar
          Container(
            width: size.width * 0.03,
            height: double.infinity,
            color: const Color(0xFF23284E),
          ),
          // Main content

          Positioned(
            top: size.height*0.04,
            left: size.width*0.07,
            child: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  child: Icon(Icons.arrow_back, size: size.width * 0.08),
                ),),
          Padding(
            padding: EdgeInsets.only(
              left: size.width * 0.15,
              top: size.height * 0.08,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                        
                children: [
                  // Back arrow on its own row
                  
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Large "Setting" title
                      Text(
                        
                        "Setting",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 95,
                          color: const Color(0xFFAF9A73),
                          letterSpacing: 2,
                          // height: 1,
                        ),
                      ),
                      // Airplane and dashed line overlay
                      Positioned(
                       left: 25,
                        child: Image.asset(
                          'assets/splash_screen/Vector_plane.png',
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.10),
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomSettingsButton(
                        text: "Delete Account",
                  
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeleteScreen(),
                            ),
                          );
                        },
                        // verticalPadding: size.height * 0.02,
                      ),
                      SizedBox(width: size.width * 0.024),
                      CustomSettingsButton(
                        text: "Signout",
                        onPressed: () {
                          Get.dialog(const SignOutDialog());
                        },
                        // verticalPadding: size.height * 0.02,
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom button widget for settings screen
class CustomSettingsButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  // final double verticalPadding;

  const CustomSettingsButton({
    super.key,
    required this.text,
    required this.onPressed,
    // required this.verticalPadding,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          size.width * 0.30,
          size.height * 0.048, // ≈ 39 pixels
        ), // ≈ 115 pixels),
        backgroundColor: const Color(0xFF1A2038),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        padding: EdgeInsets.symmetric(
          // vertical: verticalPadding,
        ),
        elevation: 0,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w700,
          fontSize: 14,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SignOutDialog extends StatelessWidget {
  const SignOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.symmetric(horizontal: size.width * 0.024),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: size.width * 0.7,
        padding: EdgeInsets.all(size.width * 0.03),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // <-- Important!
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "SignOut",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: size.width * 0.06,
              ),
            ),
            SizedBox(height: size.height * 0.008),
            Text(
              "Do you want to signout from Travel Dates?",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: size.width * 0.035,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: size.height * 0.003), // Instead of Spacer
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Get.back(),
                  child: const Text("Cancel"),
                ),
                TextButton(
                  onPressed: () {
                    // Handle sign out logic here
                    Get.back();
                  },
                  child: const Text(
                    "Ok",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
