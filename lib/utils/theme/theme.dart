import 'package:flutter/material.dart';

import 'custom_themes/appbarTheme.dart';
import 'custom_themes/bottom_sheet_theme.dart';
import 'custom_themes/checkbox_theme.dart';
import 'custom_themes/chip_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/outlined_button_theme.dart';
import 'custom_themes/text_field_theme.dart';
import 'custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
      scaffoldBackgroundColor: Colors.white,
      textTheme: MyTextTheme.lightTextTheme,
      chipTheme: MyChipTheme.lightChipTheme,
      appBarTheme: MyAppbarTheme.lightAppBarTheme,
      checkboxTheme: MyCheckboxTheme.lightCheckboxTheme,
      bottomSheetTheme: MyBottomSheetTheme.lightBottomSheetTheme,
      elevatedButtonTheme: MyElevatedButtonTheme.lightElevatedButtonTheme,
      outlinedButtonTheme: MyOutlinedButtonTheme.lightOutlinedButtonTheme,
      inputDecorationTheme: MyTextFormFieldTheme.lightInputDecorationTheme);
}
