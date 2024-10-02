import 'package:flutter/material.dart';
import 'package:puntos_smart_user/app/core/theme/app_colors.dart';

class AppTheme {
  static ThemeData lighTheme() => ThemeData(
        scaffoldBackgroundColor: AppColors.primary,
        useMaterial3: true,
        fontFamily: "Poppins",
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: AppColors.onPrimary, // Color del cursor
          selectionHandleColor:
              AppColors.onPrimary, // Color de los handles de selección
          selectionColor: AppColors.onPrimary, // Color del texto seleccionado
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.onPrimary;
            } else if (states.contains(WidgetState.disabled)) {
              return Colors.grey;
            }
            return Colors.grey
                .withOpacity(0.2); // Color cuando no está seleccionado
          }),
          checkColor: WidgetStateProperty.all(Colors.white), // Siempre blanco
        ),
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: AppColors.primary,
          onPrimary: AppColors.onPrimary,
          secondary: AppColors.secondary,
          onSecondary: AppColors.onSecondary,
          error: AppColors.error,
          onError: AppColors.onError,
          surface: Colors.grey,
          onSurface: AppColors.onError,
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontSize: 57.0, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontSize: 45.0, fontWeight: FontWeight.w600),
          displaySmall: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w500),
          headlineLarge: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
          headlineMedium:
              TextStyle(fontSize: 28.0, fontWeight: FontWeight.w600),
          headlineSmall: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
          titleLarge: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
          titleMedium: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w400),
          titleSmall: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400),
          bodyLarge: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal),
          bodyMedium: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal),
          bodySmall: TextStyle(fontSize: 12.0, fontWeight: FontWeight.normal),
          labelLarge: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
          labelMedium: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
          labelSmall: TextStyle(fontSize: 11.0, fontWeight: FontWeight.w500),
        ),
      );
}
