import 'package:flutter/material.dart';
import 'package:traveldates/widgets/custom_notification.dart';

// Custom SwitchListTile widget
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
    return SwitchListTile(
      activeColor: Colors.white,
      activeTrackColor: const Color(0xFFAF9A73),
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: const TextStyle(fontFamily: "Poppins", fontSize: 13),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}

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
      body: Row(
        children: [
          // Vertical bar
          Container(
            width: size.width * 0.03,
            color: const Color(0xFF23284E),
          ),
          // Main content
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06,
                  vertical: size.height * 0.03,
                ),
                child: Stack(
                  children: [
                    // Main content: ALERTS and notifications
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.05),
                        // ALERTS title with vector plane overlay
                        Stack(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: size.height * 0.01, left: size.width * 0.03),
                              child: Text(
                                "ALERTS",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontWeight: FontWeight.w400,
                                  fontSize: size.width * 0.23,
                                  color: const Color(0xFFAF9A73),
                                  height: 1,
                                  letterSpacing: 2,
                                ),
                              ),
                            ),
                            Positioned(
                              top: size.height * 0.04,
                              left: size.width * 0.18,
                              right: size.width * 0.18,
                              child: Image.asset(
                                'assets/splash_screen/Vector_plane.png',
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
                      top: 0,
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
                              child: Icon(Icons.menu_open_outlined, size: size.width * 0.08, color: Colors.black87),
                            ),
                          ),
                          if (showFilter)
                            Padding(
                              padding: const EdgeInsets.only(top: 8),
                              child: Material(
                                elevation: 8,
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  width: size.width * 0.46,
                                  padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Show the Following",
                                        style: TextStyle(
                                          fontFamily: "Poppins",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      CustomSwitchTile(
                                        title: "Upcoming trip",
                                        value: upcomingTrip,
                                        onChanged: (val) => setState(() => upcomingTrip = val),
                                      ),
                                      const Divider(height: 1, thickness: 1),
                                      CustomSwitchTile(
                                        title: "Account login",
                                        value: accountLogin,
                                        onChanged: (val) => setState(() => accountLogin = val),
                                      ),
                                      const Divider(height: 1, thickness: 1),
                                      CustomSwitchTile(
                                        title: "Notification on/off",
                                        value: notificationAlert,
                                        onChanged: (val) => setState(() => notificationAlert = val),
                                      ),
                                      const Divider(height: 1, thickness: 1),
                                      CustomSwitchTile(
                                        title: "Trip Completed",
                                        value: tripCompleted,
                                        onChanged: (val) => setState(() => tripCompleted = val),
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
            ),
          ),
        ],
      ),
    );
  }
}