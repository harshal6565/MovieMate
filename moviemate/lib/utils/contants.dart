import 'package:flutter/material.dart';

class AppConstants {
  static const String appName = 'MovieMate';
  static const String searchHint = 'Search';
  static const String emptySearchMessage = 'Search for your favorite movies!';
  static const String errorMessage = 'Something went wrong. Please try again.';
  static const String noMoviesFound = 'No movies found';

  static const double cardElevation = 2.0;
  static const double borderRadius = 12.0;
  static const double defaultPadding = 16.0;
  static const double posterWidth = 50.0;
  static const double posterHeight = 75.0;
  static const double radius = 12.0;
}

class AppColors {
  static const Color black = Color(0xFF212121);
  static const Color green = Color(0xFF5EC570);
  static const Color blue = Color(0xFF1C7EEB);
  static const Color grey = Color(0xFF262E2E);
  static const Color white = Color(0xFFFFFFFF);
}

class AppTextStyles {
  static const String fontFamily = 'Montserrat';

  // Light - 300
  static const TextStyle light = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
  );

  static const TextStyle lightItalic = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w300,
    fontStyle: FontStyle.italic,
  );

  // Medium - 500
  static const TextStyle medium = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle mediumItalic = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );

  // SemiBold - 600
  static const TextStyle semiBold = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle semiBoldItalic = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w600,
    fontStyle: FontStyle.italic,
  );

  // Bold - 700
  static const TextStyle bold = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle boldItalic = TextStyle(
    fontFamily: fontFamily,
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
  );

  // Predefined text styles
  static TextStyle get heading1 => bold.copyWith(
        fontSize: 28,
        color: AppColors.black,
      );

  static TextStyle get heading2 => semiBold.copyWith(
        fontSize: 24,
        color: AppColors.black,
      );

  static TextStyle get heading3 => semiBold.copyWith(
        fontSize: 20,
        color: AppColors.black,
      );

  static TextStyle get subtitle1 => medium.copyWith(
        fontSize: 16,
        color: AppColors.grey,
      );

  static TextStyle get subtitle2 => medium.copyWith(
        fontSize: 14,
        color: AppColors.grey,
      );

  static TextStyle get bodyText1 => light.copyWith(
        fontSize: 16,
        color: AppColors.black,
      );

  static TextStyle get bodyText2 => light.copyWith(
        fontSize: 14,
        color: AppColors.black,
      );

  static TextStyle get button => semiBold.copyWith(
        fontSize: 16,
        color: AppColors.white,
      );

  static TextStyle get caption => lightItalic.copyWith(
        fontSize: 12,
        color: AppColors.grey,
      );
}

class AppTheme {
  static ThemeData theme = ThemeData(
    useMaterial3: true,
    fontFamily: AppTextStyles.fontFamily,

    // Colors
    primaryColor: AppColors.blue,
    scaffoldBackgroundColor: AppColors.white,

    // Color Scheme
    colorScheme: const ColorScheme.light(
      primary: AppColors.blue,
      secondary: AppColors.green,
      onPrimary: AppColors.white,
      onSecondary: AppColors.white,
    ),

    // AppBar Theme
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.blue,
      foregroundColor: AppColors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        fontFamily: AppTextStyles.fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: AppColors.white,
      ),
    ),

    // Text Theme
    textTheme: TextTheme(
      // Large titles
      headlineLarge: AppTextStyles.heading1,
      headlineMedium: AppTextStyles.heading2,
      headlineSmall: AppTextStyles.heading3,

      // Subtitles
      titleLarge: AppTextStyles.subtitle1,
      titleMedium: AppTextStyles.subtitle2,

      // Body text
      bodyLarge: AppTextStyles.bodyText1,
      bodyMedium: AppTextStyles.bodyText2,

      // Other
      labelLarge: AppTextStyles.button,
      bodySmall: AppTextStyles.caption,
    ),

    // Input Decoration
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radius),
        borderSide: const BorderSide(color: AppColors.blue),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radius),
        borderSide: const BorderSide(color: AppColors.blue),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radius),
        borderSide: const BorderSide(color: AppColors.blue, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstants.radius),
        borderSide: const BorderSide(color: Colors.red),
      ),
      hintStyle: AppTextStyles.bodyText2.copyWith(color: AppColors.grey),
    ),
  );
}
