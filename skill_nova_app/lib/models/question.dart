

import 'package:flutter/foundation.dart';

@immutable
class Question {
  final String question;
  final List<String> options;
  final int correctOptionIndex;

  const Question({
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });

  Question copy({
    String? question,
    List<String>? options,
    int? correctOptionIndex,
  }) => Question(
    question: question ?? this.question,
    options: options ?? this.options,
    correctOptionIndex: correctOptionIndex ?? this.correctOptionIndex,
  );

  factory Question.fromJSON(Map<String, dynamic> json) => Question(
    question: json['question'] as String,
    options: List<String>.from(json['options'] as List<dynamic>),
    correctOptionIndex: json['correct_option_index'] as int,
  );

  Map<String, dynamic> toJSON() => {
    'question': question,
    'options': options,
    'correct_option_index': correctOptionIndex,
  };
}