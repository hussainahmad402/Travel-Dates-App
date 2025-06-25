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
                    // Back arrow on its own row
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        );
                      },
                      child: Icon(Icons.arrow_back, size: size.width * 0.08),
                    ),
                    // Title with airplane overlay
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        // Large "Setting" title
                        Padding(
                          padding: EdgeInsets.only(top: size.height * 0.01),
                          child: Text(
                            "Setting",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: size.width * 0.25,
                              color: const Color(0xFFAF9A73),
                              letterSpacing: 3,
                              // height: 1,
                            ),
                          ),
                        ),
                        // Airplane and dashed line overlay
                        Positioned(
                          top: size.height * 0.05,
                          left: size.width * 0.18,
                          right: size.width * 0.18,
                          child: Image.asset(
                            'assets/splash_screen/Vector_plane.png',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.12,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1A2038),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                elevation: 0,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DeleteScreen(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Delete Account",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF1A2038),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                elevation: 0,
                              ),
                              onPressed: () {
                                Get.dialog(const SignOutDialog());
                              },
                              child: const Text(
                                "Signout",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
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

class SignOutDialog extends StatelessWidget {
  const SignOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        width: 229,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min, // <-- Important!
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "SignOut",
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Do you want to signout from Travel Dates?",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12), // Instead of Spacer
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
