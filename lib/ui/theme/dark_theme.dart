import 'package:flutter/material.dart';
import 'package:responsive_todo_app/ui/theme/colors.dart';

ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color(0xff232D3F),
  colorScheme: ColorScheme.dark(
    primary: veryDarkDesatratedBlue.toColor(),
    secondary: lightGrayishBlue2.toColor(),
    background: veryDarkBlue.toColor(),
    tertiary: darkGrayishBlue2.toColor(),
    onTertiary: veryDarkGrayishBlue2.toColor(),
  ),
);
