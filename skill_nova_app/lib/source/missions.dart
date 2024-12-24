import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skill_nova_app/database/skillnova_database.dart';
import 'package:skill_nova_app/models/mission.dart';
import 'package:skill_nova_app/source/Switch/User_to_Admin.dart';
import 'package:skill_nova_app/source/homepage.dart';
import 'package:skill_nova_app/source/widgets/user_mission_list_tile.dart';

class MissionsScreen extends StatefulWidget {
  const MissionsScreen({super.key});

  @override
  _MissionsScreenState createState() => _MissionsScreenState();
}

class _MissionsScreenState extends State<MissionsScreen> {

  bool isLoading = false;
  List<Mission> missions = [];
  final Map<int?, String> courseCategoriesIdToNameMap = {};
  double Value = 0.72;

  Future<void> getAllMissions() async {
    setState(() => isLoading = true);
    missions = await SkillNovaDatabase.instance.readAllMissions(onlyIsActive: true);
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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color(0xff782A8C), // Purple color
      statusBarIconBrightness: Brightness.light,
    )); // White

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 5, left: 20, right: 10),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                        color: Color(0xff782A8C),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    height: 241,
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      border: Border.all(),
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white),
                                  child: const Icon(
                                    Icons.notifications,
                                    color: Colors.black,
                                    size: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.5),
                                                color: Colors.white),
                                            child: IconButton(
                                              icon: const Icon(
                                                Icons.arrow_back,
                                                color: Colors.black,
                                                size: 30,
                                              ),
                                              onPressed: () {
                                                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(selectedIndex: 0,)));
                                              },
                                            ),
                                        ),
                                        SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15),
                                        const Text(
                                          "Statistik Misi",
                                          style: TextStyle(
                                              fontSize: 22,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.59,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Column(
                                            children: [
                                              Text(
                                                "Misi Selesai",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                "15",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color: Color(0xffF2D049)),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.1),
                                          const Column(
                                            children: [
                                              Text(
                                                "Misi Aktif",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    color: Colors.white),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "'Belajar Javascript'",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                    color: Color(0xffF2D049)),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                "5 / 29 Langkah Selesai",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 10,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const UsertoAdmin(
                                            isAdminMode: false,
                                          )),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Image.asset(
                                    "images/Profile.png",
                                    width: 69,
                                    height: 69,
                                  ),
                                  const Text(
                                    "David Hamilton",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                  const Text(
                                    "Level 27",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                    ),
                                  ),
                                  Stack(
                                    children: <Widget>[
                                      SizedBox(
                                        width: 100,
                                        height: 15,
                                        child: LinearProgressIndicator(
                                          backgroundColor:
                                              const Color(0xffD9D9D9),
                                          valueColor:
                                              const AlwaysStoppedAnimation(
                                                  Color(0xff5271FF)),
                                          value: Value,
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                      const Align(
                                        widthFactor: 1.40,
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "14.4K / 20K XP",
                                          style: TextStyle(
                                              fontSize: 10,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff782A8C)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 6),
                                  const Text(
                                    "6x Learning Streak",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  const Text(
                                    "4 / 9 misi selesai",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 10),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 5, right: 15, left: 15, bottom: 5),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFAF40CC),
                                  borderRadius: BorderRadius.circular(5)),
                              width: 150,
                              height: 56,
                              child: Column(
                                children: [
                                  const Text(
                                    "Learning Streak aktif",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                    softWrap: true,
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.height *
                                        0.0025,
                                  ),
                                  const Text(
                                    "6x",
                                    style: TextStyle(
                                      color: Color(0xFFF2D049),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  top: 5, right: 15, left: 15, bottom: 5),
                              decoration: BoxDecoration(
                                  color: const Color(0xFFAF40CC),
                                  borderRadius: BorderRadius.circular(5)),
                              width: 160,
                              height: 56,
                              child: const Column(
                                children: [
                                  Text(
                                    "Deadline Misi Terdekat",
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "12 Jam 30 Menit",
                                    style: TextStyle(
                                      color: Color(0xFFFF0025),
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin:
                              const EdgeInsets.only(
                                top: 2, 
                                right: 30, 
                                left: 30
                              ),
                          child: const Text(
                            "Misi-Misi Baru",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 270,
              left: 0,
              right: 0,
              bottom: 50,
              child: isLoading ? const Center(child: CircularProgressIndicator()) : _buildMissionsList(),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Colors.white,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.003,
                    ),
                    const Text(
                      "Terus lanjutkan belajarnya! Tinggal 3 misi lagi sebelum kamu mencapai Level 28, lho!",
                      style: TextStyle(
                          fontSize: 8.25,
                          fontWeight: FontWeight.w800,
                          color: Color(0xff5271FF)),
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: <Widget>[
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: 15,
                          child: LinearProgressIndicator(
                            backgroundColor: const Color(0xffD9D9D9),
                            valueColor:
                                const AlwaysStoppedAnimation(Color(0xff5271FF)),
                            value: Value,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        const Align(
                          widthFactor: 1.40,
                          child: Text(
                            "14.4K / 20K XP",
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff782A8C)),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    const Text(
                      "Level 27",
                      style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff5271FF)),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMissionsList() {
    return ListView.builder(
      itemCount: missions.length,
      itemBuilder: (context, index) {
        final mission = missions[index];

        return GestureDetector(
          onTap: () async {},
          child: UserMissionListTile(
            mission: mission,
            courseCategoryName: courseCategoriesIdToNameMap[mission.categoryId] ?? "Semua Kategori",
          ),
        );
      }
    );
  }
}
