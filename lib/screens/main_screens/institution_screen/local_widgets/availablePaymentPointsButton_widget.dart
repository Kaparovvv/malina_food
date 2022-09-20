import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';

class AvailablePaymentPointsButton extends StatelessWidget {
  final Function() onPressed;
  const AvailablePaymentPointsButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => onPressed(),
        splashColor: ThemeHelper.lightGrey,
        borderRadius: BorderRadius.circular(5.r),
        child: Ink(
          width: 330.w,
          height: 27.h,
          decoration: BoxDecoration(
            color: ThemeHelper.white,
            border: Border.all(color: ThemeHelper.crimson50, width: 1.5.w),
            borderRadius: BorderRadius.circular(5.r),
            boxShadow: [
              BoxShadow(
                color: ThemeHelper.crimson10,
                offset: const Offset(0, 0),
                blurRadius: 4.r,
                spreadRadius: 0,
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 10.w),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Доступна оплата баллами',
                style: TextStyleHelper.f12w500.copyWith(
                  color: ThemeHelper.crimson,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
