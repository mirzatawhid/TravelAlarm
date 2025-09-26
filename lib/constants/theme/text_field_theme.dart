import 'package:flutter/material.dart';
import 'package:travelalarm/constants/sizes.dart';

class AppTextFieldTheme{
  AppTextFieldTheme._();

  static InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    prefixIconColor: Colors.white,
    floatingLabelStyle: const TextStyle(color: Colors.white),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppSizes.buttonRadius),
      borderSide: const BorderSide(width: 2, color: Colors.white),
    ),
  );
}