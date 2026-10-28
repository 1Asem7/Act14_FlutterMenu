import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Paleta de colores de la app (negro / azul / violeta).
class AppColors {
  static const background = Color(0xFF07070D);
  static const surface = Color(0xFF151522);
  static const blue = Color(0xFF3B82F6);
  static const violet = Color(0xFF8B5CF6);
  static const text = Color(0xFFE5E7EB);
  static const textSecondary = Color(0xFF9CA3AF);
  static const textMuted = Color(0xFF6B7280); // ítems no seleccionados del menú

  // Degradado azul → violeta usado en avatares y badges.
  static const gradient = LinearGradient(
    colors: [blue, violet],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

// Tema oscuro único de la app (Material 3) con la fuente Inter.
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
  // Inter para todos los textos del tema oscuro.
  textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
  iconTheme: const IconThemeData(size: 22),
  // AppBar transparente: el vidrio se dibuja en main.dart.
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    surfaceTintColor: Colors.transparent,
    elevation: 0,
    scrolledUnderElevation: 0,
    titleTextStyle: GoogleFonts.inter(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.white,
    ),
  ),
  snackBarTheme: SnackBarThemeData(
    behavior: SnackBarBehavior.floating,
    backgroundColor: AppColors.surface,
    contentTextStyle: GoogleFonts.inter(color: AppColors.text),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
  ),
  // Filas compactas: nombres 15 / 600 y texto secundario 13 / 400.
  listTileTheme: ListTileThemeData(
    visualDensity: VisualDensity.compact,
    contentPadding: const EdgeInsets.symmetric(horizontal: 14),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
    titleTextStyle: GoogleFonts.inter(
      fontSize: 15,
      fontWeight: FontWeight.w600,
      color: AppColors.text,
    ),
    subtitleTextStyle: GoogleFonts.inter(
      fontSize: 13,
      fontWeight: FontWeight.w400,
      color: AppColors.textSecondary,
    ),
  ),
);
