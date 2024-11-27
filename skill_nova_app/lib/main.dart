import 'package:flutter/material.dart';
import 'source/homepage.dart';
import 'source/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SKILL NOVA',
      theme: ThemeData(
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

