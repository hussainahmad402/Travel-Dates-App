import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelDocumentScreen extends StatelessWidget {
  const TravelDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final size = MediaQuery.of(context).size; // Already defined in your code
    final w = size.width;
    final h =
        size.height * 0.64; // Since your SizedBox uses 64% of screen height

    // Helper for document icon with label
    Widget docIcon(String imgPath, {double? radius}) {
      final iconRadius = radius ?? size.width * 0.11;
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: iconRadius * 2,
            height: iconRadius * 2,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black12,
                width: 5,
              ), // subtle border
              color: Colors.white,
            ),
            child: CircleAvatar(
              radius: iconRadius,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(imgPath),
            ),
          ),
          SizedBox(height: size.width * 0.024),
          Icon(
            Icons.remove_red_eye,
            size: iconRadius * 0.4,
            color: Colors.black54,
          ),
        ],
      );
    }

    return Stack(
      children: [
        // Vertical bar
        Container(
          width: size.width * 0.03,
          height: double.infinity,
          color: const Color(0xFF23284E),
        ),
        // Main content
        SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.04,
              vertical: size.height * 0.02,
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title with airplane overlay
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Text(
                      "Travel\nDocuments",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                        //  fontWeight: FontWeight.w400,
                        fontSize: 55,
                        color: const Color(0xFFAF9A73),
                        letterSpacing: 2,
                        height: 0.97,
                      ),
                    ),
                    // Airplane and dashed line overlay
                    Image.asset('assets/splash_screen/Vector_plane.png'),
                  ],
                ),
                SizedBox(height: size.height * 0.06),
                // The stack for document icons
                SizedBox(
                  height: h,
                  width: w,
                  child: Stack(
                    children: [
                      Positioned(
                        left: w * 0.01,
                        top: h * 0.00,
                        child: docIcon('assets/documents/1.png'),
                      ),
                      Positioned(
                        left: w * 0.4,
                        top: h * 0.06,
                        child: docIcon(
                          'assets/documents/2.png',
                          radius: w * 0.13,
                        ),
                      ),
                      Positioned(
                        right: w * 0.01,
                        top: h * 0.19,
                        child: docIcon(
                          'assets/documents/3.png',
                          radius: w * 0.12,
                        ),
                      ),
                      Positioned(
                        left: w * 0.06,
                        top: h * 0.28,
                        child: docIcon(
                          'assets/documents/4.png',
                          radius: w * 0.1,
                        ),
                      ),
                      Positioned(
                        left: w * 0.32,
                        top: h * 0.48,
                        child: docIcon('assets/documents/5.png'),
                      ),
                      Positioned(
                        right: w * 0.15,
                        top: h * 0.47,
                        child: docIcon(
                          'assets/documents/6.png',
                          radius: w * 0.08,
                        ),
                      ),
                      Positioned(
                        left: w * 0.01,
                        bottom: h * 0.05,
                        child: docIcon(
                          'assets/documents/7.png',
                          radius: w * 0.15,
                        ),
                      ),
                      Positioned(
                        right: w * 0.2,
                        bottom: h * 0.1,
                        child: docIcon('assets/documents/8.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
