import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/them_helper.dart';

class ButtonDayOfTheWeekWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final Function()? onTap;
  final Widget? widgetData;
  final Color? themeButton;
  final bool isShadow;
  const ButtonDayOfTheWeekWidget({
    super.key,
    this.width,
    this.height,
    this.onTap,
    this.widgetData,
    this.themeButton,
    this.isShadow = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap!(),
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: width!.w,
        height: height!.h,
        decoration: BoxDecoration(
          color: themeButton,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: isShadow
              ? [
                  BoxShadow(
                    color: ThemeHelper.green20,
                    offset: const Offset(0, 2),
                    blurRadius: 20.r,
                    spreadRadius: 0,
                  )
                ]
              : null,
        ),
        child: widgetData,
      ),
    );
  }
}
