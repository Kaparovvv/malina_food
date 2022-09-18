import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';

class SubcategoriesWidgets {
  Widget boxIconText(String text, Widget iconWidget, Function() onPressed) {
    return Material(
      child: InkWell(
        onTap: () => onPressed(),
        borderRadius: BorderRadius.circular(3.r),
        child: Ink(
          height: 24.h,
          decoration: BoxDecoration(
            color: ThemeHelper.colorF8F7FA,
            borderRadius: BorderRadius.circular(3.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 3.h,
              horizontal: 7.w,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconWidget,
                SizedBox(width: 6.w),
                Text(
                  text,
                  style: TextStyleHelper.f14w400.copyWith(
                    color: ThemeHelper.blackDial,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget boxIcon(Widget iconWidget, Function() onPressed) {
    return Material(
      child: InkWell(
        onTap: () => onPressed(),
        borderRadius: BorderRadius.circular(3.r),
        child: Ink(
          height: 24.h,
          decoration: BoxDecoration(
            color: ThemeHelper.colorF8F7FA,
            borderRadius: BorderRadius.circular(3.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 3.h,
              horizontal: 7.w,
            ),
            child: Center(child: iconWidget),
          ),
        ),
      ),
    );
  }

  Widget boxText(String text, Color color, Function() onPressed) {
    return Material(
      child: InkWell(
        onTap: () => onPressed(),
        borderRadius: BorderRadius.circular(3.r),
        child: Ink(
          height: 24.h,
          decoration: BoxDecoration(
            color: ThemeHelper.colorF8F7FA,
            borderRadius: BorderRadius.circular(3.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 3.h,
              horizontal: 7.w,
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyleHelper.f14w400.copyWith(
                  color: color,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
