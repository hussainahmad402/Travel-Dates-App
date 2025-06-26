import 'package:flutter/material.dart';
import 'package:traveldates/screens/add_trip_detail.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final bool showListView;
  final bool showGridView;
  final bool isAddTrip;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.showListView = false,
    this.showGridView = false,
    this.isAddTrip = false
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.11,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Curved background
          Positioned.fill(
            child: CustomPaint(
              painter: _NavBarPainter(),
            ),
          ),
          // Centered "+" button (only for index 2 and not in list/grid view)
          if (currentIndex == 2 && !showListView && !showGridView || !isAddTrip)
            Positioned(
              top: -size.width * 0.07, // Pull up above the curve
              left: size.width * 0.42,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AddTripDetailScreen()),
                  );
                },
                child: Container(
                  width: size.width * 0.16,
                  height: size.width * 0.14,
                  decoration: BoxDecoration(
                    color: const Color(0xFF23284E),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(100),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Icon(Icons.add, color: Colors.white, size: 36),
                  ),
                ),
              ),
            ),
          // Navigation icons
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _NavBarIcon(
                  icon: Icons.notifications,
                  selected: currentIndex == 0,
                  onTap: () => onTap(0),
                  size: size.width * 0.07,
                  showDot: true,
                  selectedColor: const Color(0xFFAF9A73),
                ),
                _NavBarIcon(
                  icon: Icons.settings,
                  selected: currentIndex == 1,
                  onTap: () => onTap(1),
                  size: size.width * 0.07,
                  selectedColor: const Color(0xFFAF9A73),
                ),
                SizedBox(width: size.width * 0.18), // Space for the plus button
                _NavBarIcon(
                  icon: Icons.copy,
                  selected: currentIndex == 3,
                  onTap: () => onTap(3),
                  size: size.width * 0.07,
                  selectedColor: const Color(0xFFAF9A73),
                ),
                _NavBarIcon(
                  icon: Icons.person,
                  selected: currentIndex == 4,
                  onTap: () => onTap(4),
                  size: size.width * 0.07,
                  selectedColor: const Color(0xFFAF9A73),
                ),
              ],
            ),
          ),
          // Center icon (location) under the plus button
          Positioned(
            bottom: size.height * 0.03,
            left: size.width / 2 - size.width * 0.045,
            child: _NavBarIcon(
              icon: Icons.location_on_outlined,
              selected: currentIndex == 2,
              onTap: () => onTap(2),
              size: size.width * 0.09,
              selectedColor: const Color(0xFFAF9A73),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavBarIcon extends StatelessWidget {
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  final double size;
  final Color selectedColor;
  final bool showDot;

  const _NavBarIcon({
    required this.icon,
    required this.selected,
    required this.onTap,
    required this.size,
    this.selectedColor = Colors.white,
    this.showDot = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Icon(
            icon,
            size: size,
            color: selected ? selectedColor : Colors.white,
          ),
          if (showDot)
            Positioned(
              right: 2,
              top: 2,
              child: Container(
                width: size * 0.22,
                height: size * 0.22,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _NavBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF23284E)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(
      size.width * 0.20, size.height * 0.20, // left curve down
      size.width * 0.5, size.height * 0.2,  // center lowest point
    );
    path.quadraticBezierTo(
      size.width * 0.8, size.height * 0.20, // right curve up
      size.width,0 ,                         // right top
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}