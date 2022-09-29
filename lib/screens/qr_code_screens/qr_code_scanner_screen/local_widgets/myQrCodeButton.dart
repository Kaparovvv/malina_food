import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';

class MyQrCodeButton extends StatelessWidget {
  final Function() onPressed;
  const MyQrCodeButton({
    Key? key,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      borderRadius: BorderRadius.circular(15.r),
      child: Container(
        width: 270.w,
        height: 50.h,
        decoration: BoxDecoration(
          color: ThemeHelper.blue,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Мой QR-код',
                style: TextStyleHelper.f18w600.copyWith(
                  color: ThemeHelper.white,
                ),
              ),
              SizedBox(width: 20.w),
              Icon(
                Icons.arrow_forward_outlined,
                size: 30,
                color: ThemeHelper.white,
              )
            ],
          ),
        ),
      ),
    );
  }
}
