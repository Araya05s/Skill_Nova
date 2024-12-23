import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:skill_nova_app/models/custom/CustomDuration.dart';

const String courseCategoriesTable = 'course_categories';

class CourseCategoryFields {
  static final List<String> values = [
    id,
    title,
    skills,
    lowerDuration,
    upperDuration,
    certificateType,
    tags,
    image
  ];

  static const id = 'id';
  static const title = 'title';
  static const skills = 'skills';
  static const lowerDuration = 'lower_duration';
  static const upperDuration = 'upper_duration';
  static const certificateType = 'certificate_type';
  static const tags = 'tags';
  static const image = 'image';
}

@immutable
class CourseCategory {
  final int? id;
  final String title;
  final List<String> skills;
  final CustomDuration lowerDuration;
  final CustomDuration upperDuration;
  final String certificateType;
  final List<String> tags;
  final String image;

  const CourseCategory(
      {this.id,
      required this.title,
      required this.skills,
      required this.lowerDuration,
      required this.upperDuration,
      required this.certificateType,
      required this.tags,
      required this.image});

  String getDuration() {
    final String minimum = lowerDuration.toStringTopper();
    final String maximum = upperDuration.toStringTopper();

    if (minimum == maximum) return minimum;

    final String commonUnit = minimum.replaceAll(RegExp(r'[\s\d]'), '');
    if (commonUnit == maximum.replaceAll(RegExp(r'[\s\d]'), '')) {
      return '${int.parse(minimum.replaceAll(RegExp(r'\D'), ''))} - $maximum';
    }

    return '$minimum – $maximum';
  }

  CourseCategory copy(
          {int? id,
          String? title,
          List<String>? skills,
          CustomDuration? lowerDuration,
          CustomDuration? upperDuration,
          String? certificateType,
          List<String>? tags,
          String? image}) =>
      CourseCategory(
          id: id ?? this.id,
          title: title ?? this.title,
          skills: skills ?? this.skills,
          lowerDuration: lowerDuration ?? this.lowerDuration,
          upperDuration: upperDuration ?? this.upperDuration,
          certificateType: certificateType ?? this.certificateType,
          tags: tags ?? this.tags,
          image: image ?? this.image);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      CourseCategoryFields.id: id,
      CourseCategoryFields.title: title,
      CourseCategoryFields.skills: json.encode(skills),
      CourseCategoryFields.lowerDuration: lowerDuration.toString(),
      CourseCategoryFields.upperDuration: upperDuration.toString(),
      CourseCategoryFields.certificateType: certificateType,
      CourseCategoryFields.tags: json.encode(tags),
      CourseCategoryFields.image: image
    };
  }

  factory CourseCategory.fromMap(Map<String, dynamic> map) {
    return CourseCategory(
        id: map[CourseCategoryFields.id] != null
            ? map[CourseCategoryFields.id] as int
            : null,
        title: map[CourseCategoryFields.title] as String,
        skills:
            List<String>.from(json.decode(map[CourseCategoryFields.skills])),
        lowerDuration: CustomDuration.fromString(
            map[CourseCategoryFields.lowerDuration] as String),
        upperDuration: CustomDuration.fromString(
            map[CourseCategoryFields.upperDuration] as String),
        certificateType: map[CourseCategoryFields.certificateType] as String,
        tags: List<String>.from(json.decode(map[CourseCategoryFields.tags])),
        image: map[CourseCategoryFields.image] as String);
  }
}
