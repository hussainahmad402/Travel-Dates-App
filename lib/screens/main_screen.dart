import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traveldates/screens/add_trip_detail.dart';
import 'package:traveldates/screens/notification_screen.dart';
import 'package:traveldates/screens/travel_document.dart';
import 'package:traveldates/screens/filter_list_view.dart'; // <-- Import your list view
import 'package:traveldates/screens/filter_grid_view.dart'; // <-- Import your grid view
import 'package:traveldates/screens/trip_main_screen.dart';
import 'package:traveldates/widgets/custom_maptrip_card.dart';
import 'package:traveldates/widgets/bottom_navigation.dart';

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

  // Add filter state here
  bool isUpcoming = true;
  bool isPast = true;

  final List<Widget> _screens = [
    const NotificationScreen(),
    const SettingsScreen(),
    
    const TravelDocumentScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Replace this with your desired navigation logic
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => MainScreen()),
        );
        return false; // Prevent default back action (app close)
      },
      child: Scaffold(
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
                // Pass filter state and callbacks
                isUpcoming: isUpcoming,
                isPast: isPast,
                onUpcomingChanged: (val) {
                  setState(() {
                    isUpcoming = val;
                  });
                },
                onPastChanged: (val) {
                  setState(() {
                    isPast = val;
                  });
                },
              )
            : _screens[_currentIndex < 2 ? _currentIndex : _currentIndex - 1],
        bottomNavigationBar: CustomBottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
              if (index != 2) showListView = false;
            });
          },
          showListView: showListView,
          showGridView: showGridView,
        ),
      ),
    );
  }
}
