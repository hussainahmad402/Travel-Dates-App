import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:traveldates/screens/main_screen.dart';
import 'package:traveldates/screens/notification_screen.dart';
import 'package:traveldates/screens/profile_screen.dart';
import 'package:traveldates/screens/settings_screen.dart';
import 'package:traveldates/screens/trip_detail.dart';

class SignInOtpScreen extends StatelessWidget {
  const SignInOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              // Background image
              Positioned.fill(
                child: Image.asset(
                  'assets/splash_screen/splash_screen.png',
                  fit: BoxFit.fill,
                ),
              ),

              // Logo image
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.06,
                    bottom: size.height * 0.25,
                  ),
                  child: Image.asset(
                    'assets/splash_screen/splash_screen_laguage.png',
                    width: size.width * 0.38,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // Instruction text + OTP input + Continue (all in one column)
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.63,
                    left: size.width * 0.10,
                    right: size.width * 0.10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        "Please enter the code received in your email",
                        style: TextStyle(fontSize: 15),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: PinCodeTextField(
                              appContext: context,
                              length: 6,
                              keyboardType: TextInputType.number,
                              animationType: AnimationType.fade,
                              autoFocus: false,
                              pinTheme: PinTheme(
                                shape: PinCodeFieldShape.box,
                                borderRadius: BorderRadius.circular(6),
                                fieldHeight: 38,
                                fieldWidth: 33,
                                activeFillColor: const Color(0xFFB79D6C),
                                inactiveFillColor: const Color(0xFFB79D6C),
                                selectedFillColor: const Color(0xFFB79D6C),
                                inactiveColor: Colors.white,
                                activeColor: Colors.white,
                                selectedColor: Colors.blue,
                                borderWidth: 1,
                              ),
                              enableActiveFill: true,
                              onCompleted: (value) {
                                print("OTP entered: $value");
                              },
                              onChanged: (value) {},
                            ),
                          ),
                          const SizedBox(width: 5),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainScreen(),
                                ),
                              );
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: size.width * 0.002,
                                vertical: size.height * 0.01,
                              ),
                              // backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: InkWell(
                              onTap: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MainScreen(),
                                  ),
                                );
                              },
                              child: Image.asset(
                                'assets/splash_screen/plane.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
