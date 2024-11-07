import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';
import '../utils/contants.dart';

class MovieSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onSubmitted;
  final VoidCallback onChanged;

  const MovieSearchBar({
    super.key,
    required this.controller,
    required this.onSubmitted,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
      builder: (context, movieProvider, _) {
        return Padding(
          padding: const EdgeInsets.all(AppConstants.defaultPadding),
          child: TextField(
            controller: controller,
            textInputAction: TextInputAction.search,
            style: AppTextStyles.light.copyWith(fontSize: 16),
            decoration: InputDecoration(
              hintText: AppConstants.searchHint,
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.zero,
                borderSide: BorderSide(color: Colors.black),
              ),
              suffixIcon: controller.text.isNotEmpty
                  ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        controller.clear();
                        movieProvider.clearSearch();
                        onChanged();
                      },
                    )
                  : const Icon(Icons.search),
            ),
            onChanged: (value) {
              onChanged();
            },
            onSubmitted: onSubmitted,
          ),
        );
      },
    );
  }
}
