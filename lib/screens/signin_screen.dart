import 'package:flutter/material.dart';
import 'package:traveldates/screens/signin_otp.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: Stack(
        children: [
          // Background image (fills the screen)
          SizedBox(
            width: size.width,
            height: size.height,
            child: Image.asset(
              'assets/splash_screen/splash_screen.png',
              fit: BoxFit.fill,
            ),
          ),
          // Logo image (center left, above background)
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
          Positioned(
            bottom: size.height * 0.25,
            left: size.width * 0.17,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF292C47),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22),
                ),
                elevation: 0,
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.024),
              ),
              child: Row(
                // mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/splash_screen/Google_logo.png',
                    height: size.height * 0.025, // ≈ 22 pixels
                    // width: size.width * 0.08, // ≈ 30 pixels
                  ),
                  SizedBox(width: size.width * 0.029),
                  const Text(
                    'Continue with Google',
                    style: TextStyle(color: Colors.white, fontSize: 9),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: size.height * 0.21,
            left: size.width * 0.05,
            child: Text(
              "---------------------- OR ----------------------",
              style: TextStyle(fontSize: 16, fontFamily: 'Poppins'),
            ),
          ),
          Positioned(
            bottom: size.height * 0.11,
            left: size.width * 0.058,
            child: Row(
              children: [
                SizedBox(
                  height: size.height * 0.04, // ≈ 32 pixels
                  width: size.width * 0.60, // ≈ 222 pixels
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: _emailController,
                    decoration: InputDecoration(
                      label: Text(
                        "Enter Your Email",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black.withAlpha(100),
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      fillColor: Colors.white,
                      filled: true,
                      // isDense: true,
                      // contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12), // Reduce padding
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInOtpScreen(),
                      ),
                    );
                  },
                  child: Image.asset(
                    'assets/splash_screen/plane.png',
                    // height: 90,
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
