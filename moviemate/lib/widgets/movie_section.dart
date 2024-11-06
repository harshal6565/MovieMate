import 'package:flutter/material.dart';
import '../utils/contants.dart';

class MovieSection extends StatelessWidget {
  final String title;
  final String content;

  const MovieSection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.semiBold.copyWith(
              fontSize: 18,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: AppTextStyles.light.copyWith(
              fontSize: 16,
              height: 1.5,
              color: AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
