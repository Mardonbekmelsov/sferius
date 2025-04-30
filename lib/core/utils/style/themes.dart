import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors.dart';

class AppThemes {
  static ThemeData get lightTheme => ThemeData(
        fontFamily: "SF Pro Display",
        scaffoldBackgroundColor: AppColors.backgroundColor,
        // primaryColor: AppColors.primary500,
        cardColor: AppColors.white,
        iconButtonTheme: IconButtonThemeData(
            style: ButtonStyle(
                iconColor: WidgetStateProperty.all(AppColors.c000000))),
        dialogBackgroundColor: AppColors.backgroundColor,
        canvasColor: AppColors.black,
        useMaterial3: false,
        // hintColor: AppColors.neutral300,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
          backgroundColor: AppColors.white,
        ),
        // iconTheme: const IconThemeData(color: AppColors.neutral300),
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: AppColors.black),
        // shadowColor: AppColors.neutral200,
        dividerColor: AppColors.f1f5f8,
        // colorScheme: AppColors.getLightScheme(),
        // primarySwatch: AppColors.primarySwatch,
        indicatorColor: AppColors.f5f5f5,
        highlightColor: AppColors.f5f5f5,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 16.0.sp,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
            color: AppColors.c050505,
          ),
          displayMedium: TextStyle(
            fontSize: 15.0.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'SF Pro Display',
            color: AppColors.c141414,
          ),
          displaySmall: TextStyle(
            fontSize: 20.0.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'SF Pro Display',
            color: AppColors.c141414,
          ),
          headlineLarge: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF Pro Display',
            color: AppColors.cFF8686,
          ),
          headlineMedium: TextStyle(
            fontSize: 60.0.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF Pro Display',
            color: AppColors.c141414,
          ),
          headlineSmall: TextStyle(
            fontSize: 20.0.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF Pro Display',
            // color: AppColors.neutral950,
          ),
          titleLarge: TextStyle(
            fontSize: 22.0.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'SF Pro Display',
            color: AppColors.black,
          ),
          titleMedium: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'SF Pro Display',
            // color: AppColors.neutral800,
          ),
          titleSmall: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro Display',
            // color: AppColors.neutral700,
          ),
          labelLarge: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'SF Pro Display',
            // color: AppColors.neutral600,
          ),
          labelMedium: TextStyle(
            fontSize: 12.0.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF Pro Display',
            // color: AppColors.neutral500,
          ),
          labelSmall: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF Pro Display',
            // color: AppColors.neutral800,
            letterSpacing: 0,
          ),
          bodyLarge: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'SF Pro Display',
            // color: AppColors.neutral700,
          ),
          bodyMedium: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF Pro Display',
            color: Colors.white,
          ),
          bodySmall: TextStyle(
            fontSize: 12.0.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF Pro Display',
            // color: AppColors.neutral500,
            letterSpacing: 0,
          ),
        ),
      );

  static ThemeData get darkTheme => ThemeData(
        fontFamily: "SF Pro Display",
        scaffoldBackgroundColor: AppColors.c171932,
        // primaryColor: AppColors.primary500,
        cardColor: AppColors.c171932,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: AppColors.c171932,
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.dark,
          ),
          backgroundColor: AppColors.c171932,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: ButtonStyle(
            iconColor: WidgetStateProperty.all(AppColors.white),
          ),
        ),
        canvasColor: AppColors.white,
        dividerColor: AppColors.c292D49,
        dialogBackgroundColor: AppColors.c292D49,
        indicatorColor: AppColors.c292D49,
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: AppColors.white),
        // colorScheme: AppColors.getDarkScheme(),
        highlightColor: AppColors.c39416F,
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 57.0.sp,
            fontFamily: 'SF Pro Display',
            fontWeight: FontWeight.w400,
            color: AppColors.white,
          ),
          displayMedium: TextStyle(
            fontSize: 45.0.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF Pro Display',
            color: AppColors.white,
          ),
          displaySmall: TextStyle(
            fontSize: 36.0.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF Pro Display',
            color: AppColors.white,
          ),
          headlineLarge: TextStyle(
            fontSize: 32.0.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro Display',
            color: AppColors.white,
          ),
          headlineMedium: TextStyle(
            fontSize: 28.0.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro Display',
            color: AppColors.white,
          ),
          headlineSmall: TextStyle(
            fontSize: 24.0.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro Display',
            color: AppColors.white,
          ),
          titleLarge: TextStyle(
            fontSize: 22.0.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'SF Pro Display',
            color: AppColors.white,
          ),
          titleMedium: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'SF Pro Display',
            color: AppColors.white,
          ),
          titleSmall: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro Display',
            color: AppColors.white,
          ),
          labelLarge: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro Display',
            color: AppColors.white,
          ),
          labelMedium: TextStyle(
            fontSize: 12.0.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF Pro Display',
            color: AppColors.white,
          ),
          labelSmall: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w600,
            fontFamily: 'SF Pro Display',
            color: AppColors.white,
          ),
          bodyLarge: TextStyle(
            fontSize: 16.0.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'SF Pro Display',
            color: AppColors.white,
          ),
          bodyMedium: TextStyle(
            fontSize: 14.0.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF Pro Display',
            color: AppColors.white,
          ),
          bodySmall: TextStyle(
            fontSize: 12.0.sp,
            fontWeight: FontWeight.w400,
            fontFamily: 'SF Pro Display',
            color: AppColors.white,
          ),
        ),
      );
}

