import 'package:flutter/material.dart';

class TripListCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String date;
  final String desc;
  final String status; // e.g. "lasted 27 Days"

  const TripListCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.date,
    required this.desc,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.12, // ≈ 74 pixels
      // width: size.width * 0.717, // ≈ 274 pixels
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.06),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F5F0),
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Trip image
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              imagePath,
              width: size.width * 0.22,
              height: size.height * 0.16,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: size.width * 0.04),
          // Trip details
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Color(0xFF23284E),
                    ),
                  ),
                  SizedBox(height: size.height * 0.003),
                  Text(
                    date,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w700,
                      fontSize: 6,
                      height: 2,
                      color: Color(0xFF23284E),
                    ),
                  ),
                  SizedBox(height: size.height * 0.003),
                  Text(
                    desc,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w400,
                      fontSize: 6,
                      color: Color(0xFF23284E),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Status badge (vertical, right side)
          Container(
              padding: EdgeInsets.all(20),
            // margin: EdgeInsets.only(
            //   left: size.width * 0.09,
            //   top: size.height * 0.02,
            // ),
            child: RotatedBox(
              quarterTurns: 3,
              child: Container(
                width: size.width * 0.139, // ≈ 52 pixels
                height: size.height * 0.019, // ≈ 12 pixels
                padding: EdgeInsets.only(top: 2),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 129, 105, 105),
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withAlpha(50),
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Text(
                  textAlign: TextAlign.center,
                  status,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 6,
                    fontFamily: "Poppins",
                  ),
                ),
              ),
            ),
          ),
      
        ],
      ),
    );
  }
}
