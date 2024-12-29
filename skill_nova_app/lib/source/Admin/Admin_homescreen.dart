import 'package:flutter/material.dart';
import 'package:skill_nova_app/database/skillnova_database.dart';
import 'package:skill_nova_app/models/course_category.dart';
import 'package:skill_nova_app/source/Adder/Adding_Category.dart';
import 'package:skill_nova_app/source/Switch/User_to_Admin.dart';
import 'package:skill_nova_app/source/widgets/course_category_list_tile.dart';

class Admin_HomeScreen extends StatefulWidget {
  const Admin_HomeScreen({super.key});

  @override
  State<Admin_HomeScreen> createState() => _Admin_HomeScreenState();
}

class _Admin_HomeScreenState extends State<Admin_HomeScreen> {
  bool isLoading = false;
  List<CourseCategory> courseCategories = [];

  Future<void> getAllCourseCategories() async {
    setState(() => isLoading = true);

    courseCategories =
        await SkillNovaDatabase.instance.readAllCourseCategories();

    setState(() => isLoading = false);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Categories List'),
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const UsertoAdmin(
                  isAdminMode: true
                ),
              ),
            );
          },
          child: const Icon(
            Icons.arrow_back,
          )
        ),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _buildCourseCategoriesList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => AddCourseCategoryScreen(),
            ),
          );

          getAllCourseCategories();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildCourseCategoriesList() {
    return ListView.builder(
      itemCount: courseCategories.length,
      itemBuilder: (context, index) {
        final courseCategory = courseCategories[index];

        return GestureDetector(
          onTap: () async {
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => AddCourseCategoryScreen(
                  courseCategory: courseCategory,
                ),
              ),
            );

            getAllCourseCategories();
          },
          child: CourseCategoryListTile(
            courseCategory: courseCategory
          )
        );
      },
    );
  }

}
