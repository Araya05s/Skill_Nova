import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:skill_nova_app/source/Switch/User_to_Admin.dart';
import 'package:skill_nova_app/database/skillnova_database.dart';
import 'package:skill_nova_app/models/course_category.dart';
import 'package:skill_nova_app/source/widgets/user_course_category_list_tile.dart';

class User_HomeScreen extends StatefulWidget {
  const User_HomeScreen({super.key});

  @override
  _User_HomeScreenState createState() => _User_HomeScreenState();
}

class _User_HomeScreenState extends State<User_HomeScreen> {
  bool isLoading = false;
  List<CourseCategory> courseCategories = [];


  Future<void> getAllCourseCategories() async {
    setState(() => isLoading = true);

    courseCategories =
        await SkillNovaDatabase.instance.readAllCourseCategories();

    setState(() => isLoading = false);
  }

  Future<void> _filterItems(String query) async {
    if (query.isEmpty) {
      final categorizes =
      await SkillNovaDatabase.instance.readAllCourseCategories();

      setState(() {
      courseCategories = categorizes;
      });
    } else {
      final filteredcategories = await SkillNovaDatabase.instance.searchCourseCategories(query);
      setState(() {
        courseCategories = filteredcategories;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getAllCourseCategories();
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
    )); // White icons

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
                    height: 174,
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
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Halo, David Hamilton!",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    Text(
                                      "Apa yang ingin dipelajari hari ini?",
                                      style: TextStyle(
                                          color: Color(0xff5271FF),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.51,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 45,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            fillColor: Colors.white,
                                            filled: true,
                                            hintText:
                                                "Cari kursus di SkillNova™.....",
                                            suffixIcon: Container(
                                              height: 10,
                                              decoration: const BoxDecoration(
                                                  color: Color(0xff782A8C)),
                                              child: const Icon(Icons.search,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          style: const TextStyle(
                                              fontSize: 12,
                                              color: Color(0xff636363)),
                                          textAlign: TextAlign.start,
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                        ),
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
                                          isAdminMode: false)),
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
                                        color: Colors.white, fontSize: 12),
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
                                          value: 0.72,
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.only(
                              top: 2, right: 30, left: 30),
                          child: const Text(
                            "Rekomendasi kategori kursus untuk kamu",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 220, // Adjust this value as needed
              left: 0,
              right: 0,
              bottom: 0, // Ensure this widget takes the remaining space
              child: isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _buildCourseCategoriesList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCategoriesList() {
    return ListView.builder(
      itemCount: courseCategories.length,
      itemBuilder: (context, index) {
        final courseCategory = courseCategories[index];

        return GestureDetector(
            onTap: () async {},
            child: User_Course_Category(courseCategory: courseCategory));
      },
    );
  }
}
