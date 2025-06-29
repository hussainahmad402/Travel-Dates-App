import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:traveldates/screens/main_screen.dart';


class SignInOtpScreen extends StatelessWidget {
  const SignInOtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      //  resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background image
          SizedBox(
            width: size.width,
            height: size.height,
            child: Image.asset(
              'assets/splash_screen/splash_screen.png',
              fit: BoxFit.cover,
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
          Positioned(
            bottom: size.height * 0.11,
            left: size.width * 0.08,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: Text(
                        "Please enter the code received in your email",
                        style: TextStyle(
                          fontSize: size.height * 0.014,

                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    // const SizedBox(height: 16),
                    SizedBox(
                      width: size.width * 0.6,
                      child: PinCodeTextField(
                        appContext: context,
                        length: 6,
                        keyboardType: TextInputType.number,
                        animationType: AnimationType.fade,
                        autoFocus: false,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(1),
                          fieldHeight: size.height * 0.037,
                          fieldWidth: size.width * 0.07,
                          activeFillColor: const Color(0xFFB79D6C),
                          inactiveFillColor: const Color(0xFFB79D6C),
                          selectedFillColor: const Color(0xFFB79D6C),
                          inactiveColor: Colors.white,
                          activeColor: Colors.white,
                          selectedColor: Colors.blue,
                        ),
                        enableActiveFill: true,
                        onCompleted: (value) {
                          print("OTP entered: $value");
                        },
                        onChanged: (value) {},
                      ),
                    ),
                  ],
                ),

                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                    );
                  },
                  child: Image.asset(
                    'assets/splash_screen/plane.png',
                    height: 90,
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
