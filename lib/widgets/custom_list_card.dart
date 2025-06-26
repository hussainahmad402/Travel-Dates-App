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
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.06),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F5F0),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(50),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          // vertical: size.height * 0.018,
          // horizontal: size.width * 0.025,
        ),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Trip image
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    imagePath,
                    width: size.width * 0.22,
                    height: size.height * 0.11,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: size.width * 0.04),
                // Trip details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: size.width * 0.04,
                          color: Color(0xFF23284E),
                        ),
                      ),
                      SizedBox(height: size.height * 0.003),
                      Text(
                        date,
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          fontSize: size.width * 0.024,
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
                          fontSize: size.width * 0.025,
                          color: Color(0xFF23284E),
                        ),
                      ),
                    ],
                  ),
                ),
                // Status badge (vertical, right side)
                Padding(
                  padding: EdgeInsets.only(right: size.width * 0.04),
                  child: Container(
                    margin: EdgeInsets.only(left: size.width * 0.09),
                    child: RotatedBox(
                      quarterTurns: 3,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 129, 105, 105),
                          borderRadius: BorderRadius.circular(14),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withAlpha(50),
                              blurRadius: 6,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          status,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: size.width * 0.024,
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
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
