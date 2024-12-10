import 'package:flutter/material.dart';
import 'package:skill_nova_app/source/challenges.dart';
import 'package:skill_nova_app/source/homescreen.dart';
import 'package:skill_nova_app/source/missions.dart';
import 'package:skill_nova_app/source/bottombar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    MissionsScreen(),
    ChallengesScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex, // Pass the current index
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
