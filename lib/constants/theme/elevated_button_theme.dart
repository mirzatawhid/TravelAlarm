import 'package:flutter/material.dart';
import 'package:travelalarm/constants/theme/text_theme.dart';

import '../colors.dart';
import '../sizes.dart';

class AppElevatedButtonTheme{
  AppElevatedButtonTheme._();

  static final elevatedButtonTheme  = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      backgroundColor: AppColor.primary,
      textStyle: AppTextTheme.textTheme.headlineLarge,
      padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonHeight, horizontal: AppSizes.buttonWidth),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
    ),
  );
}