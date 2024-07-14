import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'Authentication%20Page/auth_page.dart';
import 'Drawer.dart';
import 'HomePage/HomePage.dart';
import 'Intro_Screen/splash_screen.dart';
import 'dart:ui';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'otp_screen',
      routes: {
        'splash_screen': (context) => Splash(),
        'Auth': (context) => Auth(),
        'otp_screen': (context) => HomePage(),
        'Drawer': (context) => SliderMenu(),
      },
      builder: (context, child) {
        ErrorWidget.builder = (FlutterErrorDetails details) {
          return Center(
            child: Text(
              "Error occurred: ${details.exceptionAsString()}",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.red),
            ),
          );
        };
        return child!;
      },
    );
  }
}
