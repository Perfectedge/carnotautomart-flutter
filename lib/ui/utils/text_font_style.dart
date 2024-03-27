import 'package:flutter/material.dart';

class TextFontStyle {
  TextFontStyle._();

  static TextStyle get bodySmall {
    return const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
        // fontSize: 12.sp,
        fontSize: 14);
  }

  static const labelMedium = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w500,
    // fontSize: 14.0,
    fontSize: 16.0,
  );

  static const bodyMedium = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    // fontSize: 18.0,
    fontSize: 18.0,
  );
  static const bodyLarge = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    // fontSize: 18.0,
    fontSize: 20.0,
  );

  static const labelLarge = TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 22.0);
  // static const hintStyle =
  //     TextStyle(color: colorHint, fontWeight: FontWeight.w400, fontSize: 12.0);

  static const displayLarge = TextStyle(fontSize: 24, color: Colors.white, fontWeight: FontWeight.bold);
}

class AppTextTheme {
  // AppTextTheme._();

  final lightTextTheme = TextTheme(
      displayLarge: TextFontStyle.displayLarge,
      bodyMedium: TextFontStyle.bodyMedium,
      bodySmall: TextFontStyle.bodySmall,
      bodyLarge: TextFontStyle.bodyLarge,
      labelMedium: TextFontStyle.labelMedium,
      labelLarge: TextFontStyle.labelLarge);

  final darkTextTheme = TextTheme(
    displayLarge: TextFontStyle.displayLarge,
    bodyMedium: TextFontStyle.bodyMedium.copyWith(color: Colors.white),
    bodySmall: TextFontStyle.bodySmall.copyWith(color: Colors.white),
    bodyLarge: TextFontStyle.bodyLarge,
    labelMedium: TextFontStyle.labelMedium,
    labelLarge: TextFontStyle.labelLarge,
  );
}
