import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  AppColors._();

  static const background = Color(0xFF121212);
  static const surface = Color(0xFF1E1E1E);
  static const surfaceVariant = Color(0xFF2A2A2A);
  static const surfaceHover = Color.fromARGB(60, 255, 255, 255);
  static const surfaceTransparent = Colors.transparent;

  static const primary = Color.fromARGB(255, 255, 171, 74);
  static const primaryVariant = Color.fromARGB(255, 217, 69, 58);
  static const secondary = Color.fromARGB(255, 255, 219, 100);

  static const textPrimary = Color(0xFFFFFFFF);
  static const textSecondary = Color(0xFFB0B0B0);
  static const textHint = Color(0xFF707070);

  static const online = Color.fromARGB(255, 87, 175, 76);
  static const error = Color(0xFFCF6679);
  static const warning = Color.fromARGB(255, 255, 218, 7);

  static const chatListBackground = Color(0xFF172129);
  static const chatBackground = Color(0xFF0D1117);
  static const myMessageBubble = Color(0xFF2B5278);
  static const otherMessageBubble = Color(0xFF212D3A);
  static const inputBar = Color(0xFF1A1F28);

  static const surfaceIcon = Colors.white54;
}

enum ThemeList { 
  orange; 
  // red, 
  // blue, 
  // lightBlue, 
  // green;

  ThemeData get theme => switch (this) {
    ThemeList.orange => AppTheme.orangeTheme,
    // ThemeList.red => AppTheme.redTheme,
    // ThemeList.blue => AppTheme.blueTheme,
    // ThemeList.lightBlue => AppTheme.lightBlueTheme,
    // ThemeList.green => AppTheme.greenTheme,
  };
}

class AppTheme {
  AppTheme._();

  static ThemeData get orangeTheme => ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    primaryColor: const Color.fromARGB(255, 250, 55, 29),
    fontFamily: GoogleFonts.jetBrainsMono().fontFamily!,

    // AppBar
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      elevation: 0,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: AppColors.textPrimary,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),

    // NavigationRail
    navigationRailTheme: const NavigationRailThemeData(
      backgroundColor: AppColors.surface,
      selectedIconTheme: IconThemeData(color: AppColors.primary),
      unselectedIconTheme: IconThemeData(color: AppColors.textSecondary),
      indicatorColor: AppColors.primaryVariant,
    ),

    // BottomNavigationBar
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: AppColors.surface,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.textSecondary,
    ),

    // ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textPrimary,
      ),
    ),

    // Input
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surfaceVariant,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide.none,
      ),
      hintStyle: const TextStyle(color: AppColors.textHint),
    ),

    // Text
    textTheme: const TextTheme(
      headlineLarge: TextStyle(color: AppColors.textPrimary, fontSize: 24),
      titleMedium: TextStyle(color: AppColors.textPrimary, fontSize: 16),
      bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 14),
      bodyMedium: TextStyle(color: AppColors.textSecondary, fontSize: 13),
      labelSmall: TextStyle(color: AppColors.textHint, fontSize: 11),
    ),

    // Icon
    iconTheme: const IconThemeData(color: AppColors.textSecondary),

    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        foregroundColor: Color.fromARGB(255, 241, 89, 0),
      ),
    ),

    // Divider
    dividerTheme: const DividerThemeData(
      color: AppColors.surfaceVariant,
      thickness: 1,
    ),
  );
}
