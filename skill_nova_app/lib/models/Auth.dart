/*
import 'dart:convert';

import 'package:duration/duration.dart';
import 'package:flutter/foundation.dart';
import 'package:skill_nova_app/models/question.dart';

const String challengesTable = 'auth';

class Users {
  static final List<String> values = [
    userid,
    fullName,
    email,
    username,
    userpassword
  ];

  static const userid = 'userid';
  static const fullName = 'fullName';
  static const email = 'email';
  static const username = 'username';
  static const userpassword = 'userpassword';
}


@immutable
class User {
  final int? userid;
  final String fullName;
  final String email;
  final String questions;
  final String userpassword;

  const User({
    this.userid,
    required this.fullName,
    required this.email,
    required this.questions,
    required this.userpassword,
  });

  User copy({
    int? userid,
    String? fullName,
    String? email,
    String? questions,
    String? userpassword,

  }) =>
      User(
        id: id ?? this.id,
        categoryId: categoryId ?? this.categoryId,
        title: title ?? this.title,
        questions: questions ?? this.questions,
        difficulty: difficulty ?? this.difficulty,
        xpReward: xpReward ?? this.xpReward,
        duration: duration ?? this.duration,
        image: image ?? this.image,
        isActive: isActive ?? this.isActive,
      );

  factory Challenge.fromJSON(Map<String, dynamic> json) {
    return Challenge(
      id: json[ChallengeFields.id] as int?,
      categoryId: json[ChallengeFields.categoryId] as int,
      title: json[ChallengeFields.title] as String,
      questions: (jsonDecode(json[ChallengeFields.questions]) as List<dynamic>).map((question) => Question.fromJSON(question as Map<String, dynamic>)).toList(),
      difficulty: Difficulty.values.firstWhere(
            (element) => element.toString() == 'Difficulty.${json[ChallengeFields.difficulty]}',
      ),
      xpReward: json[ChallengeFields.xpReward] as int,
      duration: parseTime(json[ChallengeFields.duration] as String),
      image: json[ChallengeFields.image] as String,
      isActive: (json[ChallengeFields.isActive] as int) == 1,
    );
  }

  Map<String, dynamic> toJSON() {
    return <String, dynamic>{
      ChallengeFields.id: id,
      ChallengeFields.categoryId: categoryId,
      ChallengeFields.title: title,
      ChallengeFields.questions: jsonEncode(questions.map((question) => question.toJSON()).toList()),
      ChallengeFields.difficulty: difficulty.name,
      ChallengeFields.xpReward: xpReward,
      ChallengeFields.duration: duration.toString(),
      ChallengeFields.image: image,
      ChallengeFields.isActive: isActive ? 1 : 0
    };
  }
}
*/
