import 'package:flutter/material.dart';

// Paleta de colores de la app (negro / azul / violeta).
class AppColors {
  static const background = Color(0xFF0B0B12);
  static const surface = Color(0xFF151522);
  static const blue = Color(0xFF3B82F6);
  static const violet = Color(0xFF8B5CF6);
  static const text = Color(0xFFE5E7EB);
  static const textSecondary = Color(0xFF9CA3AF);

  // Degradado azul → violeta usado en AppBar y avatares.
  static const gradient = LinearGradient(
    colors: [blue, violet],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

// Tema oscuro único de la app (Material 3).
final ThemeData appTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.background,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.violet,
    secondary: AppColors.blue,
    surface: AppColors.surface,
    onSurface: AppColors.text,
  ),
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppColors.surface,
    contentTextStyle: const TextStyle(color: AppColors.text),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  listTileTheme: ListTileThemeData(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
    textColor: AppColors.text,
  ),
);
