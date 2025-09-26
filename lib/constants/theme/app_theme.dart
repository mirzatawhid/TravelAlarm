import 'package:flutter/material.dart';
import 'package:travelalarm/constants/colors.dart';
import 'package:travelalarm/constants/theme/elevated_button_theme.dart';
import 'package:travelalarm/constants/theme/text_field_theme.dart';
import 'package:travelalarm/constants/theme/text_theme.dart';

import 'outlined_button_theme.dart';

class AppTheme{
  AppTheme._();

  static ThemeData appTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.secondary,
    brightness: Brightness.dark,
    textTheme: AppTextTheme.textTheme,
    elevatedButtonTheme: AppElevatedButtonTheme.elevatedButtonTheme,
    outlinedButtonTheme: AppOutlinedButtonTheme.outlinedButtonTheme,
    inputDecorationTheme: AppTextFieldTheme.inputDecorationTheme,
  );

}