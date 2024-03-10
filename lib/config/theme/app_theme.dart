import 'package:app_cat_breeds/config/theme/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        colorSchemeSeed: AppColors.primaryColorApp,
      );
}
