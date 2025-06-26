import 'package:flutter/material.dart';
import 'package:traveldates/screens/signin_otp.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height, // Maintain full height, helps Stack layout
          child: Stack(
            children: [
              // Background image (fills the screen)
              Positioned.fill(
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
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.4,
                    left: size.width * 0.16,
                  ),
                  child: SizedBox(
                     height: size.height * 0.05,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF292C47),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                        padding:  EdgeInsets.symmetric(horizontal:  size.width * 0.024),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            'assets/splash_screen/Google_logo.png',
                            height: 24,
                            width: 24,
                          ),
                           SizedBox(width: size.width * 0.024 ),
                          const Text(
                            'Continue with Google',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.53,
                    left: size.width * 0.13,
                  ),
                  child: Text(
                    "----------------- OR -----------------",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: size.height * 0.66,
                    left: size.width * 0.13,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                         height: size.height * 0.05,
                        width: size.width * 0.55,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: _emailController,
                          decoration: InputDecoration(
                            label: Text("Enter Your Email"),
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
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SignInOtpScreen()));
                        },
                        child: Image.asset('assets/splash_screen/plane.png'),
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
