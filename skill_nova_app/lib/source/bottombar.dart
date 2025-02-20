import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onItemTapped,
      backgroundColor: const Color(0xff782A8C),
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(
            label: "Home",
            icon: Icon(
              Icons.home_filled,
              size: 40,
            )),
        BottomNavigationBarItem(
            label: "Missions",
            icon: ImageIcon(
              AssetImage("icons/Mission-icon.png"),
              size: 40,
            )),
        BottomNavigationBarItem(
            label: "Challenges",
            icon: ImageIcon(
              AssetImage("icons/Challenges-icon.png"),
              size: 40,
            )),
      ],
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      selectedItemColor: const Color(0xff5271FF),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedItemColor: Colors.white,
    );
  }
}
