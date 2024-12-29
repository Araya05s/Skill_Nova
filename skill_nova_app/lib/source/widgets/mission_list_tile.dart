import 'dart:io';
import 'package:flutter/material.dart';
import 'package:skill_nova_app/models/mission.dart';

class MissionListTile extends StatelessWidget {
  const MissionListTile({super.key, required this.mission, required this.courseCategoryName});

  final Mission mission;
  final String? courseCategoryName;

  @override
  Widget build(BuildContext context) {
    final File missionImage = File(mission.image);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 4,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.file(
                missionImage,
                width: 100,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mission.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Kategori: $courseCategoryName",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "${mission.courseMaterialsCount} Materi Belajar",
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 16, color: Color(0xFFF2D049)),
                        Text(
                          " +${mission.xpReward} XP",
                          style: const TextStyle(
                            color: Color(0xFFF2D049),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Chip(
                label: Text(
                  mission.isActive ? "ACTIVE" : "INACTIVE",
                  style: TextStyle(
                    color: mission.isActive ? Colors.green : Colors.red,
                  ),
                ),
                backgroundColor: mission.isActive ? Colors.green[50] : Colors.red[50],
              ),
            ),
          ],
        ),
      ),
    );

    /*Stack(
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
                        Image.file(
                          missionImage,
                          width: 100,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                mission.title,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.49,
                              child: Row(
                                children: [
                                  Text(
                                    "Kategori : ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 9),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                  Text(
                                    mission.categoryId.toString(),
                                    style: TextStyle(
                                      color: Color(0xFFF2D049),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 9,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.49,
                              child: Text(
                                "Memiliki ${mission.courseMaterialsCount} Materi Belajar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 11,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                            ),
                            const SizedBox(
                              height: 3,
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.49,
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      size: 16,
                                      color: Color(0xFFF2D049),
                                    ),
                                    Text(
                                      " + ${mission.xpReward.toString()} XP",
                                      style: TextStyle(
                                        color: Color(0xFFF2D049),
                                        fontWeight: FontWeight.w700,
                                        fontSize: 10,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                    ),
                                  ],
                                )),
                            Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.2,
                                ),
                                SizedBox(
                                  width: 99,
                                  height: 25,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color(0xffEEF1FF),
                                      foregroundColor: const Color(0xff5271FF),
                                      textStyle: const TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    child: Text(
                                      mission.isActive ? "ACTIVE" : "INACTIVE",
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )
                      ],
                    ))
              ],
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.011,),
      ],
    );*/
  }
}
