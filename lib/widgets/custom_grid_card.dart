import 'package:flutter/material.dart';

class TripGridCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final String desc;
  final String badge1;
  final String badge2;

  const TripGridCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.desc,
    required this.badge1,
    required this.badge2,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(80),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Stack(
          children: [
            Image.asset(
              imagePath,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Colors.black.withAlpha(230),
                    Colors.black.withAlpha(50),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:size.width * 0.01,vertical: size.width * 0.04),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                // crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                children: [
                  // Top badges
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, // Center badges horizontally
                    children: [
                      if (badge1.isNotEmpty)
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: size.width * 0.02, vertical: size.height * 0.002),
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(200),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            badge1,
                            style: TextStyle(
                              color: Color(0xFF23284E),
                              fontWeight: FontWeight.w600,
                              fontSize: size.width * 0.02,
                            ),
                          ),
                        ),
                    ],
                  ),
                   SizedBox(height: size.height * 0.01),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style:  TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: size.width * 0.03,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 2),
                  Text(
                    date,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: size.width * 0.015,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: size.width * 0.01),
                  Text(
                    desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: size.width * 0.02,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}