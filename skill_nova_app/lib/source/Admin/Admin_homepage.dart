import 'package:flutter/material.dart';
import 'package:skill_nova_app/source/Admin/Admin_challenges.dart';
import 'package:skill_nova_app/source/Admin/Admin_homescreen.dart';
import 'package:skill_nova_app/source/Admin/Admin_missions.dart';
import 'package:skill_nova_app/source/Admin/Admin_bottombar.dart';

class Admin_HomePage extends StatefulWidget {
  const Admin_HomePage({super.key});

  @override
  _Admin_HomePageState createState() => _Admin_HomePageState();
}
class _Admin_HomePageState extends State<Admin_HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Admin_HomeScreen(),
    const Admin_MissionsScreen(),
    const Admin_ChallengesScreen(),
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
      bottomNavigationBar: Admin_BottomNavBar(
        currentIndex: _selectedIndex, // Pass the current index
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
