import 'dart:convert';

import 'package:duration/duration.dart';
import 'package:flutter/foundation.dart';
import 'package:skill_nova_app/models/question.dart';

const String challengesTable = 'challenges';

class ChallengeFields {
  static final List<String> values = [
    id,
    categoryId,
    title,
    questions,
    difficulty,
    xpReward,
    duration,
    image,
    isActive,
  ];

  static const id = 'id';
  static const categoryId = 'category_id';
  static const title = 'title';
  static const questions = 'questions';
  static const difficulty = 'difficulty';
  static const xpReward = 'xp_reward';
  static const duration = 'duration';
  static const image = 'image';
  static const isActive = 'is_active';
}

enum Difficulty { Muda, Sedang, Sulit }

@immutable
class Challenge {
  final int? id;
  final int categoryId;
  final String title;
  final List<Question> questions;
  final Difficulty difficulty;
  final int xpReward;
  final Duration duration;
  final String image;
  final bool isActive;

  const Challenge({
    this.id,
    required this.categoryId,
    required this.title,
    this.questions = const [],
    required this.difficulty,
    required this.xpReward,
    required this.duration,
    required this.image,
    required this.isActive,
  });

  Challenge copy({
    int? id,
    int? categoryId,
    String? title,
    List<Question>? questions,
    Difficulty? difficulty,
    int? xpReward,
    Duration? duration,
    String? image,
    bool? isActive,
  }) =>
      Challenge(
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
