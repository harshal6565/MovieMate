import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/movie.dart';
import '../utils/config.dart';

class MovieService {
  Future<Map<String, dynamic>> searchMovies(String query) async {
    try {
      final response = await http.get(
        Uri.parse(
            '${ApiConstants.baseUrl}/?s=$query&apikey=${ApiConstants.apiKey}'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['Response'] == 'True') {
          final List<Movie> movies = [];

          for (var item in data['Search']) {
            final detailResponse = await http.get(
              Uri.parse(
                  '${ApiConstants.baseUrl}/?i=${item['imdbID']}&apikey=${ApiConstants.apiKey}'),
            );

            if (detailResponse.statusCode == 200) {
              final detailData = json.decode(detailResponse.body);

              final Map<String, dynamic> mergedData = {
                'Title': item['Title'],
                'Year': item['Year'],
                'imdbID': item['imdbID'],
                'Poster': item['Poster'],
                'Genre': detailData['Genre'],
                'imdbRating': detailData['imdbRating'],
              };
              movies.add(Movie.fromSearchJson(mergedData));
            }
          }

          return {
            'success': true,
            'data': movies,
            'error': null,
          };
        } else {
          return {
            'success': false,
            'data': [],
            'error': data['Error'] ?? 'No movies found',
          };
        }
      } else {
        return {
          'success': false,
          'data': [],
          'error': 'Failed to fetch movies',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'data': [],
        'error': 'Error searching movies: $e',
      };
    }
  }

  Future<Map<String, dynamic>> getMovieDetails(String imdbId) async {
    try {
      final response = await http.get(
        Uri.parse(
            '${ApiConstants.baseUrl}/?i=$imdbId&apikey=${ApiConstants.apiKey}'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['Response'] == 'True') {
          return {
            'success': true,
            'data': Map<String, dynamic>.from(data),
            'error': null,
          };
        } else {
          return {
            'success': false,
            'data': null,
            'error': data['Error'] ?? 'Movie details not found',
          };
        }
      } else {
        return {
          'success': false,
          'data': null,
          'error': 'Failed to fetch movie details',
        };
      }
    } catch (e) {
      return {
        'success': false,
        'data': null,
        'error': 'Error getting movie details: $e',
      };
    }
  }
}
