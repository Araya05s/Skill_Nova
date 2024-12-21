import 'package:flutter/material.dart';
import 'package:skill_nova_app/source/Adder/Adding_Mission.dart';

class Admin_MissionsScreen extends StatefulWidget {
  const Admin_MissionsScreen({super.key});

  @override
  State<Admin_MissionsScreen> createState() => _Admin_MissionsScreenState();
}

class _Admin_MissionsScreenState extends State<Admin_MissionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Missions List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddMissionScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
