import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traveldates/screens/add_trip_detail.dart';
import 'package:traveldates/screens/filter_grid_view.dart';
import 'package:traveldates/screens/filter_list_view.dart';
import 'package:traveldates/widgets/custom_maptrip_card.dart';

class TripsScreen extends StatelessWidget {
  final bool showListView;
  final bool showGridView;
  final VoidCallback onToggleList;
  final VoidCallback onToggleGrid;
  final bool isUpcoming;
  final bool isPast;
  final ValueChanged<bool> onUpcomingChanged;
  final ValueChanged<bool> onPastChanged;

  const TripsScreen({
    super.key,
    this.showListView = false,
    this.showGridView = false,
    required this.onToggleList,
    required this.onToggleGrid,
    required this.isUpcoming,
    required this.isPast,
    required this.onUpcomingChanged,
    required this.onPastChanged,
  });

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
              top: size.height * 0.06,
              left: size.width * 0.17,
              child: Text(
                "TRIPS",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: size.width * 0.2,
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
            isUpcoming: isUpcoming,
            isPast: isPast,
            onUpcomingChanged: onUpcomingChanged,
            onPastChanged: onPastChanged,
          ),
        ),
        Positioned(
          top: size.height * 0.26,
          left: size.width * 0.025,
          width: size.width * 0.97,
          height: size.height * 0.65,
          child: showListView
              ? const FilterListView()
              : showGridView
                  ? const FilterGridView()
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: GoogleMap(
                        initialCameraPosition: const CameraPosition(
                          target: LatLng(59.3293, 18.0686),
                          zoom: 12,
                        ),
                        myLocationEnabled: false,
                        zoomControlsEnabled: false,
                      ),
                    ),
        ),
        // Only show MapTripCards if neither list nor grid view is active
        if (!showListView && !showGridView && isPast)
          Positioned(
            left: size.width * 0.3,
            top: size.width * 1.3,
            child: MapTripCard(
              title: "Los Angeles to Paris",
              date: "MON, 01 NOV 2021 – SAT, 27 NOV 2021",
              desc: "Lorem ipsum dolor sit amet, consectetur...",
              badge1: "lasted 27 Days",
              badge2: "",
              status: "Past",
            ),
          ),
        if (!showListView && !showGridView && isUpcoming)
          Positioned(
            left: size.width * 0.2,
            top: size.width * 0.9,
            child: MapTripCard(
              title: "Los Angeles to Paris",
              date: "FRI, 03 DEC 2021 – TUE, 04 DEC 2021",
              desc: "Lorem ipsum dolor sit amet, consectetur...",
              badge1: "32 days Trip",
              badge2: "In 5 Days",
              status: "Upcoming",
            ),
          ),
      ],
    );
  }
}

// Update FilterBar to accept filter state and callbacks
class FilterBar extends StatefulWidget {
  final Size size;
  final VoidCallback onListTap;
  final VoidCallback onGridTap;
  final bool showListView;
  final bool showGridView;
  final bool isUpcoming;
  final bool isPast;
  final ValueChanged<bool> onUpcomingChanged;
  final ValueChanged<bool> onPastChanged;

  const FilterBar({
    required this.size,
    required this.onListTap,
    required this.onGridTap,
    required this.showListView,
    required this.showGridView,
    required this.isUpcoming,
    required this.isPast,
    required this.onUpcomingChanged,
    required this.onPastChanged,
    super.key,
  });

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
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
          filterCheckbox("Upcoming", widget.isUpcoming, widget.onUpcomingChanged),
          const SizedBox(width: 12),
          filterCheckbox("Past", widget.isPast, widget.onPastChanged),
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

