import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get_storage/get_storage.dart';
import 'package:traveldates/screens/map_picker.dart';
import 'package:traveldates/widgets/custom_textfields.dart';
import 'package:traveldates/widgets/bottom_navigation.dart'; // Import your custom navbar
// import 'package:traveldates/widgets/location_picker.dart'; // Import the location picker widget
import 'package:google_maps_flutter/google_maps_flutter.dart'; // Import LatLng
import 'package:file_picker/file_picker.dart'; // Import FilePicker
import 'package:google_fonts/google_fonts.dart';

class AddTripDetailScreen extends StatefulWidget {
  const AddTripDetailScreen({super.key});

  @override
  State<AddTripDetailScreen> createState() => _AddTripDetailScreenState();
}

class _AddTripDetailScreenState extends State<AddTripDetailScreen> {
  DateTime? startDate;
  DateTime? endDate;
  LatLng? _origin; // Add this line
  LatLng? _destination; // Add this line
  String? _destinationText;
  String? _originText;

  final _originController = TextEditingController();
  final _destinationController = TextEditingController();
  final _shortDescController = TextEditingController();
  final _longDescController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadDraft(); // ✅ Load draft data when screen opens
  }

  void _loadDraft() {
    final box = GetStorage();
    final draft = box.read("draftTrip");

    if (draft != null) {
      _originController.text = draft["origin"] ?? "";
      _destinationController.text = draft["destination"] ?? "";
      _shortDescController.text = draft["short_description"] ?? "";
      _longDescController.text = draft["long_description"] ?? "";

      if (draft["origin_lat"] != null && draft["origin_lng"] != null) {
        _origin = LatLng(draft["origin_lat"], draft["origin_lng"]);
      }

      if (draft["destination_lat"] != null &&
          draft["destination_lng"] != null) {
        _destination = LatLng(
          draft["destination_lat"],
          draft["destination_lng"],
        );
      }

      if (draft["start_date"] != "") {
        startDate = DateTime.parse(draft["start_date"]);
      }
      if (draft["end_date"] != "") {
        endDate = DateTime.parse(draft["end_date"]);
      }
    }
  }

  Future<void> _pickDate(BuildContext context, bool isStart) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: const ColorScheme.light(
            primary: Color(0xFF23284E),
            onPrimary: Colors.white,
            onSurface: Colors.black,
          ),
          dialogBackgroundColor: Colors.white,
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startDate = picked;
        } else {
          endDate = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Stack(
        children:[
          Positioned(
          left: 0,
          top: 0,
          width: size.width * 0.03,
          height: size.height,
          child: Container(color: const Color(0xFF23284E)),
        ),
           Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.07,
            vertical: size.height * 0.06,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add Trip",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w600,
                  fontSize: 26,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: size.height * 0.025),
              const Divider(height: 0.1, thickness: 2, color: Colors.black),
              // Origin
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text("Origin:"),
                  GestureDetector(
                    onTap: () async {
                      // Open the map picker and wait for result
                      final picked = await Navigator.push<LatLng>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationPicker(
                            onLocationSelected: (latLng) {
                              Navigator.pop(context, latLng);
                            },
                          ),
                        ),
                      );
                      if (picked != null) {
                        try {
                          List<Placemark> placemarks =
                              await placemarkFromCoordinates(
                                picked.latitude,
                                picked.longitude,
                              );
        
                          if (placemarks.isNotEmpty) {
                            Placemark place = placemarks.first;
                            final fullAddress =
                                "${place.locality ?? 'Unknown'}, "
                                "${place.administrativeArea ?? ''}, "
                                "${place.country ?? ''}";
                            setState(() {
                              _origin = picked;
                              _originText = fullAddress;
                              _originController.text =
                                  fullAddress; // ✅ Updates the field!
                            });
                          }
                        } catch (e) {
                          print("Geocoding error: $e");
                          setState(() {
                            _origin = picked;
                            _originText = "Error getting location";
                            _originController.text =
                                "Error getting location"; // ✅ Updates the field!
                          });
                        }
                      }
                    },
                    child: AbsorbPointer(
                      child: CustomTextFormField(
                        label: "Origin:",
                        controller: _originController,
                        // hintText: "Tap to select location",
                      ),
                    ),
                  ),
                  // if (_origin != null)
                  //   Text(
                  //     'Selected: ${_origin!.latitude}, ${_origin!.longitude}',
                  //   ),
                ],
              ),
              SizedBox(height: size.height * 0.02),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // const Text("Origin:"),
                  GestureDetector(
                    onTap: () async {
                      // Open the map picker and wait for result
                      final picked = await Navigator.push<LatLng>(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LocationPicker(
                            onLocationSelected: (latLng) {
                              Navigator.pop(context, latLng);
                            },
                          ),
                        ),
                      );
                      if (picked != null) {
                        try {
                          List<Placemark> placemarks =
                              await placemarkFromCoordinates(
                                picked.latitude,
                                picked.longitude,
                              );
        
                          if (placemarks.isNotEmpty) {
                            Placemark place = placemarks.first;
                            final fullAddress =
                                "${place.locality ?? 'Unknown'}, "
                                "${place.administrativeArea ?? ''}, "
                                "${place.country ?? ''}";
                            setState(() {
                              _destination = picked;
                              _destinationText = fullAddress;
                              _destinationController.text =
                                  fullAddress; // ✅ Updates the field!
                            });
                          }
                        } catch (e) {
                          print("Geocoding error: $e");
                          setState(() {
                            _destination = picked;
                            _destinationText = "Error getting location";
                            _destinationController.text =
                                "Error getting location"; // ✅ Updates the field!
                          });
                        }
                      }
                    },
                    child: AbsorbPointer(
                      child: CustomTextFormField(
                        label: "Destination:",
                        controller: _destinationController,
                        // hintText: "Tap to select location",
                      ),
                    ),
                  ),
                  // if (_destination != null)
                  //   Text(
                  //     'Selected: ${_destination!.latitude}, ${_destination!.longitude}',
                  //   ),
                ],
              ),
              // SizedBox(height: size.height * 0.02),
              // Start Date
              GestureDetector(
                onTap: () => _pickDate(context, true),
                child: AbsorbPointer(
                  child: CustomTextFormField(
                    label: "Start Date:",
                    controller: TextEditingController(
                      text: startDate == null
                          ? ""
                          : "${startDate!.day}/${startDate!.month}/${startDate!.year}",
                    ),
                  ),
                ),
              ),
              // SizedBox(height: size.height * 0.02),
              // End Date
              GestureDetector(
                onTap: () => _pickDate(context, false),
                child: AbsorbPointer(
                  child: CustomTextFormField(
                    label: "End Date:",
                    controller: TextEditingController(
                      text: endDate == null
                          ? ""
                          : "${endDate!.day}/${endDate!.month}/${endDate!.year}",
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              CustomTextFormField(
                label: "Short Description:",
                controller: _shortDescController,
              ),
              SizedBox(height: size.height * 0.02),
              CustomTextFormField(
                label: "Detailed Description:",
                controller: _longDescController,
              ),
              SizedBox(height: size.height * 0.02),
              // Upload and buttons row
              SizedBox(height: size.height * 0.02),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // Left side: Labels and icons
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Add Documents:",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: size.height * 0.008),
                        GestureDetector(
                          onTap: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: [
                                    'pdf',
                                    'doc',
                                    'docx',
                                    'txt',
                                  ], // limits to documents
                                );
                            if (result != null) {
                              final file = result.files.single;
                              // Handle the picked file here
                            }
                          },
                          child:Image.asset('assets/document_navbar/upload_icon.png',)
                        ),
        
                        SizedBox(height: size.height * 0.018),
                        const Text(
                          "Add Images:",
                          style: TextStyle(
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w400,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: size.height * 0.008),
                        GestureDetector(
                          onTap: () async {
                            FilePickerResult? result = await FilePicker.platform
                                .pickFiles(type: FileType.image);
                            if (result != null) {
                              // Handle the picked image file
                              final file = result.files.single;
                              // You can save or display the image as needed
                            }
                          },
                          child: Image.asset('assets/document_navbar/upload_icon.png',)
                        ),
                      ],
                    ),
                  ),
                  // Right side: Buttons
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFAF9A73),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          padding: EdgeInsets.symmetric(
                            vertical: size.height * 0.012,
                            horizontal: size.width * 0.08,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: size.height * 0.01),
                      TextButton(
                        onPressed: () {
                          final box = GetStorage();
                          final previousDraft = box.read("draftTrip") ?? {};
        
                          final draftTrip = {
                            "origin":
                                _originText ?? previousDraft["origin"] ?? "",
                            "origin_lat":
                                _origin?.latitude ??
                                previousDraft["origin_lat"],
                            "origin_lng":
                                _origin?.longitude ??
                                previousDraft["origin_lng"],
                            "destination":
                                _destinationText ??
                                previousDraft["destination"] ??
                                "",
                            "destination_lat":
                                _destination?.latitude ??
                                previousDraft["destination_lat"],
                            "destination_lng":
                                _destination?.longitude ??
                                previousDraft["destination_lng"],
                            "start_date":
                                startDate?.toIso8601String() ??
                                previousDraft["start_date"] ??
                                "",
                            "end_date":
                                endDate?.toIso8601String() ??
                                previousDraft["end_date"] ??
                                "",
                            "short_description":
                                _shortDescController.text.isNotEmpty
                                ? _shortDescController.text
                                : previousDraft["short_description"] ?? "",
                            "long_description":
                                _longDescController.text.isNotEmpty
                                ? _longDescController.text
                                : previousDraft["long_description"] ?? "",
                          };
        
                          box.write("draftTrip", draftTrip);
        
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              
                              content: Text("Trip saved as draft."),
                            ),
                          );
                        },
        
                        child: const Text(
                          "Save as draft",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: Color(0xFF23284E),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),]
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: 2, // highlight the Trips tab
        onTap: (index) {
          Navigator.of(context).pop(); // or use your navigation logic
        },
        // showListView: false,
        // showGridView: false,
        // isAddTrip: false,
      ),
    );
  }
}
