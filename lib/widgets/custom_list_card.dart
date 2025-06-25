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
      margin: EdgeInsets.symmetric(horizontal: size.width * 0.01),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F5F0),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.13),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background world map (optional, if you want to add a faded background image)
          // Positioned.fill(
          //   child: Opacity(
          //     opacity: 0.08,
          //     child: Image.asset('assets/world_map.png', fit: BoxFit.cover),
          //   ),
          // ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: size.height * 0.018,
              horizontal: size.width * 0.025,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Trip image
                ClipRRect(
                  borderRadius: BorderRadius.circular(18),
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
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          color: Color(0xFF23284E),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        date,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                          color: Color(0xFF23284E),
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        desc,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          color: Color(0xFF23284E),
                        ),
                      ),
                    ],
                  ),
                ),
                // Status badge (vertical, right side)
                Container(
                  margin: EdgeInsets.only(left: size.width * 0.02),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFBDBDBD),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.10),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Text(
                        status,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}