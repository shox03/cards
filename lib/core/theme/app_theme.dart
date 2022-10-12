import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sample_app_getx/core/theme/app_utils.dart';

import 'app_colors.dart';
import 'app_text_style.dart';

class AppThemes {
  AppThemes._();

  static final ThemeData light = ThemeData(
      canvasColor: Colors.transparent,
      scaffoldBackgroundColor: AppColors.background,
      backgroundColor: AppColors.background,
      cardColor: AppColors.background,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      useMaterial3: false,
      brightness: Brightness.light,
      colorSchemeSeed: AppColors.assets,
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: ZoomPageTransitionsBuilder(),
        },
      ),
      tabBarTheme: TabBarTheme(
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: EdgeInsets.zero,
        labelColor: AppColors.white,
        unselectedLabelColor: AppColors.blackSecondary,
        indicator: const BoxDecoration(
          borderRadius: AppUtils.kBorderRadius12,
          color: AppColors.assets,
        ),
        labelStyle: const TextStyle(
          fontSize: 15,
          color: AppColors.white,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 15,
          color: AppColors.blackSecondary,
          fontWeight: FontWeight.w600,
        ),
        overlayColor: MaterialStateProperty.all(AppColors.white),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.assets, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.12), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.red, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        errorStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 15,
          color: AppColors.red,
        ),
      ),
      bottomSheetTheme: const BottomSheetThemeData(
        elevation: 0,
        backgroundColor: AppColors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
        ),
      ),
      dividerColor: AppColors.lightGrey2,
      appBarTheme: const AppBarTheme(
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          systemNavigationBarColor: Colors.white,
          // ios
          statusBarBrightness: Brightness.light,
          // android
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        iconTheme: IconThemeData(
          color: AppColors.assets,
        ),
        titleTextStyle: AppTextStyles.appBarTitle,
        color: AppColors.white,
      ),
      textTheme: const TextTheme(
        bodyText1: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
        bodyText2: TextStyle(
          color: AppColors.black,
          fontWeight: FontWeight.w500,
          fontSize: 17,
        ),
      ),
      fontFamily: 'SFPro',
      sliderTheme: SliderThemeData(overlayShape: SliderComponentShape.noOverlay,)
  );

  static final ThemeData dark = ThemeData(
    canvasColor: Colors.transparent,
    primaryColor: AppColors.assets,
    scaffoldBackgroundColor: AppColors.background,
    backgroundColor: AppColors.background,
    cardColor: AppColors.background,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        // ios
        statusBarBrightness: Brightness.light,
        // android
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
      iconTheme: IconThemeData(
        color: AppColors.assets,
      ),
      titleTextStyle: AppTextStyles.appBarTitle,
      color: AppColors.white,
    ),
    textTheme: const TextTheme(
      bodyText1: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
      bodyText2: TextStyle(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
        fontSize: 17,
      ),
    ),
    fontFamily: 'SFPro',
  );
}
