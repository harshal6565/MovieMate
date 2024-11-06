import 'package:flutter/material.dart';
import '../widgets/movie_header.dart';
import '../widgets/movie_ratings.dart';
import '../widgets/movie_section.dart';
import '../widgets/movie_info_row.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final movieDetails =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieHeader(
              posterUrl: movieDetails['Poster'] ?? 'N/A',
              title: movieDetails['Title'] ?? '',
              year: movieDetails['Year'] ?? '',
              runtime: movieDetails['Runtime'] ?? '',
              genre: movieDetails['Genre'] ?? '',
            ),
            if (movieDetails['Ratings']?.isNotEmpty)
              MovieRatings(ratings: movieDetails['Ratings']),
            MovieSection(
              title: 'Plot',
              content: movieDetails['Plot'] ?? 'No plot available',
            ),
            MovieSection(
              title: 'Cast',
              content:
                  movieDetails['Actors'] ?? 'No cast information available',
            ),
            MovieSection(
              title: 'Director',
              content: movieDetails['Director'] ??
                  'No director information available',
            ),
            MovieSection(
              title: 'Writer',
              content:
                  movieDetails['Writer'] ?? 'No writer information available',
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieInfoRow(
                      label: 'Released', value: movieDetails['Released']),
                  MovieInfoRow(
                      label: 'Runtime', value: movieDetails['Runtime']),
                  MovieInfoRow(
                      label: 'Language', value: movieDetails['Language']),
                  MovieInfoRow(
                      label: 'Country', value: movieDetails['Country']),
                  MovieInfoRow(label: 'Awards', value: movieDetails['Awards']),
                  MovieInfoRow(
                      label: 'Box Office', value: movieDetails['BoxOffice']),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
