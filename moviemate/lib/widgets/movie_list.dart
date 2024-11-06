import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../utils/contants.dart';
import 'movie_card.dart';

class MovieList extends StatelessWidget {
  final bool isLoading;
  final String error;
  final List<Movie> movies;
  final VoidCallback onRetry;
  final String searchQuery;

  const MovieList({
    super.key,
    required this.isLoading,
    required this.error,
    required this.movies,
    required this.onRetry,
    required this.searchQuery,
  });

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    if (error.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              color: Colors.red,
              size: 60,
            ),
            const SizedBox(height: 16),
            Text(
              error,
              style: AppTextStyles.medium.copyWith(
                fontSize: 16,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onRetry,
              child: const Text('Try Again'),
            ),
          ],
        ),
      );
    }

    if (movies.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.movie_outlined,
              size: 60,
              color: AppColors.grey.withOpacity(0.4),
            ),
            const SizedBox(height: 16),
            const Text(
              AppConstants.emptySearchMessage,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: movies.length,
      itemBuilder: (context, index) {
        return MovieCard(movie: movies[index]);
      },
    );
  }
}
