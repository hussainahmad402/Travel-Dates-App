import 'package:flutter/material.dart';

class MapTripCard extends StatelessWidget {
  final String title;
  final String date;
  final String desc;
  final String badge1;
  final String badge2;
  final String status;

  const MapTripCard({
    super.key,
    required this.title,
    required this.date,
    required this.desc,
    required this.badge1,
    required this.badge2,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return _CustomCardContainer(
      width: size.width * 0.6,
      height: size.height * 0.19,
      borderRadius: 18,
      backgroundImage: const AssetImage('assets/document_navbar/2.png'),
      overlayColor: Colors.black.withAlpha(100),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withAlpha(80),
          blurRadius: 8,
          offset: const Offset(0, 4),
        ),
      ],
      child: Padding(
        padding: EdgeInsets.all(size.width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Top badges row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (badge1.isNotEmpty)
                  _CustomBadgeContainer(
                    text: badge1,
                    color: const Color(0xFFAF9A73),
                    borderRadius: 12,
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.07,
                      vertical: size.height * 0.01,
                    ),
                    fontSize: size.width * 0.023,
                  ),
                if (badge2.isNotEmpty) ...[
                  SizedBox(width: size.width * 0.02),
                  _CustomBadgeContainer(
                    text: badge2,
                    color: const Color(0xFF23284E),
                    borderRadius: 12,
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.04,
                      vertical: size.height * 0.01,
                    ),
                    fontSize: size.width * 0.023,
                  ),
                ],
              ],
            ),
            SizedBox(height: size.height * 0.009 ),
            Text(
              title,
              textAlign: TextAlign.center,
              style:  TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700,
                fontSize: size.width * 0.049,
                color: Colors.white,
              ),
            ),
            // const SizedBox(height: 2),
            Text(
              date,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w600,
                fontSize: size.width * 0.023,
                color: Colors.white,
              ),
            ),
            // const SizedBox(height: 4),
            Text(
              desc,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: "Poppins",
                fontWeight: FontWeight.w400,
                fontSize: size.width * 0.029,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CustomCardContainer extends StatelessWidget {
  final double width;
  final double height;
  final double borderRadius;
  final ImageProvider backgroundImage;
  final Color overlayColor;
  final List<BoxShadow> boxShadow;
  final Widget child;

  const _CustomCardContainer({
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.backgroundImage,
    required this.overlayColor,
    required this.boxShadow,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        image: DecorationImage(
          image: backgroundImage,
          fit: BoxFit.fitWidth,
        ),
        boxShadow: boxShadow,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(borderRadius),
          color: overlayColor,
        ),
        child: child,
      ),
    );
  }
}

class _CustomBadgeContainer extends StatelessWidget {
  final String text;
  final Color color;
  final double borderRadius;
  final EdgeInsets padding;
  final double fontSize;

  const _CustomBadgeContainer({
    required this.text,
    required this.color,
    required this.borderRadius,
    required this.padding,
    required this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: fontSize,
          fontFamily: "Poppins",
        ),
      ),
    );
  }
}