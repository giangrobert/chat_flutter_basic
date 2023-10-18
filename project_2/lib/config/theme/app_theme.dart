import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF7827D5);
const List<Color> _colorsTheme = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.yellow,
  Colors.orange,
];

class AppTheme {
  final int selectorColor;

  AppTheme({
    this.selectorColor = 0,
  }) : assert(selectorColor >= 0 && selectorColor < _colorsTheme.length,
            'Color not found, select  must 0 a ${_colorsTheme.length - 1}');

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorsTheme[selectorColor],
      // brightness: Brightness.dark,
      // visualDensity: VisualDensity.adaptivePlatformDensity,
    );
  }
}
