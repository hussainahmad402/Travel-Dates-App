import 'package:flutter/material.dart';
import 'package:traveldates/screens/add_trip_detail.dart';
import 'package:traveldates/widgets/custom_list_card.dart';


class FilterListView extends StatelessWidget {
  const FilterListView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    // Example data for 3 cards
    final trips = [
      {
        "image": "assets/filter_images/list_filter_1.png",
        "title": "Los Angeles to Paris",
        "date": "MON, 01 NOV 2021 – SAT, 27 NOV 2021",
        "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "status": "lasted 27 Days",
      },
      {
        "image": "assets/filter_images/list_filter_2.png",
        "title": "Los Angeles to Paris",
        "date": "FRI, 03 DEC 2021 – TUE, 04 DEC 2021",
        "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "status": "lasted 27 Days",
      },
      {
        "image": "assets/filter_images/list_filter_3.png",
        "title": "Los Angeles to Paris",
        "date": "MON, 01 NOV 2021 – SAT, 27 NOV 2021",
        "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "status": "lasted 27 Days",
      },
    ];

    return Stack(
      children: [
        ListView.builder(
          padding: EdgeInsets.only(
            top: size.height * 0.02,
            bottom: size.height * 0.12, // leave space for the button if needed
          ),
          itemCount: trips.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.only(bottom: size.height * 0.025),
            child: TripListCard(
              imagePath: trips[index]["image"]!,
              title: trips[index]["title"]!,
              date: trips[index]["date"]!,
              desc: trips[index]["desc"]!,
              status: trips[index]["status"]!,
            ),
          ),
        ),
        // Plus button
       Positioned(
            right: size.width * 0.06,
          bottom: size.height * 0.04,
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
          )
      ],
    );
  }
}