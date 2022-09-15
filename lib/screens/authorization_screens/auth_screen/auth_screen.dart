import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/text_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/buttonCrimson_widget.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25.w, top: 52.h, right: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextHelper.authTxt,
                  style: TextStyleHelper.f24w800black,
                ),
                SizedBox(height: 10.h),
                Text(
                  TextHelper.authTxt1,
                  style: TextStyleHelper.f14w400c1C1C1C,
                ),
                SizedBox(height: 10.h),
                ButtonCrimsonWidget(
                  onPressed: () {},
                  txtButton: TextHelper.authTxt,
                  textStyle: TextStyleHelper.f16w600white,
                  width: 273,
                  height: 43,
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          Container(
            width: 1.sw,
            height: 294.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              color: ThemeHelper.white,
              boxShadow: [
                BoxShadow(
                  color: ThemeHelper.shadowBox1,
                  offset: const Offset(0, 0),
                  blurRadius: 20,
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(
              children: [
                InkWell(
                  onTap: () {},
                  child: SizedBox(
                    width: 330.w,
                    child: Row(
                      children: [
                        WidgetsHelpers().imageIcon(
                          IconHelper.ellipse,
                          24,
                          ThemeHelper.crimson,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
