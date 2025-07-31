import 'package:flutter/material.dart';
import 'package:tanit_tanit_app/app/data/app_colors.dart';

ThemeData themeData() {
  return ThemeData(
    iconTheme: IconThemeData(
      color: AppColors.darkBlue,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(),
    ),
  );
}
