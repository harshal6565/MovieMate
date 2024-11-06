import 'package:flutter/material.dart';
import 'package:moviemate/screens/home_screen.dart';
import 'package:moviemate/screens/movie_details_screen.dart';
import 'package:moviemate/screens/splash_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => const SplashScreen(),
  '/home': (context) => const HomeScreen(),
  '/movie-details': (context) => const MovieDetailsScreen(),
};
