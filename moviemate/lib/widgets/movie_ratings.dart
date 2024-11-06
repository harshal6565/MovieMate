import 'package:flutter/material.dart';
import '../utils/contants.dart';

class MovieRatings extends StatelessWidget {
  final List<dynamic> ratings;

  const MovieRatings({
    super.key,
    required this.ratings,
  });

  @override
  Widget build(BuildContext context) {
    if (ratings.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            for (var rating in ratings)
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color:
                        Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${rating['Source']}: ',
                        style: AppTextStyles.semiBold.copyWith(
                          fontSize: 14,
                          color: AppColors.black,
                        ),
                      ),
                      Text(
                        rating['Value'],
                        style: AppTextStyles.medium.copyWith(
                          fontSize: 14,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
