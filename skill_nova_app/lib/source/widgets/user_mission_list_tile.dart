import 'dart:io';

import 'package:flutter/material.dart';
import 'package:skill_nova_app/models/mission.dart';

class UserMissionListTile extends StatelessWidget {
  const UserMissionListTile(
      {super.key, required this.mission, required this.courseCategoryName});

  final Mission mission;
  final String? courseCategoryName;

  @override
  Widget build(BuildContext context) {
    final File missionImage = File(mission.image);

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
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5),
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5),
                      ),
                      child: Image.file(
                        missionImage,
                        width: 100,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            mission.title,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.49,
                          child: Row(
                            children: [
                              const Text(
                                "Kategori: ",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                              Text(
                                courseCategoryName ?? "Semua Kategori",
                                style: TextStyle(
                                  color: Color(0xFFF2D049),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 9,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.49,
                          child: Text(
                            "0 dari ${mission.courseMaterialsCount} Materi Belajar Terselesaikan",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        const SizedBox(height: 3),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.49,
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                size: 16,
                                color: Color(0xFFF2D049),
                              ),
                              Text(
                                "+ ${mission.xpReward} XP",
                                style: TextStyle(
                                  color: Color(0xFFF2D049),
                                  fontWeight: FontWeight.w700,
                                  fontSize: 10,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.36,
                            ),
                            SizedBox(
                              width: 110,
                              height: 25,
                              child: ElevatedButton(
                                onPressed: () {

                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffEEF1FF),
                                  foregroundColor: const Color(0xff5271FF),
                                  textStyle: const TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold),
                                ),
                                child: const Text("AKTIFKAN"),
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}

/*                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.011,
                      ),*/
