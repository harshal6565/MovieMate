import 'package:flutter/material.dart';
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
    return Padding(
      padding: const EdgeInsets.all(AppConstants.defaultPadding),
      child: TextField(
        controller: controller,
        textInputAction: TextInputAction.search,
        style: AppTextStyles.light.copyWith(fontSize: 16),
        decoration: const InputDecoration(
          hintText: AppConstants.searchHint,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.black),
          ),
          suffixIcon: Icon(Icons.search),
        ),
        onChanged: (_) => onChanged(),
        onSubmitted: onSubmitted,
      ),
    );
  }
}
