import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

@singleton
class AppTheme {
  ThemeData get light => _build(Brightness.light);
  ThemeData get dark => _build(Brightness.dark);

  ThemeData _build(Brightness brightness) {
    final colorScheme = ColorScheme.fromSeed(
      seedColor: AppColors.primary,
      brightness: brightness,
    );
    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: brightness == Brightness.light
          ? AppColors.background
          : Colors.black,
      textTheme: AppTextStyles.textTheme(brightness),
      appBarTheme: AppBarTheme(
        backgroundColor: brightness == Brightness.light
            ? AppColors.surface
            : Colors.grey[900],
        centerTitle: true,
      ),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppColors.surface,
        indicatorColor: Color(0xFFD6E4FF),
      ),
    );
  }
}
