import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationPicker extends StatefulWidget {
  final Function(LatLng) onLocationSelected;

  const LocationPicker({super.key, required this.onLocationSelected});

  @override
  State<LocationPicker> createState() => _LocationPickerState();
}

class _LocationPickerState extends State<LocationPicker> {
  LatLng? _pickedLocation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(37.7749, -122.4194), // Default to San Francisco
          zoom: 10,
        ),
        onTap: (latLng) {
          setState(() {
            _pickedLocation = latLng;
          });
          widget.onLocationSelected(latLng);
        },
        markers: _pickedLocation != null
            ? {
                Marker(
                  markerId: const MarkerId('picked'),
                  position: _pickedLocation!,
                )
              }
            : {},
      ),
    );
  }
}