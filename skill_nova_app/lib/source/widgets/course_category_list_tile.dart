import 'package:flutter/cupertino.dart';
import 'package:skill_nova_app/models/course_category.dart';

class CourseCategoryListTile extends StatelessWidget {
  const CourseCategoryListTile({super.key, required this.courseCategory});

  final CourseCategory courseCategory;

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(courseCategory.title,),
    );
  }
}