class AppTextStyles {
  static var displaySmallWhite = TextStyle(
    letterSpacing: -0.36,
    height: 1.2,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    color: AppColors.white,
  );
  static var displaySmallBlack = TextStyle(
    letterSpacing: -0.36,
    height: 1.2,
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    color: AppColors.black,
  );

  static var sf12white500 = TextStyle(
    letterSpacing: -0.14,
    height: 1.2,
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    color: Colors.white,
  );
  static var sf12black500 = TextStyle(
    letterSpacing: -0.14,
    height: 1.2,
    fontSize: 12.0.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    color: Colors.black,
  );
  static var sf14white400 = TextStyle(
    letterSpacing: -0.14,
    height: 1.2,
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display',
    color: Colors.white,
  );
  static var sf14black400 = TextStyle(
    letterSpacing: -0.14,
    height: 1.2,
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display',
    color: Colors.black,
  );

  static var sf14grey400 = TextStyle(
    letterSpacing: -0.14,
    height: 1.2,
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display',
    color: Colors.grey,
  );
  static var sf15black400 = TextStyle(
    letterSpacing: -0.15,
    height: 1.2,
    fontSize: 15.0.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display',
    color: Colors.black,
  );
  static var sf16black400 = TextStyle(
    letterSpacing: -0.16,
    height: 1.2,
    fontSize: 16.0.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display',
    color: Colors.black,
  );
  static var sf16white400 = TextStyle(
    letterSpacing: -0.16,
    height: 1.2,
    fontSize: 15.0.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display',
    color: Colors.white,
  );
  static var sf16white700 = TextStyle(
    letterSpacing: -0.16,
    height: 1.2,
    fontSize: 15.0.sp,
    fontWeight: FontWeight.w700,
    fontFamily: 'SF Pro Display',
    color: Colors.white,
  );
  static var sf15white400 = TextStyle(
    letterSpacing: -0.15,
    height: 1.2,
    fontSize: 15.0.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display',
    color: Colors.white,
  );
  static var sf15grey400 = TextStyle(
    letterSpacing: -0.15,
    height: 1.2,
    fontSize: 15.0.sp,
    fontWeight: FontWeight.w400,
    fontFamily: 'SF Pro Display',
    color: Colors.grey,
  );
  static var sf17white500 = TextStyle(
    letterSpacing: -0.34,
    height: 1.2,
    fontSize: 17.0.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    color: Colors.white,
  );
  static var sf20black500 = TextStyle(
    letterSpacing: -0.4,
    height: 1.2,
    fontSize: 20.0.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    color: Colors.black,
  );
  static var sf20white500 = TextStyle(
    letterSpacing: -0.4,
    height: 1.2,
    fontSize: 20.0.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    color: Colors.white,
  );

  static var sf20black400 = TextStyle(
    fontSize: 20.sp,
    letterSpacing: -2,
    color: Colors.black,
    fontFamily: 'SF Pro Display'
  );
  static var sf20white400 = TextStyle(
    fontSize: 20.sp,
    letterSpacing: -2,
    color: Colors.white,
    fontFamily: 'SF Pro Display'
  );
  static var sf18black500 = TextStyle(
    letterSpacing: -0.36,
    height: 1.2,
    fontSize: 18.0.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    color: Colors.black,
  );
  static var sf18white500 = TextStyle(
    letterSpacing: -0.36,
    height: 1.2,
    fontSize: 18.0.sp,
    fontWeight: FontWeight.w500,
    fontFamily: 'SF Pro Display',
    color: Colors.white,
  );
}
