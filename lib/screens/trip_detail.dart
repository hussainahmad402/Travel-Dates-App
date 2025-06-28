import 'package:flutter/material.dart';
import 'package:traveldates/widgets/bottom_navigation.dart';

class TripDetailScreen extends StatefulWidget {
   TripDetailScreen({super.key});
  


  @override
  State<TripDetailScreen> createState() => _TripDetailScreenState();
}

class _TripDetailScreenState extends State<TripDetailScreen> {
String _mainImagePath = 'assets/document_navbar/1.png';

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      body: Stack(
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
            padding: EdgeInsets.only(left: size.width * 0.03,top: size.height*0.04),
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
                        _mainImagePath, // Dummy path
                        width: size.width * 0.68,
                        height: size.height * 0.27,
                        fit: BoxFit.cover,
                      ),
                    ),
      
                     SizedBox(width: size.width * 0.026),
      
                    // Small right-side images
                    Column(
                      children: [
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _mainImagePath = 'assets/document_navbar/1.png';
                            });
                          },
                          child: Image.asset(
                            'assets/document_navbar/1.png',
                            width: size.width * 0.17,
                            height: size.width * 0.17,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height:  size.height * 0.0099),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _mainImagePath='assets/document_navbar/2.png';
                            });
                          },
                          child: Image.asset(
                            'assets/document_navbar/2.png',
                            width: size.width * 0.17,
                            height: size.width * 0.17,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(height:  size.height * 0.0099),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              _mainImagePath='assets/document_navbar/3.png';
                            });
                          },
                          child: Image.asset(
                            'assets/document_navbar/3.png',
                            width: size.width * 0.17,
                            height: size.width * 0.17,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
      
                 SizedBox(height:  size.height * 0.01),
      
                // Trip Title
                Center(
                  child: Text(
                    "Trip to Paris",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
      
                 SizedBox(height:  size.height * 0.0099),
      
                // Trip Dates
                Center(
                  child: Text(
                    "FRI, 03 Dec 2021 - TUE, 04 DEC 2021",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize:13,
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
                      SizedBox(width: size.width * 0.026),
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
      
                SizedBox(height: size.height * 0.029),
      
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
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: size.height * 0.0099),
                      Text(
                        "Lorem Ipsum is simply dummy text of the printing and typesetting industry. "
                        "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, "
                        "when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                        style: TextStyle(fontSize: 11),
                      ),
                    ],
                  ),
                ),
      
                SizedBox(height: size.height * 0.029),
      
                // Documents
                Padding(
                  padding: EdgeInsets.only(left: size.width * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Documents:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                       SizedBox(height: size.width * 0.026),
                      Row(
                        children: [
                          Image.asset(
                            'assets/document_navbar/document.png',
                            width: size.width * 0.2,
                            height: size.width * 0.2,
                          ),
                           SizedBox(width: size.width * 0.026),
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
      
                SizedBox(height: size.height * 0.049),
              ],
            ),
          ),
          
        ],
        
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2, // highlight the Trips tab
        onTap: (index) {
          Navigator.of(context).pop(); // or use your navigation logic
        },
        // showListView: false,
        // showGridView: false,
      ),
    );
  }
}
