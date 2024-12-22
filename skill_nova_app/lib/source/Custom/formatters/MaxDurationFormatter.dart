import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MaxDurationFormatter extends TextInputFormatter {
  final TextEditingController lowerYearsController;
  final TextEditingController lowerMonthsController;
  final TextEditingController lowerDaysController;
  final String unit;

  MaxDurationFormatter({
    required this.lowerYearsController,
    required this.lowerMonthsController,
    required this.lowerDaysController,
    required this.unit,
  });

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Parse the lower duration values
    final int lowerYears = int.tryParse(lowerYearsController.text) ?? 0;
    final int lowerMonths = int.tryParse(lowerMonthsController.text) ?? 0;
    final int lowerDays = int.tryParse(lowerDaysController.text) ?? 0;

    // Parse the input value
    int newInput = int.tryParse(newValue.text) ?? 0;

    // Total minimum duration in days
    final int totalLowerDuration = (lowerYears * 365) + (lowerMonths * 30) + lowerDays;

    // Current total maximum duration in days (with new input for the respective field)
    int totalUpperDuration;
    if (unit == 'year') {
      totalUpperDuration = (newInput * 365) + (lowerMonths * 30) + lowerDays;
    } else if (unit == 'month') {
      totalUpperDuration = (lowerYears * 365) + (newInput * 30) + lowerDays;
    } else if (unit == 'day') {
      totalUpperDuration = (lowerYears * 365) + (lowerMonths * 30) + newInput;
    } else {
      return oldValue; // Invalid unit
    }

    // Reject the new input if the maximum duration becomes less than the minimum duration
    if (totalUpperDuration < totalLowerDuration) {
      return oldValue;
    }

    return newValue;
  }
}
