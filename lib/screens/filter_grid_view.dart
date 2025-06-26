import 'package:flutter/material.dart';
import 'package:traveldates/screens/add_trip_detail.dart';
import 'package:traveldates/widgets/custom_grid_card.dart';

class FilterGridView extends StatelessWidget {
  const FilterGridView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final trips = [
      {
        "image": "assets/filter_images/list_filter_1.png",
        "title": "Los Angeles to Paris",
        "date": "MON, 01 NOV 2021 – SAT, 27 NOV 2021",
        "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "status": "lasted 27 Days",
        "badge1": "22 days Trip",
        "badge2": "In 5 Days",
      },
      {
        "image": "assets/filter_images/list_filter_2.png",
        "title": "Los Angeles to Paris",
        "date": "FRI, 03 DEC 2021 – TUE, 04 DEC 2021",
        "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "status": "lasted 27 Days",
        "badge1": "17 days Trip",
        "badge2": "In 5 Days",
      },
      {
        "image": "assets/filter_images/list_filter_3.png",
        "title": "Los Angeles to Paris",
        "date": "MON, 01 NOV 2021 – SAT, 27 NOV 2021",
        "desc": "Lorem ipsum dolor sit amet, consectetur adipiscing elit...",
        "status": "lasted 27 Days",
        "badge1": "lasted 27 Days",
        "badge2": "",
      },
      // Add more trip maps as needed
    ];

    return Stack(
      children: [
        GridView.builder(
          padding: EdgeInsets.only(
            top: size.height * 0.02,
            bottom: size.height * 0.14,
            left: size.width * 0.03,
            right: size.width * 0.03,
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: size.width * 0.02,
            mainAxisSpacing: size.height * 0.025,
            childAspectRatio: 1.1,
          ),
          itemCount: 9, // Example: 9 cards
          itemBuilder: (context, index) {
            final trip = trips[index % trips.length];
            return TripGridCard(
              imagePath: trip["image"]!,
              title: trip["title"]!,
              date: trip["date"]!,
              desc: trip["desc"]!,
              badge1: trip["badge1"] ?? "",
              badge2: trip["badge2"] ?? "",
            );
          },
        ),
        // Plus button (bottom right)
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