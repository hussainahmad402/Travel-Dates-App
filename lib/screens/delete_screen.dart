import 'package:flutter/material.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  bool isChecked = false;
  bool isObscure = true;
  final TextEditingController otpController = TextEditingController();

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
            height: size.height,
            color: const Color(0xFF23284E),
          ),
          // Main content
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.06,
                  vertical: size.width * 0.06,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back arrow
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back, size: size.width * 0.08),
                    ),

                    SizedBox(height: size.height * 0.04),
                    // Title
                    const Text(
                      "Delete Account",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    // Subtitle
                    const Text(
                      "Please Enter the Code recieved in your email",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 15,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: size.height * 0.025),
                    // OTP Field
                    TextField(
                      controller: otpController,
                      obscureText: isObscure,
                      decoration: InputDecoration(
                        labelText: "OTP",
                        labelStyle: const TextStyle(
                          color: Colors.black38,
                          fontFamily: "Poppins",
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isObscure ? Icons.visibility : Icons.visibility_off,
                            color: Colors.black54,
                          ),
                          onPressed: () {
                            setState(() {
                              isObscure = !isObscure;
                            });
                          },
                        ),
                        enabledBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black26),
                        ),
                        focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.black54),
                        ),
                      ),
                      style: const TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(height: 4),
                    // Resend
                    Row(
                      children: [
                        const Text(
                          "Didn't Received?",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(width: 6),
                        GestureDetector(
                          onTap: () {
                            // Handle resend
                          },
                          child: const Text(
                            "RESEND",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 12,
                              color: Color(0xFF23284E),
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    // Are you sure text
                    const Text(
                      "Are you sure to Delete your account permanently?",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: size.height * 0.015),
                    // Checkbox and warning
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Checkbox(
                          value: isChecked,
                          onChanged: (val) {
                            setState(() {
                              isChecked = val ?? false;
                            });
                          },
                          activeColor: const Color(0xFF23284E),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                        ),
                        Expanded(
                          child: const Text(
                            "I understand that by deleting my account, all trip information, including my trip data, will be permanently deleted. This cannot be undone, and my data cannot be recovered.",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.03),
                    // Delete button
                    Center(
                      child: SizedBox(
                        width: size.width * 0.4,
                        child: ElevatedButton(
                          onPressed: isChecked
                              ? () {
                                  // Handle delete account
                                }
                              : null,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(
                              0xFF23284E,
                            ).withOpacity(isChecked ? 1 : 0.4),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6),
                            ),
                            elevation: 0,
                          ),
                          child: const Text(
                            "Delete account",
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
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
