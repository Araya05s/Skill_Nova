import 'package:flutter/material.dart';
import 'package:skill_nova_app/database/skillnova_database.dart';
import 'package:skill_nova_app/models/mission.dart';
import 'package:skill_nova_app/source/Adder/Adding_Mission.dart';
import 'package:skill_nova_app/source/Switch/User_to_Admin.dart';
import 'package:skill_nova_app/source/widgets/mission_list_tile.dart';

class Admin_MissionsScreen extends StatefulWidget {
  const Admin_MissionsScreen({super.key});

  @override
  State<Admin_MissionsScreen> createState() => _Admin_MissionsScreenState();
}

class _Admin_MissionsScreenState extends State<Admin_MissionsScreen> {
  bool isLoading = false;
  List<Mission> missions = [];
  final Map<int?, String> courseCategoriesIdToNameMap = {};

  Future<void> getAllMissions() async {
    setState(() => isLoading = true);

    missions = await SkillNovaDatabase.instance.readAllMissions();

    for (final courseCategory
        in await SkillNovaDatabase.instance.readAllCourseCategories()) {
      courseCategoriesIdToNameMap[courseCategory.id] = courseCategory.title;
    }

    setState(() => isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    getAllMissions();
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
        title: const Text('Missions List'),
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
            )),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : _buildMissionsList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddMissionScreen(),
            ),
          );

          getAllMissions();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildMissionsList() {
    return ListView.builder(
      itemCount: missions.length,
      itemBuilder: (context, index) {
        final mission = missions[index];

        return GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => AddMissionScreen(
                    mission: mission,
                  ),
                ),
              );

              getAllMissions();
            },
            child: MissionListTile(
                mission: mission,
                courseCategoryName:
                    courseCategoriesIdToNameMap[mission.categoryId] ??
                        "Semua Kategori"));
      },
    );
  }
}
