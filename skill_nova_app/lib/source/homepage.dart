import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'bottombar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  int _selectedIndex = 2;

  final List<Widget> _pages = [
    HomeScreen(),
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
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
