import 'package:flutter/material.dart';

class TripDetailScreen extends StatelessWidget {
  const TripDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            // Left vertical line
            Positioned(
              left: 0,
              top: 0,
              bottom: 0,
              child: Container(
                width: size.width * 0.03,
                color: const Color(0xFF23284E),
              ),
            ),
            // Main content
            Padding(
              padding: EdgeInsets.only(left: size.width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main image
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        child: Image.asset(
                          'assets/document_navbar/left image.png', // Dummy path
                          width: size.width * 0.68,
                          height: size.height * 0.25,
                          fit: BoxFit.cover,
                        ),
                      ),

                      const SizedBox(width: 16),

                      // Small right-side images
                      Column(
                        children: [
                          Image.asset(
                            'assets/document_navbar/1.png',
                            width: size.width * 0.17,
                            height: size.width * 0.17,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8),
                          Image.asset(
                            'assets/document_navbar/2.png',
                            width: size.width * 0.17,
                            height: size.width * 0.17,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 8),
                          Image.asset(
                            'assets/document_navbar/3.png',
                            width: size.width * 0.17,
                            height: size.width * 0.17,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 16),

                  // Trip Title
                  Center(
                    child: Text(
                      "Trip to Paris",
                      style: TextStyle(
                        fontSize: size.width * 0.08,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 6),

                  // Trip Dates
                  Center(
                    child: Text(
                      "FRI, 03 Dec 2021 - TUE, 04 DEC 2021",
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: size.width * 0.04,
                      ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Buttons (In 5 Days / 32 days Trip)
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFB79D6C),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            'In 5 Days',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF23284E),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            '32 days Trip',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Description
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description:',
                          style: TextStyle(
                            fontSize: size.width * 0.07,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                          "when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                          style: TextStyle(fontSize: size.width * 0.05),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Documents
                  Padding(
                    padding: EdgeInsets.only(left: size.width * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Documents:',
                          style: TextStyle(
                            fontSize: size.width * 0.07,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Image.asset(
                              'assets/document_navbar/document.png',
                              width: size.width * 0.2,
                              height: size.width * 0.2,
                            ),
                            const SizedBox(width: 10),
                            Image.asset(
                              'assets/document_navbar/document.png',
                              width: size.width * 0.2,
                              height: size.width * 0.2,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
