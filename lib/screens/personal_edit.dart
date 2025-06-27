import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:traveldates/screens/profile_screen.dart';
import 'package:traveldates/widgets/custom_textfields.dart';

class PersonalEditScreen extends StatefulWidget {
  const PersonalEditScreen({super.key});

  @override
  State<PersonalEditScreen> createState() => _PersonalEditScreenState();
}

class _PersonalEditScreenState extends State<PersonalEditScreen> {
  final box = GetStorage();
    final _firstNameController = TextEditingController();
    final _lastNameController = TextEditingController();
    final _emailController = TextEditingController();
    final _cityController = TextEditingController();
    final _secondaryEmailController = TextEditingController();
    final _companyNameController = TextEditingController();

   @override
  void initState() {
    super.initState();

    // Load existing data from GetStorage
    _firstNameController.text = box.read('first_name') ?? '';
    _lastNameController.text = box.read('last_name') ?? '';
    _emailController.text = box.read('email') ?? '';
    _cityController.text = box.read('city') ?? '';
    _secondaryEmailController.text = box.read('secondary_email') ?? '';
    _companyNameController.text = box.read('company_name') ?? '';
  }

  void _saveData() {
    box.write('first_name', _firstNameController.text);
    box.write('last_name', _lastNameController.text);
    box.write('email', _emailController.text);
    box.write('city', _cityController.text);
    box.write('secondary_email', _secondaryEmailController.text);
    box.write('company_name', _companyNameController.text);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Data saved locally")),
    );

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const ProfileScreen()),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _cityController.dispose();
    _secondaryEmailController.dispose();
    _companyNameController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Row(
        children: [
          // Vertical bar
          Container(
            width: size.width * 0.03,
            height: double.infinity,
            color: const Color(0xFF23284E),
          ),
          // Main content
          Expanded(
            child: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.07,
                  vertical: size.height * 0.03,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Back arrow
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ProfileScreen(),
                          ),
                        );
                      },
                      child: Icon(Icons.arrow_back, size: size.width * 0.08),
                    ),
                    SizedBox(height: size.width * 0.09),
                    // Title
                    const Text(
                      "Edit",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.w600,
                        fontSize: 32,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    // CustomTextFormField widgets
                    CustomTextFormField(
                      label: "First Name: *",
                      controller: _firstNameController,
                    ),
                    SizedBox(height: size.height * 0.015),
                    CustomTextFormField(
                      label: "Last Name:*",
                      controller: _lastNameController,
                    ),
                    SizedBox(height: size.height * 0.015),
                    CustomTextFormField(
                      label: "Email: *",
                      controller: _emailController,
                    ),
                    SizedBox(height: size.height * 0.015),
                    CustomTextFormField(
                      label: "Home, City: *",
                      controller: _cityController,
                    ),
                    SizedBox(height: size.height * 0.015),
                    CustomTextFormField(
                      label: "add secondary email: (optional)",
                      controller: _secondaryEmailController,
                    ),
                    SizedBox(height: size.height * 0.015),
                    CustomTextFormField(
                      label: "company name:",
                      controller: _companyNameController,
                    ),
                    SizedBox(height: size.height * 0.04),
                    // Save button
                    Align(
                      alignment: Alignment.bottomRight,

                      child: ElevatedButton(
                        onPressed: _saveData,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFAF9A73),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: size.width * 0.06,
                            vertical: size.height * 0.01,
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.white,
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

// Custom TextFormField widge
