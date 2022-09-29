import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';

class SectionButtonWidget extends StatelessWidget {
  final String? iconUrl;
  final String? sectionName;
  final Function() onPressed;
  const SectionButtonWidget({
    Key? key,
    this.iconUrl,
    this.sectionName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5.r),
      child: InkWell(
        onTap: () => onPressed(),
        borderRadius: BorderRadius.circular(5.r),
        splashColor: ThemeHelper.lightGrey,
        child: Ink(
          width: 85.w,
          height: 85.h,
          decoration: BoxDecoration(
            color: ThemeHelper.white,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 45.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      colors: [
                        ThemeHelper.white,
                        const Color(0xffFF7395),
                        const Color(0xffFF5780),
                        const Color(0xffF93B69),
                        const Color(0xffEA2757),
                        const Color(0xffC81944),
                      ],
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      iconUrl!,
                      alignment: Alignment.center,
                      width: 30.w,
                      height: 30.h,
                    ),
                  ),
                ),
                SizedBox(height: 8.h),
                Text(
                  sectionName!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleHelper.f12w400.copyWith(
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
}
