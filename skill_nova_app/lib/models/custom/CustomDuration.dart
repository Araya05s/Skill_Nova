import 'package:flutter/foundation.dart';

@immutable
class CustomDuration {
  final int years;
  final int months;
  final int days;

  const CustomDuration({
    this.years = 0,
    this.months = 0,
    this.days = 0,
  });

  static CustomDuration fromString(String durationString) {
    // Initialize variables for years, months, and days
    int years = 0;
    int months = 0;
    int days = 0;

    // Regular expression to match the format of the string
    final regex = RegExp(r'(\d+)\s*(year|month|day)s?');

    // Use the regex to find all matches in the string
    final matches = regex.allMatches(durationString.trim());

    // Iterate over all matches and extract the values
    for (final match in matches) {
      final number = int.parse(match.group(1)!);
      final unit = match.group(2);

      // Assign values based on the unit
      if (unit == 'year') {
        years = number;
      } else if (unit == 'month') {
        months = number;
      } else if (unit == 'day') {
        days = number;
      }
    }

    // Return a new CustomDuration object
    return CustomDuration(years: years, months: months, days: days);
  }

  @override
  String toString() {
    List<String> parts = [];
    if (years > 0) parts.add('$years year${years > 1 ? 's' : ''}');
    if (months > 0) parts.add('$months month${months > 1 ? 's' : ''}');
    if (days > 0) parts.add('$days day${days > 1 ? 's' : ''}');
    return parts.isNotEmpty ? parts.join(' ') : '0 days';
  }

  factory CustomDuration.fromJson(Map<String, dynamic> json) {
    return CustomDuration(
      years: json['years'] ?? 0,
      months: json['months'] ?? 0,
      days: json['days'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'years': years,
      'months': months,
      'days': days,
    };
  }
}
