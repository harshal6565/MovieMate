import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../utils/contants.dart';
import '../utils/color_helper.dart';
import '../services/movie_service.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final MovieService _movieService = MovieService();

  MovieCard({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.defaultPadding,
        vertical: 8,
      ),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.28,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * 0.17,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () async {
                    final details =
                        await _movieService.getMovieDetails(movie.imdbID);
                    if (details['success'] && context.mounted) {
                      Navigator.pushNamed(
                        context,
                        '/movie-details',
                        arguments: details['data'],
                      );
                    }
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 170, right: 10, top: 12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: AppTextStyles.semiBold.copyWith(
                            fontSize: 18,
                            color: AppColors.black,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        if (movie.genre != null && movie.genre!.isNotEmpty)
                          Text(
                            movie.formattedGenre,
                            style: AppTextStyles.medium.copyWith(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Helpers.getRatingColor(movie.imdbRating),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                movie.imdbRating!,
                                style: AppTextStyles.semiBold.copyWith(
                                  fontSize: 12,
                                  color: AppColors.white,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'IMDB',
                                style: AppTextStyles.medium.copyWith(
                                  fontSize: 12,
                                  color: AppColors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 16,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.35,
                height: MediaQuery.of(context).size.height * 0.25,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: movie.poster != 'N/A'
                      ? Image.network(
                          movie.poster,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            color: AppColors.grey.withOpacity(0.2),
                            child: const Icon(
                              Icons.movie,
                              size: 40,
                              color: AppColors.grey,
                            ),
                          ),
                        )
                      : Container(
                          color: AppColors.grey.withOpacity(0.2),
                          child: const Icon(
                            Icons.movie,
                            size: 40,
                            color: AppColors.grey,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
