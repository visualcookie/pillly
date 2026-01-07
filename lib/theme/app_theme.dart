import 'package:flutter/material.dart';

// Light theme colors
class AppColorsLight {
  static const primary = Color(0xFF6C5CE7);
  static const primaryLight = Color(0xFFA29BFE);
  static const background = Color(0xFFF8F9FA);
  static const surface = Colors.white;
  static const textPrimary = Color(0xFF2D3436);
  static const textSecondary = Color(0xFF636E72);
  static const textHint = Color(0xFFB2BEC3);
  static const error = Color(0xFFE74C3C);
  static const success = Color(0xFF00B894);
}

// Dark theme colors
class AppColorsDark {
  static const primary = Color(0xFF6C5CE7);
  static const primaryLight = Color(0xFFA29BFE);
  static const background = Color(0xFF121212);
  static const surface = Color(0xFF1E1E1E);
  static const textPrimary = Color(0xFFF5F5F5);
  static const textSecondary = Color(0xFFB0B0B0);
  static const textHint = Color(0xFF6B6B6B);
  static const error = Color(0xFFEF5350);
  static const success = Color(0xFF00B894);
}

// Helper class to get colors based on context
class AppColors {
  // Primary colors (same in both themes)
  static const primary = Color(0xFF6C5CE7);
  static const primaryLight = Color(0xFFA29BFE);
  static const error = Color(0xFFE74C3C);
  static const success = Color(0xFF00B894);

  // Gradient (same in both themes)
  static const primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [primary, primaryLight],
  );

  static const errorGradient = LinearGradient(
    colors: [Color(0xFFE57373), Color(0xFFE53935)],
  );

  // Context-aware colors
  static Color background(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? AppColorsDark.background
      : AppColorsLight.background;

  static Color surface(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? AppColorsDark.surface
      : AppColorsLight.surface;

  static Color textPrimary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? AppColorsDark.textPrimary
      : AppColorsLight.textPrimary;

  static Color textSecondary(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? AppColorsDark.textSecondary
      : AppColorsLight.textSecondary;

  static Color textHint(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark
      ? AppColorsDark.textHint
      : AppColorsLight.textHint;

  // Helper to check if dark mode
  static bool isDark(BuildContext context) =>
      Theme.of(context).brightness == Brightness.dark;
}

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.light(
        primary: AppColorsLight.primary,
        secondary: AppColorsLight.primaryLight,
        surface: AppColorsLight.surface,
        error: AppColorsLight.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColorsLight.textPrimary,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: AppColorsLight.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColorsLight.textPrimary),
        titleTextStyle: TextStyle(
          color: AppColorsLight.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColorsLight.background,
        hintStyle: const TextStyle(color: AppColorsLight.textHint),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColorsLight.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColorsLight.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColorsLight.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorsLight.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColorsLight.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColorsLight.primary,
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: AppColorsLight.surface,
        hourMinuteColor: AppColorsLight.background,
        dayPeriodColor: AppColorsLight.background,
        dialHandColor: AppColorsLight.primary,
        dialBackgroundColor: AppColorsLight.background,
        entryModeIconColor: AppColorsLight.primary,
        hourMinuteTextColor: AppColorsLight.textPrimary,
        dayPeriodTextColor: AppColorsLight.textPrimary,
        dayPeriodBorderSide: const BorderSide(
          color: AppColorsLight.background,
          width: 1,
        ),
        cancelButtonStyle: TextButton.styleFrom(
          foregroundColor: AppColorsLight.error,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        confirmButtonStyle: TextButton.styleFrom(
          foregroundColor: AppColorsDark.primary,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.dark(
        primary: AppColorsDark.primary,
        secondary: AppColorsDark.primaryLight,
        surface: AppColorsDark.surface,
        error: AppColorsDark.error,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: AppColorsDark.textPrimary,
        onError: Colors.white,
      ),
      scaffoldBackgroundColor: AppColorsDark.background,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColorsDark.textPrimary),
        titleTextStyle: TextStyle(
          color: AppColorsDark.textPrimary,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColorsDark.surface,
        hintStyle: const TextStyle(color: AppColorsDark.textHint),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColorsDark.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColorsDark.error, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColorsDark.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColorsDark.primary,
          foregroundColor: Colors.white,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColorsDark.surface,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColorsDark.primary,
      ),
      timePickerTheme: TimePickerThemeData(
        backgroundColor: AppColorsDark.surface,
        hourMinuteColor: AppColorsDark.background,
        dayPeriodColor: AppColorsDark.background,
        dialHandColor: AppColorsDark.primaryLight,
        dialBackgroundColor: AppColorsDark.background,
        entryModeIconColor: AppColorsDark.primaryLight,
        hourMinuteTextColor: AppColorsDark.textPrimary,
        dayPeriodTextColor: AppColorsDark.textPrimary,
        dayPeriodBorderSide: const BorderSide(
          color: AppColorsDark.background,
          width: 1,
        ),
        cancelButtonStyle: TextButton.styleFrom(
          foregroundColor: AppColorsDark.error,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        confirmButtonStyle: TextButton.styleFrom(
          foregroundColor: AppColorsDark.primaryLight,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
