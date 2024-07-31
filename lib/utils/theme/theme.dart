import 'package:flutter/material.dart';

import 'widget_themes/text_theme.dart';

class SQAppTheme {
  SQAppTheme._();
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Open Sans',
    textTheme: SQTextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
  );
}
