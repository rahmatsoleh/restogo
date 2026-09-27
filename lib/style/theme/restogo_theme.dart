import "package:flutter/material.dart";
import "package:restogo_app/style/colors/restogo_colors.dart";
import "package:restogo_app/style/fonts/restogo_text_style.dart";

class RestogoTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      colorSchemeSeed: RestogoColors.brand.color,
      brightness: Brightness.light,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorSchemeSeed: RestogoColors.brand.color,
      brightness: Brightness.dark,
      textTheme: _textTheme,
      useMaterial3: true,
      appBarTheme: _appBarTheme,
    );
  }

  static TextTheme get _textTheme {
    return TextTheme(
      displayLarge: RestogoTextStyle.displayLarge,
      displayMedium: RestogoTextStyle.displayMedium,
      displaySmall: RestogoTextStyle.displaySmall,
      headlineLarge: RestogoTextStyle.headlineLarge,
      headlineMedium: RestogoTextStyle.headlineMedium,
      headlineSmall: RestogoTextStyle.headlineSmall,
      titleLarge: RestogoTextStyle.titleLarge,
      titleMedium: RestogoTextStyle.titleMedium,
      titleSmall: RestogoTextStyle.titleSmall,
      bodyLarge: RestogoTextStyle.bodyLargeBold,
      bodyMedium: RestogoTextStyle.bodyLargeMedium,
      bodySmall: RestogoTextStyle.bodyLargeRegular,
      labelLarge: RestogoTextStyle.labelLarge,
      labelMedium: RestogoTextStyle.labelMedium,
      labelSmall: RestogoTextStyle.labelSmall,
    );
  }

  static AppBarTheme get _appBarTheme {
    return AppBarTheme(
      toolbarTextStyle: _textTheme.titleLarge,
      shape: const BeveledRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(14),
          bottomRight: Radius.circular(14),
        ),
      ),
    );
  }
}
