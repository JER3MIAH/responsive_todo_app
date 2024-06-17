import 'package:flutter/material.dart';
import 'package:responsive_todo_app/ui/theme/colors.dart';

ThemeData lightTheme = ThemeData.light().copyWith(
  scaffoldBackgroundColor: const Color(0xffDDF2FD),
  colorScheme: ColorScheme.light(
    primary: veryLightGray.toColor(),
    secondary: veryDarkGrayishBlue.toColor(),
    background: veryLightGrayishBlue.toColor(),
    tertiary: lightGrayishBlue.toColor(),
    onTertiary: veryLightGrayishBlue.toColor(),
  ),
);
