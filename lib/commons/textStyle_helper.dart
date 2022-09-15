import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/them_helper.dart';

class TextStyleHelper {
  static TextStyle seletedLabel = TextStyle(
    fontSize: 10.sp,
    fontFamily: "SF Pro Display",
    fontWeight: FontWeight.w500,
    color: ThemeHelper.crimson,
  );

  static TextStyle unseletedLabel = TextStyle(
    fontSize: 10.sp,
    fontFamily: "SF Pro Display",
    fontWeight: FontWeight.w500,
    color: ThemeHelper.greyDial,
  );

  static TextStyle hintText = TextStyle(
    fontSize: 14.sp,
    fontFamily: "SF Pro Display",
    fontWeight: FontWeight.w400,
    color: ThemeHelper.greyDial.withOpacity(0.87),
  );

  static TextStyle f14w700 = TextStyle(
    fontSize: 14.sp,
    fontFamily: "SF Pro Display",
    fontWeight: FontWeight.w700,
    color: ThemeHelper.white,
  );

  static TextStyle f12w500 = TextStyle(
    fontSize: 12.sp,
    fontFamily: "SF Pro Display",
    fontWeight: FontWeight.w500,
    color: ThemeHelper.white,
  );

  static TextStyle f20w500black = TextStyle(
    fontSize: 20.sp,
    fontFamily: "SF Pro Display",
    fontWeight: FontWeight.w500,
    color: ThemeHelper.blackDial,
  );

  static TextStyle f14w500white = TextStyle(
    fontSize: 14.sp,
    fontFamily: "SF Pro Display",
    fontWeight: FontWeight.w500,
    color: ThemeHelper.white,
  );

  static TextStyle f24w800black = TextStyle(
    fontSize: 24.sp,
    fontFamily: "SF Pro Display",
    fontWeight: FontWeight.w800,
    color: ThemeHelper.black,
  );

  static TextStyle f14w400c1C1C1C = TextStyle(
    fontSize: 14.sp,
    fontFamily: "SF Pro Display",
    fontWeight: FontWeight.w400,
    color: ThemeHelper.c1C1C1C,
  );

  static TextStyle f16w600white = TextStyle(
    fontSize: 16.sp,
    fontFamily: "SF Pro Display",
    fontWeight: FontWeight.w600,
    color: ThemeHelper.white,
  );
}
