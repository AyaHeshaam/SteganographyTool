import 'package:flutter/material.dart';
import 'image_upload_page.dart';
import 'second_intro_page.dart';
import 'intro.dart';
import 'login_register.dart';
import 'login_form.dart';
import 'registration_form.dart';
import 'image_screen.dart' as AppImageScreen;

import 'dart:convert';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:http/http.dart' as http;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    // Ensure Firebase initialization is completed before running the app
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    print('Error initializing Firebase: $e');
    // Handle Firebase initialization error gracefully
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // Define _navigateToImageUpload function
  void _navigateToImageUpload(BuildContext context) {
    Navigator.pushNamed(context, '/image_upload');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App',
      initialRoute: '/intro',
      routes: {
        '/intro': (context) => IntroPage(),
        '/second_intro': (context) => SecondIntroPage(),
        '/login_or_register': (context) => LoginOrRegisterPage(),
        '/login_form': (context) => LoginFormPage(navigateToImageUpload: _navigateToImageUpload),
        '/register_form': (context) => RegisterFormPage(navigateToImageUpload: _navigateToImageUpload),
        '/image_upload': (context) => ImageUploadPage(),
        '/image_screen': (context) => AppImageScreen.ImageScreen(image: null), // Pass null initially

      },
    );
  }
}
