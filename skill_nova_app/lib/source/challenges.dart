import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skill_nova_app/database/skillnova_database.dart';
import 'package:skill_nova_app/models/challenge.dart';

import 'package:skill_nova_app/source/Switch/User_to_Admin.dart';
import 'package:skill_nova_app/source/widgets/user_challenge_list_tile.dart';

class ChallengesScreen extends StatefulWidget {
  const ChallengesScreen({super.key});

  @override
  _ChallengesScreenState createState() => _ChallengesScreenState();
}

class _ChallengesScreenState extends State<ChallengesScreen> {
  bool isLoading = false;
  List<Challenge> challenges = [];
  final Map<int?, String> courseCategoriesIdToNameMap = {};

  Future<void> getAllChallenges() async {
    setState(() => isLoading = true);
    challenges = await SkillNovaDatabase.instance.readAllChallenges(onlyIsActive: true);
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

  double Value = 0.72;
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
              left: 0,
              right: 0,
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 3,
                                ),
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
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(12.5),
                                                color: Colors.white),
                                            child: const Icon(
                                              Icons.arrow_back,
                                              color: Colors.black,
                                              size: 30,
                                            )),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.15,
                                        ),
                                        const Column(
                                          children: [
                                            Text(
                                              "Tantangan",
                                              style: TextStyle(
                                                  fontSize: 22,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              "Progress Tantangan",
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
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
                                          borderRadius:
                                              BorderRadius.circular(20),
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
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 5, right: 15, left: 15, bottom: 5),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFAF40CC),
                                      borderRadius: BorderRadius.circular(5)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: 75,
                                  child: const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Tantangan Selesai Hari Ini",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Text(
                                        "12",
                                        style: TextStyle(
                                          color: Color(0xFFF2D049),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.06,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                      top: 5, right: 15, left: 15, bottom: 5),
                                  decoration: BoxDecoration(
                                      color: const Color(0xFFAF40CC),
                                      borderRadius: BorderRadius.circular(5)),
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: 75,
                                  child: const Column(
                                    children: [
                                      Text(
                                        "Total Tantangan Selesai",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "27",
                                        style: TextStyle(
                                          color: Color(0xFFF2D049),
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 5),
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width,
                              margin: const EdgeInsets.only(
                                  top: 2, 
                                  right: 30, 
                                  left: 30
                              ),
                              child: const Text(
                                "Tantangan Baru",
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
                ],
              ),
            ),
            Positioned(
              top: 270,
              left: 0,
              right: 0,
              bottom: 50,
              child: isLoading ? const Center(
                child: CircularProgressIndicator() 
              ) : _buildChallengesList(),
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
                      height: MediaQuery.of(context).size.height * 0.0025,
                    ),
                    const Text(
                      "Terus lanjutkan belajarnya! Selesaikan tantangan untuk mencapai Level selanjutnya!",
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
            )
          ],
        ),
      ),
    );
  }

  Widget _buildChallengesList() {
    return ListView.builder(
        itemCount: challenges.length,
        itemBuilder: (context, index) {
          final challenge = challenges[index];
          return GestureDetector(
            onTap: () async {},
            child: UserChallengeListTile(
                challenge: challenge,
                courseCategoryName:
                    courseCategoriesIdToNameMap[challenge.categoryId] ??
                        "Semua Kategori"),
          );
        });
  }
}
