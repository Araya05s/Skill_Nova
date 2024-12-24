import 'dart:io';
import 'package:flutter/material.dart';
import 'package:skill_nova_app/models/course_category.dart';

class CourseCategoryListTile extends StatelessWidget {
  const CourseCategoryListTile({super.key, required this.courseCategory});

  final CourseCategory courseCategory;

  @override
  Widget build(BuildContext context) {
    final File courseCategoryImage = File(courseCategory.image);

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 2, right: 30, left: 30),
          child: Container(
            padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0xff5271FF),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.file(
                      courseCategoryImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          courseCategory.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "Skills yang didapat:",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        Text(
                          courseCategory.skills.join(', '),
                          style: const TextStyle(
                            color: Color(0xffD9D9D9),
                            fontWeight: FontWeight.w400,
                            fontSize: 9,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          "${courseCategory.tags[0]}, ${courseCategory.certificateType} Certificate, ${courseCategory.getDuration()}",
                          style: const TextStyle(
                            color: Color(0xffD9D9D9),
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                        const SizedBox(height: 6),
                        Text(
                          courseCategory.tags.sublist(1).join(', '),
                          style: const TextStyle(
                            color: Color(0xffD9D9D9),
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ],
                    ),
                  ),
                ),
                // Chip Widget
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Chip(
                      label: Text(
                        courseCategory.isActive ? "ACTIVE" : "INACTIVE",
                        style: TextStyle(
                          color:
                              courseCategory.isActive ? Colors.green : Colors.red,
                        ),
                      ),
                      backgroundColor: courseCategory.isActive
                          ? Colors.green[50]
                          : Colors.red[50],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
