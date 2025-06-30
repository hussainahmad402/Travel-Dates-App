import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:traveldates/screens/add_trip_detail.dart';
import 'package:traveldates/screens/filter_grid_view.dart';
import 'package:traveldates/screens/filter_list_view.dart';
import 'package:traveldates/widgets/custom_grid_card.dart';
import 'package:traveldates/widgets/custom_maptrip_card.dart';

class TripsScreen extends StatefulWidget {
  final bool showListView;
  final bool showGridView;
  final VoidCallback onToggleList;
  final VoidCallback onToggleGrid;
  final bool isUpcoming;
  final bool isPast;
  final ValueChanged<bool> onUpcomingChanged;
  final ValueChanged<bool> onPastChanged;
  final List<LatLng> markerLocations = [
    LatLng(59.3293, 18.0686),
    LatLng(59.3393, 18.0786),
    LatLng(59.3193, 18.0886),
  ];

  TripsScreen({
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
  State<TripsScreen> createState() => _TripsScreenState();
}

class _TripsScreenState extends State<TripsScreen> {
  late BitmapDescriptor customIcon;
  final List<LatLng> markerLocations = [
    LatLng(59.3293, 18.0686), // Central Stockholm
    LatLng(59.3305, 18.0708),
    LatLng(59.3317, 18.0724),
    LatLng(59.3270, 18.0672),
    LatLng(59.3260, 18.0690),
    LatLng(59.3285, 18.0655),
    LatLng(59.3322, 18.0680),
    LatLng(59.3299, 18.0715),
    LatLng(59.3279, 18.0633),
    LatLng(59.3256, 18.0668),
    LatLng(59.3300, 18.0622), //
  ];

  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _loadCustomMarker();
  }

  void _loadCustomMarker() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(),
      'assets/document_navbar/pin_point_map.png',
    );

    Set<Marker> newMarkers = {};

    for (int i = 0; i < markerLocations.length; i++) {
      newMarkers.add(
        Marker(
          markerId: MarkerId('marker_$i'),
          position: markerLocations[i],
          icon: customIcon,
          infoWindow: InfoWindow(title: 'Location ${i + 1}'),
        ),
      );
    }

    setState(() {
      _markers = newMarkers;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
       
        Positioned(
          top: size.height * 0.08,
          left: size.width * 0.2,
          right: 0,
          child: Text(
            "TRIPS",
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 115,
              color: const Color(0xFFAF9A73),
              height: 1,
            ),
          ),
        ),
        // Vector plane overlay
        Positioned(
          top: size.height * 0.1,
          left: size.width * 0.1,
          right: 0,
          child: Image.asset(
            'assets/splash_screen/Vector_plane.png',
            fit: BoxFit.contain,
            width: size.width * 0.63, // ≈ 243 pixels
            height: size.height * 0.07,
          ),
        ),
        Positioned(
          top: size.height * 0.23,
          left: size.width * 0.025,
          right: 0,
          child: FilterBar(
            size: size,
            onListTap: widget.onToggleList,
            onGridTap: widget.onToggleGrid,
            showListView: widget.showListView,
            showGridView: widget.showGridView,
            isUpcoming: widget.isUpcoming,
            isPast: widget.isPast,
            onUpcomingChanged: widget.onUpcomingChanged,
            onPastChanged: widget.onPastChanged,
          ),
        ),
        Positioned(
          top: size.height * 0.26,
          left: size.width * 0.025,
          width: size.width * 0.97,
          height: size.height * 0.65,
          child: widget.showListView
              ? const FilterListView()
              : widget.showGridView
              ? const FilterGridView()
              : ClipRRect(
                  borderRadius: BorderRadius.circular(18),
                  child: GoogleMap(
                    markers: _markers,
                    initialCameraPosition: const CameraPosition(
                      target: LatLng(59.3293, 18.0686),
                      zoom: 16,
                    ),
                    myLocationEnabled: false,
                    zoomControlsEnabled: false,
                  ),
                ),
        ),
        // Only show MapTripCards if neither list nor grid view is active
        if (!widget.showListView && !widget.showGridView && widget.isPast)
          Positioned(
            left: size.width * 0.4,
            top: size.width * 0.9,
            child: TripGridCard(
              imagePath: 'assets/document_navbar/4.png',
              title: "Los Angeles to Paris",
              date: "MON, 01 NOV 2021 – SAT, 27 NOV 2021",
              desc: "Lorem ipsum dolor sit amet\n consectetur...",
              badge1: "lasted 27 Days",
              badge2: "",
              status: "Past",
            ),
          ),
        if (!widget.showListView && !widget.showGridView && widget.isUpcoming)
          Positioned(
            left: size.width * 0.3,
            top: size.width * 1.4,
            child: TripGridCard(
              imagePath: 'assets/document_navbar/4.png',
              title: "Los Angeles to Paris",
              date: "FRI, 03 Dec 2021- TUE,04 DEC 2021",
              desc: "Lorem ipsum dolor sit amet\n consectetur...",
              badge1: "32 days Trip",
              badge2: "In 5 Days",
              status: "Upcoming",
            ),
          ),
          Positioned(
          left: 0,
          top: 0,
          width: size.width * 0.03,
          height: size.height,
          child: Container(color: const Color(0xFF23284E)),
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
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.031, // ≈ 25 pixels
      width: size.width * 0.99, // ≈ 351 pixels
      decoration: BoxDecoration(
        color: const Color(0xFF23284E),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4),
        ],
      ),
      child: Row(
        children: [
          const SizedBox(width: 8),
          filterCheckbox(
            "Upcoming",
            widget.isUpcoming,
            widget.onUpcomingChanged,
          ),
          const SizedBox(width: 12),
          filterCheckbox("Past", widget.isPast, widget.onPastChanged),
          const SizedBox(width: 12),
          const Icon(Icons.filter_list, color: Colors.white, size: 17),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(3),
            ),
            child: const Text(
              "Year",
              style: TextStyle(
                color: Color(0xFF23284E),
                fontWeight: FontWeight.w500,
                fontSize: 10,
              ),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.south_america_sharp,
            color: Color(0xFFAF9A73),
            size: 17,
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: widget.onGridTap,
            child: Icon(
              Icons.grid_view,
              color: widget.showGridView
                  ? const Color(0xFFAF9A73)
                  : Colors.white,
              size: 17,
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: widget.onListTap,
            child: Icon(
              Icons.format_list_bulleted,
              color: widget.showListView
                  ? const Color(0xFFAF9A73)
                  : Colors.white,
              size: 17,
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
            width: 14, // Decreased from 20
            height: 14, // Decreased from 20
            decoration: BoxDecoration(
              color: selected ? const Color(0xFFAF9A73) : Colors.transparent,
              border: Border.all(
                color: const Color(0xFFAF9A73),
                width: 1.5,
              ), // Slightly thinner border
              borderRadius: BorderRadius.circular(2), // Slightly less rounded
            ),
            child: selected
                ? const Icon(
                    Icons.check,
                    size: 10,
                    color: Colors.white,
                  ) // Smaller check icon
                : null,
          ),
          const SizedBox(width: 4), // Slightly less spacing
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
            ), // Smaller font
          ),
        ],
      ),
    );
  }
}
