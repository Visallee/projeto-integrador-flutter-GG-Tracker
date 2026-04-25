import 'package:flutter/material.dart';
import 'package:gg_tracker_workspace/theme/app_colors.dart';

final ThemeData appTheme = ThemeData(
  scaffoldBackgroundColor: AppColors.fundo,
  colorScheme: const ColorScheme.dark(
    primary: AppColors.destaque,
    surface: AppColors.card,
    error: AppColors.perigo,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.card,
    foregroundColor: AppColors.textoPrincipal,
    elevation: 0,
  ),
);
