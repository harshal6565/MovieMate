import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../widgets/movie_list.dart';
import '../widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, movieProvider, child) {
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
                  onSubmitted: movieProvider.searchMovies,
                  onChanged: () => setState(() {}),
                ),
                Expanded(
                  child: MovieList(
                    isLoading: movieProvider.isLoading,
                    error: movieProvider.error,
                    movies: movieProvider.movies,
                    onRetry: () =>
                        movieProvider.searchMovies(_searchController.text),
                    searchQuery: _searchController.text,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
