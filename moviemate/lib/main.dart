import 'package:flutter/material.dart';
import 'package:moviemate/app/app.dart';
import 'package:provider/provider.dart';
import 'package:moviemate/providers/movie_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MovieProvider(),
      child: const MyApp(),
    ),
  );
}
