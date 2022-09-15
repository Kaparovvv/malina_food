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
}
