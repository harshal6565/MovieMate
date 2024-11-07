import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';

class MovieProvider with ChangeNotifier {
  final MovieService _movieService = MovieService();

  List<Movie> _movies = [];
  bool _isLoading = false;
  String _error = '';
  String _searchQuery = '';
  Map<String, dynamic>? _selectedMovie;

  // Getters
  List<Movie> get movies => _movies;
  bool get isLoading => _isLoading;
  String get error => _error;
  String get searchQuery => _searchQuery;
  Map<String, dynamic>? get selectedMovie => _selectedMovie;

  // Search Movies
  Future<void> searchMovies(String query) async {
    if (query.isEmpty) return;

    _searchQuery = query;
    _isLoading = true;
    _error = '';
    notifyListeners();

    final result = await _movieService.searchMovies(query);

    _isLoading = false;
    if (result['success']) {
      _movies = result['data'];
      _error = '';
    } else {
      _movies = [];
      _error = result['error'] ?? 'Something went wrong';
    }
    notifyListeners();
  }

  // Get Movie Details
  Future<void> getMovieDetails(String imdbId) async {
    _isLoading = true;
    notifyListeners();

    final result = await _movieService.getMovieDetails(imdbId);

    _isLoading = false;
    if (result['success']) {
      _selectedMovie = result['data'];
    } else {
      _error = result['error'] ?? 'Failed to load movie details';
    }
    notifyListeners();
  }

  // Clear Selected Movie
  void clearSelectedMovie() {
    _selectedMovie = null;
    notifyListeners();
  }

  // Clear Search Results
  void clearSearch() {
    _movies = [];
    _searchQuery = '';
    _error = '';
    notifyListeners();
  }
}
