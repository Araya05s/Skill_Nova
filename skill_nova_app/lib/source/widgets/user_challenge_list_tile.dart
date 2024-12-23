import 'dart:io';

import 'package:flutter/material.dart';
import 'package:skill_nova_app/models/challenge.dart';

class UserChallengeListTile extends StatelessWidget {
  const UserChallengeListTile(
      {super.key, required this.challenge, required this.courseCategoryName});

  final Challenge challenge;
  final String? courseCategoryName;

  Color getDifficultyColor(String difficultyName) {
    switch (difficultyName) {
      case 'Muda':
        return Color(0xff1EFF2D); // Green
      case 'Sedang':
        return Color(0xffFFFF00); // Yellow
      case 'Sulit':
        return Color(0xffFF0000); // Red
      default:
        return Colors.black; // Default color
    }
  }

  @override
  Widget build(BuildContext context) {
    final File challengeImage = File(challenge.image);

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
                        challengeImage,
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
                              challenge.title,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Text(
                                  "Tingkat Kesulitan: ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                  ),
                                ),
                                Text(
                                  challenge.difficulty.name,
                                  style: TextStyle(
                                    color: getDifficultyColor(
                                        challenge.difficulty.name),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 11,
                                  ),
                                ),
                              ],
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
                                  "+ ${challenge.xpReward} XP",
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
                                width: MediaQuery.of(context).size.width * 0.40,
                              ),
                              SizedBox(
                                width: 85,
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
                                  child: const Text("MULAI"),
                                ),
                              ),
                            ],
                          )
                        ]
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}

/*                           SizedBox(
                            height: MediaQuery.of(context).size.height * 0.0115,
                          ), */
