import 'package:flutter/material.dart';

import 'colors.dart';
import 'text_styles.dart';

class AppThemes {
  static ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.textSecondary,
    scaffoldBackgroundColor: AppColors.backgroundPrimary,
    textTheme: TextTheme(
      displayLarge: AppTextStyles.heading1,    
      displayMedium: AppTextStyles.heading2,   
      bodyLarge: AppTextStyles.body,          
      bodySmall: AppTextStyles.caption,        
    ),
    colorScheme: ColorScheme.light(
      primary: AppColors.textSecondary,
      error: AppColors.error,
    ),
  );
}
