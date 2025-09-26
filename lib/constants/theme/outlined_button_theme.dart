import 'package:flutter/material.dart';

import '../sizes.dart';

class AppOutlinedButtonTheme{
  AppOutlinedButtonTheme._();
  static final outlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: Colors.transparent,
      side: const BorderSide(color: Colors.white),
      padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonHeight, horizontal: AppSizes.buttonWidth),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.buttonRadius)),
    ),
  );
}