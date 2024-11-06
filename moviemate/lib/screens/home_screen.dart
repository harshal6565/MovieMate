import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/movie_service.dart';
import '../utils/contants.dart';
import '../widgets/movie_list.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  final MovieService _movieService = MovieService();

  List<Movie> _movies = [];
  bool _isLoading = false;
  String _error = '';

  Future<void> _searchMovies(String query) async {
    if (query.isEmpty) return;

    setState(() {
      _isLoading = true;
      _error = '';
    });

    final result = await _movieService.searchMovies(query);

    setState(() {
      if (result['success']) {
        _movies = result['data'];
        _error = '';
      } else {
        _movies = [];
        _error = result['error'] ?? AppConstants.errorMessage;
      }
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: const Color(0xFFF5F5F5),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFF5F5F5),
        ),
        child: Column(
          children: [
            MovieSearchBar(
              controller: _searchController,
              onSubmitted: _searchMovies,
              onChanged: () => setState(() {}),
            ),
            Expanded(
              child: MovieList(
                isLoading: _isLoading,
                error: _error,
                movies: _movies,
                onRetry: () => _searchMovies(_searchController.text),
                searchQuery: _searchController.text,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
