import 'package:flutter/material.dart';
import '../utils/contants.dart';

class MovieHeader extends StatelessWidget {
  final String posterUrl;
  final String title;
  final String year;
  final String runtime;
  final String genre;

  const MovieHeader({
    super.key,
    required this.posterUrl,
    required this.title,
    required this.year,
    required this.runtime,
    required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.black,
            image: posterUrl != 'N/A'
                ? DecorationImage(
                    image: NetworkImage(posterUrl),
                    fit: BoxFit.cover,
                    opacity: 0.3,
                  )
                : null,
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.38,
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: posterUrl != 'N/A'
                    ? Image.network(
                        posterUrl,
                        height: 180,
                        width: 120,
                        fit: BoxFit.cover,
                      )
                    : Container(
                        height: 180,
                        width: 120,
                        color: Colors.grey[300],
                        child: const Icon(Icons.movie, size: 50),
                      ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTextStyles.bold.copyWith(
                        fontSize: 24,
                        color: AppColors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '$year • $runtime',
                      style: AppTextStyles.medium.copyWith(
                        fontSize: 16,
                        color: AppColors.white.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      genre,
                      style: AppTextStyles.light.copyWith(
                        fontSize: 14,
                        color: AppColors.white.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
