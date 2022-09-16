import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/them_helper.dart';

class ButtonCrimsonWidget extends StatelessWidget {
  final Function() onPressed;
  final String txtButton;
  final double width;
  final double height;
  final TextStyle? textStyle;

  const ButtonCrimsonWidget({
    Key? key,
    required this.onPressed,
    required this.txtButton,
    required this.width,
    required this.height,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(width.w, height.h),
        ),
        backgroundColor: MaterialStateProperty.all(ThemeHelper.crimson),
      ),
      child: Text(
        txtButton,
        style: textStyle,
      ),
    );
  }
}
