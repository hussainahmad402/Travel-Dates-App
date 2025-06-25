import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traveldates/screens/add_trip_detail.dart';
import 'package:traveldates/screens/notification_screen.dart';
import 'package:traveldates/screens/travel_document.dart';
import 'package:traveldates/screens/filter_list_view.dart'; // <-- Import your list view
import 'package:traveldates/screens/filter_grid_view.dart'; // <-- Import your grid view

import 'profile_screen.dart';
import 'settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 2;
  bool showListView = false;
  bool showGridView = false;

  final List<Widget> _screens = [
    const NotificationScreen(),
    const SettingsScreen(),
    // TripsScreen is handled separately
    const TravelDocumentScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentIndex == 2
          ? TripsScreen(
              showListView: showListView,
              showGridView: showGridView,
              onToggleList: () {
                setState(() {
                  showListView = !showListView;
                  if (showListView) showGridView = false;
                });
              },
              onToggleGrid: () {
                setState(() {
                  showGridView = !showGridView;
                  if (showGridView) showListView = false;
                });
              },
            )
          : _screens[_currentIndex < 2 ? _currentIndex : _currentIndex - 1],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF23284E),
        selectedItemColor: const Color(0xffAF9A73),
        unselectedItemColor: Colors.white70,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            if (index != 2) showListView = false; // Reset to map when leaving Trips
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications, size: 32),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings, size: 32),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.location_on_outlined, size: 38),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.copy, size: 32),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_remove_alt_1_outlined, size: 32),
            label: '',
          ),
        ],
      ),
    );
  }
}

class TripsScreen extends StatelessWidget {
  final bool showListView;
  final bool showGridView;
  final VoidCallback onToggleList;
  final VoidCallback onToggleGrid;
  const TripsScreen({super.key, this.showListView = false, this.showGridView = false, required this.onToggleList, required this.onToggleGrid});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          width: size.width * 0.025,
          height: size.height,
          child: Container(color: const Color(0xFF23284E)),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            // TRIPS text
            Positioned(
              top: size.height * 0.05,
              left: size.width * 0.17,
              child: Text(
                "TRIPS",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: size.width * 0.3,
                  color: const Color(0xFFAF9A73),
                  height: 1,
                ),
              ),
            ),
            // Vector plane overlay
            Positioned(
              top: size.height * 0.09,
              left: size.width * 0.23,
              right: size.width * 0.23,
              child: Image.asset(
                'assets/splash_screen/Vector_plane.png',
                fit: BoxFit.fill,
                height: size.height * 0.04,
              ),
            ),
          ],
        ),
        Positioned(
          top: size.height * 0.19,
          left: size.width * 0.025,
          child: FilterBar(
            size: size,
            onListTap: onToggleList,
            onGridTap: onToggleGrid,
            showListView: showListView,
            showGridView: showGridView,
          ),
        ),
        Positioned(
          top: size.height * 0.25,
          left: size.width * 0.025,
          width: size.width * 0.97,
          height: size.height * 0.65,
          child: showListView
              ? const FilterListView()
              : showGridView
                  ? const FilterGridView()
                  : ClipRRect(
                      child: GoogleMap(
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(59.3293, 18.0686),
                          zoom: 12,
                        ),
                        markers: {
                          Marker(
                            markerId: const MarkerId('1'),
                            position: const LatLng(59.3293, 18.0686),
                            infoWindow: const InfoWindow(title: 'Trip 1'),
                          ),
                          Marker(
                            markerId: const MarkerId('2'),
                            position: const LatLng(59.3393, 18.0586),
                            infoWindow: const InfoWindow(title: 'Trip 2'),
                          ),
                        },
                        myLocationEnabled: false,
                        zoomControlsEnabled: false,
                      ),
                    ),
        ),
        // Floating "+" button above the map or list
        if (!showListView && !showGridView)
          Positioned(
            top: size.height * 0.85,
            left: size.width / 2 - 32,
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => AddTripDetailScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.18),
                      blurRadius: 18,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 32,
                  backgroundColor: const Color(0xFF23284E),
                  child: const Icon(Icons.add, color: Colors.white, size: 32),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class FilterBar extends StatefulWidget {
  final Size size;
  final VoidCallback onListTap;
  final VoidCallback onGridTap;
  final bool showListView;
  final bool showGridView;
  const FilterBar({required this.size, required this.onListTap, required this.onGridTap, required this.showListView, required this.showGridView, super.key});

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  bool isUpcoming = true;
  bool isPast = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.size.width * 0.98,
      height: widget.size.height * 0.055,
      decoration: BoxDecoration(
        color: const Color(0xFF23284E),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          filterCheckbox("Upcoming", isUpcoming, (val) {
            setState(() {
              isUpcoming = val;
              if (val) isPast = false;
            });
          }),
          const SizedBox(width: 12),
          filterCheckbox("Past", isPast, (val) {
            setState(() {
              isPast = val;
              if (val) isUpcoming = false;
            });
          }),
          const SizedBox(width: 12),
          const Icon(Icons.filter_list, color: Colors.white, size: 20),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Text(
              "Year",
              style: TextStyle(
                color: Color(0xFF23284E),
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          const Spacer(),
          const Icon(Icons.south_america_sharp, color: Color(0xFFAF9A73), size: 22),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: widget.onGridTap,
            child: Icon(
              Icons.grid_view,
              color: widget.showGridView ? const Color(0xFFAF9A73) : Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: widget.onListTap,
            child: Icon(
              Icons.format_list_bulleted,
              color: widget.showListView ? const Color(0xFFAF9A73) : Colors.white,
              size: 22,
            ),
          ),
          const SizedBox(width: 12),
        ],
      ),
    );
  }

  Widget filterCheckbox(String label, bool selected, Function(bool) onChanged) {
    return GestureDetector(
      onTap: () => onChanged(!selected),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: selected ? const Color(0xFFAF9A73) : Colors.transparent,
              border: Border.all(
                color: const Color(0xFFAF9A73),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(3),
            ),
            child: selected
                ? const Icon(Icons.check, size: 16, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
    );
  }
}