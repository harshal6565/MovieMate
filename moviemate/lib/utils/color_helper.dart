import 'package:flutter/material.dart';
import 'package:moviemate/utils/contants.dart';

class Helpers {
  static Color getRatingColor(String? rating) {
    if (rating == null || rating == 'N/A') return AppColors.grey;

    final double numericRating = double.tryParse(rating) ?? 0;

    if (numericRating >= 7) {
      return AppColors.green;
    } else if (numericRating >= 4) {
      return AppColors.blue;
    } else {
      return Colors.red;
    }
  }

  static String formatRating(String? rating) {
    if (rating == null || rating == 'N/A') return '0.0';
    return rating;
  }
}
