import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TravelDocumentScreen extends StatelessWidget {
  const TravelDocumentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

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
              border: Border.all(color: Colors.black12, width: 5), // subtle border
              color: Colors.white,
            ),
            child: CircleAvatar(
              radius: iconRadius,
              backgroundColor: Colors.white,
              backgroundImage: AssetImage(imgPath),
            ),
          ),
          SizedBox(height:  size.width * 0.024),
          Icon(Icons.remove_red_eye, size: iconRadius * 0.4, color: Colors.black54),
        ],
      );
    }

    return Row(
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
              child: Stack(
                children: [
                  // Main content
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                      vertical: size.height * 0.02,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title with airplane overlay
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: size.height * 0.01),
                              child: Align(
                                alignment: Alignment.topCenter,
                                child: Text(
                                  "Travel\nDocuments",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                  //  fontWeight: FontWeight.w400,
                                    fontSize: 55,
                                    color: const Color(0xFFAF9A73),
                                    letterSpacing: 2,
                                    height: 0.97
                                  ),
                                ),
                              ),
                            ),
                            // Airplane and dashed line overlay
                            Positioned(
                              top: size.height * 0.03,
                              left: size.width * 0.18,
                              right: size.width * 0.18,
                              child: Image.asset(
                                'assets/splash_screen/Vector_plane.png',
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.06),
                        // The stack for document icons
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final w = constraints.maxWidth;
                              final h = constraints.maxHeight;
                              return Stack(
                                children: [
                                  // Passport (top left)
                                  Positioned(
                                    left: w * 0.01,
                                    top: h * 0.00,
                                    child: docIcon('assets/documents/1.png',),
                                  ),
                                  // Driver License (top center)
                                  Positioned(
                                    left: w * 0.4,
                                    top: h * 0.06,
                                    child: docIcon('assets/documents/2.png',radius: size.width * 0.13),
                                  ),
                                  // Visa (top right)
                                  Positioned(
                                    right: w * 0.01,
                                    top: h * 0.19,
                                    child: docIcon('assets/documents/3.png',radius: size.width * 0.12),
                                  ),
                                  // Green Card (left, below passport)
                                  Positioned(
                                    left: w * 0.06,
                                    top: h * 0.28,
                                    child: docIcon('assets/documents/4.png',radius: size.width * 0.1),
                                  ),
                                  // Birth Certificate (center)
                                  Positioned(
                                    left: w * 0.32,
                                    top: h * 0.48,
                                    child: docIcon('assets/documents/5.png'),
                                  ),
                                  // ID Card (right, below visa)
                                  Positioned(
                                    right: w * 0.15,
                                    top: h * 0.47,
                                    child: docIcon('assets/documents/6.png',radius: size.width * 0.08),
                                  ),
                                  // Homeland Security (bottom left)
                                  Positioned(
                                    left: w * 0.01,
                                    bottom: h * 0.05,
                                    child: docIcon('assets/documents/7.png',radius: size.width * 0.15),
                                  ),
                                  // Others (bottom right)
                                  Positioned(
                                    right: w * 0.2,
                                    bottom: h * 0.1,
                                    child: docIcon('assets/documents/8.png'),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        SizedBox(height: size.height * 0.01),
                      ],
                    ),
                  ),
                  // Bottom navigation bar (custom, floating)
                  
                ],
              ),
            ),
          ),
        ],
      );
  }
}