import 'dart:io';

import 'package:flutter/material.dart';
import 'package:skill_nova_app/models/challenge.dart';

class ChallengeListTile extends StatelessWidget {
  const ChallengeListTile(
      {super.key, required this.challenge, required this.courseCategoryName});

  final Challenge challenge;
  final String? courseCategoryName;

  @override
  Widget build(BuildContext context) {
    final File challengeImage = File(challenge.image);

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
                challengeImage,
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
                      challenge.title,
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
                      "${challenge.questions.length.toString()} Questions",
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.49,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            "Tingkat Kesulitan : ",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          ),
                          Text(
                            challenge.difficulty.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5,),
                    Row(
                      children: [
                        const Icon(Icons.star,
                            size: 16, color: Color(0xFFF2D049)),
                        Text(
                          " + ${challenge.xpReward} XP",
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
                  challenge.isActive ? "ACTIVE" : "INACTIVE",
                  style: TextStyle(
                    color: challenge.isActive ? Colors.green : Colors.red,
                  ),
                ),
                backgroundColor:
                    challenge.isActive ? Colors.green[50] : Colors.red[50],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
