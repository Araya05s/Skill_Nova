import 'package:flutter/material.dart';
import 'package:skill_nova_app/source/Adder/Adding_Challenge.dart';

class Admin_ChallengesScreen extends StatefulWidget {
  const Admin_ChallengesScreen({super.key});

  @override
  State<Admin_ChallengesScreen> createState() => _Admin_ChallengesScreenState();
}

class _Admin_ChallengesScreenState extends State<Admin_ChallengesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenges List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddChallengeScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
