import 'package:flutter/material.dart';
import 'package:opulizer/view/theme/chart_theme.dart';

final appTheme = ThemeData.dark().copyWith(
  colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan[900]!),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    shadowColor: Colors.cyan,
    elevation: 20,
    titleTextStyle: TextStyle(color: Colors.cyan),
    shape: Border(
      bottom: BorderSide(
        color: Colors.cyan,
        width: 3,
      ),
    ),
    centerTitle: true,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.cyan,
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  ),
  tooltipTheme: TooltipThemeData(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
    textAlign: TextAlign.center,
    preferBelow: false,
    triggerMode: TooltipTriggerMode.manual,
    decoration: BoxDecoration(
      color: Colors.black,
      border: Border.all(color: Colors.white),
      boxShadow: [
        BoxShadow(
          color: Colors.cyan[900]!,
          blurRadius: 10,
        ),
      ],
      borderRadius: const BorderRadius.all(
        Radius.circular(
          10,
        ),
      ),
    ),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    backgroundColor: Colors.black,
    foregroundColor: Colors.cyan,
  ),
  extensions: [
    ChartTheme(),
  ],
);
