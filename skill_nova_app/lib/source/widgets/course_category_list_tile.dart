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
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Row(
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
                            )),
                      ),
                      const SizedBox(width: 6),
                      Column(
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
                          ),
                          const SizedBox(height: 4),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.49,
                            child: const Text(
                              "Skills yang didapat: ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.49,
                            child: Text(
                              courseCategory.skills.join(', '),
                              style: const TextStyle(
                                color: Color(0xffD9D9D9),
                                fontWeight: FontWeight.w400,
                                fontSize: 9,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.49,
                            child: Text(
                              "${courseCategory.tags[0]}, ${courseCategory.certificateType} Certificate, ${courseCategory.getDuration()}",
                              style: TextStyle(
                                color: Color(0xffD9D9D9),
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          ),
                          const SizedBox(height: 15),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.49,
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
                      ),
                    ],
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


/* class CourseCategoryListTile extends StatefulWidget {
  const CourseCategoryListTile({super.key, required this.courseCategory});

  final CourseCategory courseCategory;

  @override
  State<CourseCategoryListTile> createState() => _CourseCategoryListTileState();
}

class _CourseCategoryListTileState extends State<CourseCategoryListTile> {
  File? _courseCategoryImage;

  @override
  void initState() {
    _courseCategoryImage = File(widget.courseCategory.image);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
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
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Row(
                    children: [
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: _courseCategoryImage != null
                              ? Image.file(
                                  _courseCategoryImage!,
                                  fit: BoxFit.cover,
                                )
                              : Image.asset(
                                  'assets/images/placeholder.png',
                                  fit: BoxFit.cover,
                                ),
                        ),
                      ),
                      /*Image.file(
                        _courseCategoryImage!, 
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),*/
                      const SizedBox(
                        width: 6,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.courseCategory.title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.49,
                            child: const Text(
                              "Skills yang didapat: ",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.49,
                            child: Text(
                              widget.courseCategory.skills.join(', '),
                              style: const TextStyle(
                                  color: Color(0xffD9D9D9),
                                  fontWeight: FontWeight.w400,
                                  fontSize: 9),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                            ),
                          ),
                          const SizedBox(
                            height: 6,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.49,
                            child: Text(
                              "Test",
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
                  )
                ),
            ],
          ),
        ),
      ),
    ]);

    /*CupertinoListTile(
      title: Text(
        widget.courseCategory.title,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );*/
  }
}*/
