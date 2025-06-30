import 'package:flutter/material.dart';
import 'package:traveldates/widgets/custom_notification.dart';

// Custom SwitchListTile widget

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  // Switch states for the filter popup
  bool upcomingTrip = true;
  bool accountLogin = true;
  bool notificationAlert = true;
  bool tripCompleted = true;
  bool showFilter = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Vertical bar
          Container(width: size.width * 0.03, color: const Color(0xFF23284E)),
          // Main content
          Padding(
            padding: EdgeInsets.only(
              top: size.width * 0.09,
              left: size.height * 0.04,
              right: size.width * 0.04,
            ),
            child: Stack(
              children: [
                // Main content: ALERTS and notifications
                Column(
                  children: [
                    SizedBox(height: size.height * 0.05),
                    // ALERTS title with vector plane overlay
                    Stack(
                      children: [
                        Text(
                          "ALERTS",

                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 100,
                            color: const Color(0xFFAF9A73),
                            height: 1,
                            letterSpacing: 5,
                          ),
                        ),
                        Positioned(
                          left: size.width * 0.1,
                          top: size.height * 0.01,
                          child: Image.asset(
                            'assets/splash_screen/Vector_plane.png',

                            //  fit: BoxFit.fill,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    // Notification cards (use the custom widget)
                    const CustomNotificationCard(time: "12:56 am"),
                    const CustomNotificationCard(time: "12:56 am"),
                    const CustomNotificationCard(time: "12:56 am"),
                    const CustomNotificationCard(time: "12:56 am"),
                  ],
                ),
                // Menu icon and filter popup (absolute position)
                Positioned(
                  top: size.height * 0.01,
                  right: 0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            showFilter = !showFilter;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Image.asset(
                            'assets/document_navbar/top_icon_notification.png',
                          ),
                        ),
                      ),
                      if (showFilter)
                        Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Material(
                            elevation: 2,
                            borderRadius: BorderRadius.circular(12),
                            child: Container(
                              width: size.width * 0.33,
                              height: size.height * 0.18,
                              padding: const EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Center(
                                    child: Text(
                                      "Show the Following",
                                      style: TextStyle(
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 10,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  CustomSwitchTile(
                                    title: "Upcoming trip",
                                    value: upcomingTrip,
                                    onChanged: (val) =>
                                        setState(() => upcomingTrip = val),
                                  ),
                                  const Divider(height: 0.1, thickness: 1),
                                  CustomSwitchTile(
                                    title: "Account login",
                                    value: accountLogin,
                                    onChanged: (val) =>
                                        setState(() => accountLogin = val),
                                  ),
                                  const Divider(height: 0.1, thickness: 1),
                                  CustomSwitchTile(
                                    title: "Notification on/off",
                                    value: notificationAlert,
                                    onChanged: (val) =>
                                        setState(() => notificationAlert = val),
                                  ),
                                  const Divider(height: 0.1, thickness: 1),
                                  CustomSwitchTile(
                                    title: "Trip Completed",
                                    value: tripCompleted,
                                    onChanged: (val) =>
                                        setState(() => tripCompleted = val),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomSwitchTile extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitchTile({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: "Poppins",
            fontSize: 10,
          ), // Adjust text size here
        ),
        SizedBox(
          width: size.width * 0.07,
          height: size.height * 0.033,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Switch(
              activeColor: Colors.white,
              activeTrackColor: const Color(0xFFAF9A73),
              value: value,
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }
}
