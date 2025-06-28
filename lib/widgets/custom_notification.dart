import 'package:flutter/material.dart';

class CustomNotificationCard extends StatelessWidget {
  final String time;
  final Color backgroundcolor;
  const CustomNotificationCard({super.key, required this.time,this.backgroundcolor=Colors.white});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
       margin: EdgeInsets.symmetric(vertical: size.height * 0.012),
      padding: EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 16,
      ),
      height: size.height  *0.12, // ≈ 82 pixels
      width: size.width * (290 / size.width), // ≈ 290 pixels
      decoration: BoxDecoration(
        
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(100),
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(left: size.width*0.04),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/document_navbar/email_icon.png'),
                SizedBox(width: size.width * 0.03),
                Text(
                  "Lorem Ipsum is simply dummy text of\n the printing and typesetting industry.",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:   EdgeInsets.only(left:size.width*0.4),
            child: Text(
              time,
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.bold,
                fontSize: 10,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
