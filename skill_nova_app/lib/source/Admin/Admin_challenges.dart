import 'package:flutter/material.dart';
import 'package:skill_nova_app/database/skillnova_database.dart';
import 'package:skill_nova_app/models/challenge.dart';
import 'package:skill_nova_app/source/Adder/Adding_Challenge.dart';
import 'package:skill_nova_app/source/Switch/User_to_Admin.dart';
import 'package:skill_nova_app/source/widgets/challenge_list_tile.dart';

class Admin_ChallengesScreen extends StatefulWidget {
  const Admin_ChallengesScreen({super.key});

  @override
  State<Admin_ChallengesScreen> createState() => _Admin_ChallengesScreenState();
}

class _Admin_ChallengesScreenState extends State<Admin_ChallengesScreen> {
  bool isLoading = false;
  List<Challenge> challenges = [];
  final Map<int?, String> courseCategoriesIdToNameMap = {};

  Future<void> getAllChallenges() async {
    setState(() => isLoading = true);
    challenges = await SkillNovaDatabase.instance.readAllChallenges();
    for (final courseCategory
        in await SkillNovaDatabase.instance.readAllCourseCategories()) {
      courseCategoriesIdToNameMap[courseCategory.id] = courseCategory.title;
    }
    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    getAllChallenges();
  }

  @override
  void dispose() {
    // SkillNovaDatabase.instance.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Challenges List'),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UsertoAdmin(isAdminMode: true),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildChallengesList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddChallengeScreen(),
            ),
          );

          getAllChallenges();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildChallengesList() {
    return ListView.builder(
        itemCount: challenges.length,
        itemBuilder: (context, index) {
          final challenge = challenges[index];
          return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AddChallengeScreen(
                    challenge: challenge,
                  ),
                ),
              );

              getAllChallenges();
            },
            child: ChallengeListTile(
                challenge: challenge,
                courseCategoryName:
                    courseCategoriesIdToNameMap[challenge.categoryId] ??
                        "Semua Kategori"),
          );
        });
  }
}
