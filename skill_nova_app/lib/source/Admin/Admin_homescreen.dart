import 'package:flutter/material.dart';

class Admin_HomeScreen extends StatefulWidget {
  const Admin_HomeScreen({super.key});

  @override
  State<Admin_HomeScreen> createState() => _Admin_HomeScreenState();
}

class _Admin_HomeScreenState extends State<Admin_HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Categories List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
