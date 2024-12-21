import 'package:flutter/material.dart';

class AddMissionScreen extends StatefulWidget {
  const AddMissionScreen({super.key});

  @override
  State<AddMissionScreen> createState() => _AddMissionScreenState();
}

class _AddMissionScreenState extends State<AddMissionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Missions Screen')
      ),
    );
  }
}