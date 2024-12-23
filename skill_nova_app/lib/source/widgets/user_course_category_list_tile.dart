import 'dart:io';
import 'package:flutter/material.dart';
import 'package:skill_nova_app/models/course_category.dart';

class User_Course_Category extends StatelessWidget {
  const User_Course_Category({super.key, required this.courseCategory});

  final CourseCategory courseCategory;

  @override
  Widget build(BuildContext context) {
    // Ensure that the image exists. If not, display a placeholder.
    final File courseCategoryImage = File(courseCategory.image);
    return Container(
      margin: const EdgeInsets.only(top: 2, right: 30, left: 30),
      child: Container(
        padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: const Color(0xff5271FF),
            borderRadius: BorderRadius.circular(5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Row(
                children: [
                  // Check if the image exists, otherwise show a placeholder
                  courseCategoryImage.existsSync()
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.file(
                            courseCategoryImage,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                      )
                      : const Placeholder(
                          fallbackHeight: 100,
                          fallbackWidth: 100,
                        ),
                  const SizedBox(
                    width: 6,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        courseCategory.title, // Use actual category name
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 4),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.49,
                        child: const Text(
                          "Skills yang didapat: ",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.49,
                        child: Text(
                          courseCategory.skills
                              .join(', '), // Dynamically display the skills
                          style: const TextStyle(
                            color: Color(0xffD9D9D9),
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.49,
                        child: Text(
                          "${courseCategory.tags[0]} • ${courseCategory.certificateType} Certificate • ${courseCategory.getDuration()}",
                          style: TextStyle(
                            color: Color(0xffD9D9D9),
                            fontWeight: FontWeight.w400,
                            fontSize: 11,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.32,
                        child: Text(
                          courseCategory.tags.sublist(1).join(', '),
                          style: TextStyle(
                            color: Color(0xffD9D9D9),
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 4,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
