import 'package:flutter/material.dart';
import 'colors.dart';

class AppTextStyle {
  static String? get fontFamily => "Roboto";

  static TextStyle get defaultFontStyle => const TextStyle(
        fontFamily: 'Roboto',
      );

  static TextStyle get headlineLarge => const TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.primaryColorWhite,
        fontWeight: FontWeight.bold,
        fontSize: 40,
      );

  static TextStyle get headlineMedium => const TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.primaryColorApp,
        fontWeight: FontWeight.bold,
        fontSize: 30,
      );

  static TextStyle get headlineSmall => const TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.primaryColorWhite,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      );

  static TextStyle get titleLarge => const TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.primaryColorWhite,
        fontWeight: FontWeight.bold,
        fontSize: 25,
      );

  static TextStyle get bodyMedium => const TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.primaryColorWhite,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );

  static TextStyle get labelMedium => const TextStyle(
        fontFamily: 'Roboto',
        color: AppColors.primaryColorApp,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      );

  static TextTheme get textTheme => TextTheme(
        headlineLarge: headlineLarge,
        headlineMedium: headlineMedium,
        headlineSmall: headlineSmall,
        titleLarge: titleLarge,
        bodyMedium: bodyMedium,
        labelMedium: labelMedium,
      );
}
