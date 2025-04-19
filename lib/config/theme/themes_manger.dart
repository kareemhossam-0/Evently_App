import 'package:evently_app/core/resourses/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeManger {
  static final ThemeData light = ThemeData(
    useMaterial3: false,
      scaffoldBackgroundColor: ColorsManager.light,
      inputDecorationTheme: InputDecorationTheme(
        prefixIconColor: ColorsManager.grey,
        labelStyle: TextStyle(fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(width: 1.w, color: ColorsManager.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(width: 1.w, color: ColorsManager.grey),

        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(width: 1.w, color: ColorsManager.grey),


        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(width: 1.w, color: ColorsManager.red),


        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide: BorderSide(width: 1.w, color: ColorsManager.red),


        ),
      ),
      textButtonTheme: TextButtonThemeData(

        style: TextButton.styleFrom(
            padding: EdgeInsets.zero,
            elevation: 0,
            foregroundColor: ColorsManager.blue,

            textStyle: GoogleFonts.inter(
              textStyle:
              TextStyle(
                  color: ColorsManager.blue,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  decoration: TextDecoration.underline
              ),
            )
        ),

      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.r),
              ),
              padding: REdgeInsets.symmetric(vertical: 12),
              backgroundColor: ColorsManager.blue,
              foregroundColor: ColorsManager.white,
              textStyle: GoogleFonts.inter(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: ColorsManager.white))),
      textTheme: TextTheme(
        bodySmall: GoogleFonts.inter(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.black1C),
        titleMedium: GoogleFonts.inter(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: ColorsManager.blue),
        titleSmall: GoogleFonts.inter(
            fontSize: 14.sp,
            color: ColorsManager.white,
            fontWeight: FontWeight.normal),
        titleLarge: GoogleFonts.inter(
            fontSize: 24.sp,
            color: ColorsManager.white,
            fontWeight: FontWeight.bold),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: ColorsManager.light,
          titleTextStyle: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: ColorsManager.black1C,
              fontWeight: FontWeight.w400,
              fontSize: 20,

            ),
          )
      ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: ColorsManager.blue,
      type: BottomNavigationBarType.fixed,
      unselectedItemColor: ColorsManager.white,
      selectedItemColor: ColorsManager.white,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.blue,
      foregroundColor: ColorsManager.white,
      shape: StadiumBorder(
          side: BorderSide(
            width: 4.w,
            color: ColorsManager.white,
          )),
    ),
  );

  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.dark,

  );
}
