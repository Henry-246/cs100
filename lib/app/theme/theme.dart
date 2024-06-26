import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = FlexThemeData.light(
  scheme: FlexScheme.sanJuanBlue,
  useMaterial3: true,
  textTheme: GoogleFonts.poppinsTextTheme(
    Get.textTheme,
  ),
).copyWith(
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: Get.textTheme.headlineMedium!.copyWith(
        fontSize: 18,
      ),
    ));

final darkTheme = FlexThemeData.dark(
  scheme: FlexScheme.sanJuanBlue,
  useMaterial3: true,
  textTheme: GoogleFonts.poppinsTextTheme(
    ThemeData.dark().textTheme,
  ),
).copyWith(
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
    ),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
    ),
  ),
  appBarTheme: AppBarTheme(
    titleTextStyle: Get.textTheme.headlineMedium!.copyWith(
      fontSize: 18,
    ),
  ),
);
