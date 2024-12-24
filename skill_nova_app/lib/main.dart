import 'package:flutter/material.dart';
import 'package:skill_nova_app/database/skillnova_database.dart';
import 'source/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());

  SkillNovaDatabase.instance.close();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SKILL NOVA',
      theme: ThemeData(
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      //home: const SplashScreen(),
    );
  }
}
