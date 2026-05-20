import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Light Theme Colors
  static const Color _lightPrimary = Color(0xFF4F46E5);
  static const Color _lightSecondary = Color(0xFF10B981);
  static const Color _lightAccent = Color(0xFFF59E0B);
  static const Color _lightBackground = Color(0xFFF9FAFB);
  static const Color _lightSurface = Color(0xFFFFFFFF);
  static const Color _lightError = Color(0xFFEF4444);
  static const Color _lightSuccess = Color(0xFF22C55E);
  static const Color _lightOnPrimary = Color(0xFFFFFFFF);
  static const Color _lightOnSecondary = Color(0xFFFFFFFF);
  static const Color _lightOnBackground = Color(0xFF111827);
  static const Color _lightOnSurface = Color(0xFF1F2937);

  // Dark Theme Colors
  static const Color _darkPrimary = Color(0xFF6366F1);
  static const Color _darkSecondary = Color(0xFF34D399);
  static const Color _darkAccent = Color(0xFFFBBF24);
  static const Color _darkBackground = Color(0xFF111827);
  static const Color _darkSurface = Color(0xFF1F2937);
  static const Color _darkError = Color(0xFFF87171);
  static const Color _darkSuccess = Color(0xFF4ADE80);
  static const Color _darkOnPrimary = Color(0xFFFFFFFF);
  static const Color _darkOnSecondary = Color(0xFF000000);
  static const Color _darkOnBackground = Color(0xFFF9FAFB);
  static const Color _darkOnSurface = Color(0xFFE5E7EB);

  // Text Styles
  static const TextStyle _h1Style = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
  );

  static const TextStyle _h2Style = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    letterSpacing: -0.25,
  );

  static const TextStyle _h3Style = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle _h4Style = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

  static const TextStyle _bodyStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
  );

  static const TextStyle _captionStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle _smallStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  // Spacing
  static const double spacingXs = 4;
  static const double spacingSm = 8;
  static const double spacingMd = 16;
  static const double spacingLg = 24;
  static const double spacingXl = 32;
  static const double spacingXxl = 48;

  // Light Theme
  static ThemeData get lightTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        primaryColor: _lightPrimary,
        scaffoldBackgroundColor: _lightBackground,
        colorScheme: const ColorScheme.light(
          primary: _lightPrimary,
          secondary: _lightSecondary,
          tertiary: _lightAccent,
          surface: _lightSurface,
          error: _lightError,
          onPrimary: _lightOnPrimary,
          onSecondary: _lightOnSecondary,
          onSurface: _lightOnSurface,
          onError: Colors.white,
        ),
        textTheme: const TextTheme(
          displayLarge: _h1Style,
          displayMedium: _h2Style,
          displaySmall: _h3Style,
          headlineMedium: _h4Style,
          bodyLarge: _bodyStyle,
          bodyMedium: _captionStyle,
          bodySmall: _smallStyle,
        ).apply(
          bodyColor: _lightOnBackground,
          displayColor: _lightOnBackground,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: _lightSurface,
          foregroundColor: _lightOnSurface,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardThemeData(
          color: _lightSurface,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _lightPrimary,
            foregroundColor: _lightOnPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: _lightPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: const BorderSide(color: _lightPrimary),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: _lightSurface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: _lightPrimary, width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: _lightSurface,
          selectedItemColor: _lightPrimary,
          unselectedItemColor: Color(0xFF9CA3AF),
          type: BottomNavigationBarType.fixed,
          elevation: 8,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: _lightPrimary,
          foregroundColor: _lightOnPrimary,
        ),
        dividerTheme: const DividerThemeData(
          color: Color(0xFFE5E7EB),
          thickness: 1,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: _lightPrimary,
          linearTrackColor: Color(0xFFE5E7EB),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: _lightOnSurface,
          contentTextStyle: const TextStyle(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

  // Dark Theme
  static ThemeData get darkTheme => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primaryColor: _darkPrimary,
        scaffoldBackgroundColor: _darkBackground,
        colorScheme: const ColorScheme.dark(
          primary: _darkPrimary,
          secondary: _darkSecondary,
          tertiary: _darkAccent,
          surface: _darkSurface,
          error: _darkError,
          onPrimary: _darkOnPrimary,
          onSecondary: _darkOnSecondary,
          onSurface: _darkOnSurface,
          onError: Colors.black,
        ),
        textTheme: const TextTheme(
          displayLarge: _h1Style,
          displayMedium: _h2Style,
          displaySmall: _h3Style,
          headlineMedium: _h4Style,
          bodyLarge: _bodyStyle,
          bodyMedium: _captionStyle,
          bodySmall: _smallStyle,
        ).apply(
          bodyColor: _darkOnBackground,
          displayColor: _darkOnBackground,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: _darkSurface,
          foregroundColor: _darkOnSurface,
          elevation: 0,
          centerTitle: true,
        ),
        cardTheme: CardThemeData(
          color: _darkSurface,
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: _darkPrimary,
            foregroundColor: _darkOnPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
            foregroundColor: _darkPrimary,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: const BorderSide(color: _darkPrimary),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: _darkSurface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF374151)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: Color(0xFF374151)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(color: _darkPrimary, width: 2),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: _darkSurface,
          selectedItemColor: _darkPrimary,
          unselectedItemColor: Color(0xFF6B7280),
          type: BottomNavigationBarType.fixed,
          elevation: 8,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: _darkPrimary,
          foregroundColor: _darkOnPrimary,
        ),
        dividerTheme: const DividerThemeData(
          color: Color(0xFF374151),
          thickness: 1,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: _darkPrimary,
          linearTrackColor: Color(0xFF374151),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: _darkOnSurface,
          contentTextStyle: const TextStyle(color: Colors.black),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          behavior: SnackBarBehavior.floating,
        ),
      );

  // Status Colors
  static Color getStatusColor(String status) {
    switch (status) {
      case 'completed':
        return lightTheme.colorScheme.secondary;
      case 'in_progress':
        return const Color(0xFFF59E0B);
      case 'pending':
        return const Color(0xFF9CA3AF);
      case 'overdue':
        return const Color(0xFFEF4444);
      default:
        return const Color(0xFF9CA3AF);
    }
  }

  // Resource Type Colors
  static Color getResourceTypeColor(String type) {
    switch (type) {
      case 'course':
        return const Color(0xFF4F46E5);
      case 'tutorial':
        return const Color(0xFF10B981);
      case 'documentation':
        return const Color(0xFF6366F1);
      case 'video':
        return const Color(0xFFEF4444);
      case 'book':
        return const Color(0xFFF59E0B);
      case 'article':
        return const Color(0xFF8B5CF6);
      case 'practice':
        return const Color(0xFF06B6D4);
      case 'community':
        return const Color(0xFFEC4899);
      default:
        return const Color(0xFF6B7280);
    }
  }
}
