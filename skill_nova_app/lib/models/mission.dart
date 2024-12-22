import 'dart:convert';

import 'package:duration/duration.dart';
import 'package:flutter/foundation.dart';

const String missionsTable = 'missions';

class MissionFields {
  static final List<String> values = [
    id,
    categoryId,
    title,
    courseMaterials,
    courseMaterialsCount,
    xpReward,
    duration,
    image,
    isActive,
  ];

  static const id = 'id';
  static const categoryId = 'category_id';
  static const title = 'title';
  static const courseMaterials = 'course_materials';
  static const courseMaterialsCount = 'course_materials_count';
  static const xpReward = 'xp_reward';
  static const duration = 'duration';
  static const image = 'image';
  static const isActive = 'is_active';
}

@immutable
class Mission {
  final int? id;
  final int categoryId;
  final String title;
  final List<int> courseMaterials;
  final int courseMaterialsCount;
  final int xpReward;
  final Duration duration;
  final String image;
  final bool isActive;

  const Mission({
    this.id,
    required this.categoryId,
    required this.title,
    this.courseMaterials = const [],
    required this.courseMaterialsCount,
    required this.xpReward,
    required this.duration,
    required this.image,
    required this.isActive,
  });

  Mission copy({
    int? id,
    int? categoryId,
    String? title,
    List<int>? courseMaterials,
    int? courseMaterialsCount,
    int? xpReward,
    Duration? duration,
    String? image,
    bool? isActive,
  }) => Mission(
    id: id ?? this.id,
    categoryId: categoryId ?? this.categoryId,
    title: title ?? this.title,
    courseMaterials: courseMaterials ?? this.courseMaterials,
    courseMaterialsCount: courseMaterialsCount ?? this.courseMaterialsCount,
    xpReward: xpReward ?? this.xpReward,
    duration: duration ?? this.duration,
    image: image ?? this.image,
    isActive: isActive ?? this.isActive,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      MissionFields.id: id,
      MissionFields.categoryId: categoryId,
      MissionFields.title: title,
      MissionFields.courseMaterials: json.encode(courseMaterials),
      MissionFields.courseMaterialsCount: courseMaterialsCount,
      MissionFields.xpReward: xpReward,
      MissionFields.duration: duration.toString(),
      MissionFields.image: image,
      MissionFields.isActive: isActive ? 1 : 0,
    };
  }

  factory Mission.fromMap(Map<String, dynamic> map) {
    return Mission(
      id: map[MissionFields.id] as int?,
      categoryId: map[MissionFields.categoryId] as int,
      title: map[MissionFields.title] as String,
      courseMaterials: List<int>.from(json.decode(map[MissionFields.courseMaterials])),
      courseMaterialsCount: map[MissionFields.courseMaterialsCount] as int,
      xpReward: map[MissionFields.xpReward] as int,
      duration: parseTime(map[MissionFields.duration] as String),
      image: map[MissionFields.image] as String,
      isActive: (map[MissionFields.isActive] as int) == 1,
    );
  }

}

