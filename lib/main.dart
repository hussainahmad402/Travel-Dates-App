import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:traveldates/screens/signin_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await GetStorage.init(); // ✅ initialize GetStorage
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: SignInScreen()
      ); 
    
  }
}
