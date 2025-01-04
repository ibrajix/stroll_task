import 'package:flutter/material.dart';
import 'package:stroll_task/constants/colors.dart';

import '../constants/app_constants.dart';

class AppTheme {
  AppTheme();

  static final ThemeData _lightThemeData = ThemeData(
      primaryColor: StrollColors.strollPurple,
      fontFamily: AppConstant.fontName,
      useMaterial3: false);
  static final ThemeData _darkThemeData = ThemeData(
      primaryColor: StrollColors.strollPurple,
      fontFamily: AppConstant.fontName,
      useMaterial3: false);

  ThemeData getAppTheme(BuildContext context, bool isDarkTheme) {
    // check if is dark mode or not and return appropriate theme, for now return light mode
    return _lightThemeData;
  }
}
