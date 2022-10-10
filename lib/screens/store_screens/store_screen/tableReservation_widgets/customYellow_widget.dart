import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';

class CustomYellowWidget extends StatelessWidget {
  final Function() onPressed;
  final String title;

  const CustomYellowWidget({
    Key? key,
    required this.onPressed,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: Size(330.w, 50.h),
        backgroundColor: ThemeHelper.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Text(
        title,
        style: TextStyleHelper.f16w500.copyWith(color: ThemeHelper.blackDial),
      ),
    );
  }
}
