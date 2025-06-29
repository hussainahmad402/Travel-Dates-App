import 'package:flutter/material.dart';

class TripGridCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final String desc;
  final String badge1;
  final String badge2;
  final String status;

  const TripGridCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.desc,
    required this.badge1,
    required this.badge2,
    this.status="",
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.11, // ≈ 61 pixels
      width: size.width * 0.33,
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
              fit: BoxFit.fill,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
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
              padding: EdgeInsets.only(
                left: size.width * 0.01,
                top: size.width * 0.02,
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center, // Center vertically
                // crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
                children: [
                  // Top badges
                  Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Center badges horizontally
                    children: [
                      if (badge1.isNotEmpty)
                        Container(
                          width: size.width * 0.118, // ≈ 45 pixels
                          height: size.height * 0.015, // ≈ 9 pixels
                          padding: EdgeInsets.only(
                            left: size.width * 0.01,
                            top: size.height * 0.004,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withAlpha(200),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            badge1,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF23284E),
                              fontWeight: FontWeight.w600,
                              fontSize: 6,
                            ),
                          ),
                        ),
                      // if (badge2.isNotEmpty)
                        SizedBox(
                          width: size.width * 0.02,
                        ), // Space between badges
                      if (badge2.isNotEmpty)
                        Container(
                          width: size.width * 0.118,
                          height: size.height * 0.015,
                          padding: EdgeInsets.only(
                            left: size.width * 0.01,
                            top: size.height * 0.004,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffAF9A73),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            badge2,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF23284E),
                              fontWeight: FontWeight.w600,
                              fontSize: 6,
                            ),
                          ),
                        ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 7,
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
                      fontSize: 6,
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
                      fontSize: 6,
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
