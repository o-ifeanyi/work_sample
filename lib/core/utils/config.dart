import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Config {
  static bool get isAndroid => Platform.isAndroid;
  static bool get isIOS => Platform.isIOS;

  static double get height => 1.sh;

  static double get width => 1.sw;

  static TextTheme get textTheme => TextTheme(
        displayLarge: GoogleFonts.ibmPlexSerif(
          fontSize: 50.sp,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        displaySmall: GoogleFonts.ibmPlexSerif(
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          height: 1.2,
        ),
        titleLarge: GoogleFonts.ibmPlexSerif(
          fontSize: 32.sp,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        titleMedium: GoogleFonts.ibmPlexSerif(
          fontSize: 28.sp,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        titleSmall: GoogleFonts.vesperLibre(
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          height: 1.2,
        ),
        bodyLarge: GoogleFonts.vesperLibre(
          fontSize: 18.sp,
          height: 1.4,
        ),
        bodyMedium: GoogleFonts.lato(
          fontSize: 16.sp,
          height: 1.4,
        ),
        bodySmall: GoogleFonts.lato(
          fontSize: 14.sp,
          height: 1.4,
        ),
        labelLarge: GoogleFonts.lato(
          fontSize: 14.sp,
          height: 1.4,
        ),
        labelMedium: GoogleFonts.lato(
          fontSize: 12.sp,
          height: 1.4,
        ),
        labelSmall: GoogleFonts.lato(fontSize: 10.sp),
      );

  static EdgeInsets contentPadding({double? h, double? v}) =>
      EdgeInsets.symmetric(horizontal: (h ?? 0).w, vertical: (v ?? 0).h);

  static EdgeInsets contentPaddingLTRB(
          double l, double t, double r, double b) =>
      EdgeInsets.fromLTRB(l.w, t.h, r.w, b.h);

  static double y(double height) => height.h;

  static double x(double width) => width.w;

  static Widget get hGap5 => SizedBox(width: 5.w);
  static Widget get hGap10 => SizedBox(width: 10.w);
  static Widget get hGap15 => SizedBox(width: 15.w);
  static Widget get hGap20 => SizedBox(width: 20.w);
  static Widget get hGap30 => SizedBox(width: 30.w);

  static Widget get vGap5 => SizedBox(height: 5.h);
  static Widget get vGap10 => SizedBox(height: 10.h);
  static Widget get vGap15 => SizedBox(height: 15.h);
  static Widget get vGap20 => SizedBox(height: 20.h);
  static Widget get vGap30 => SizedBox(height: 30.h);
  static Widget get vGap60 => SizedBox(height: 60.h);
}
