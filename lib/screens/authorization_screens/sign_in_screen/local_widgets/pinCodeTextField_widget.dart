
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';

class PinCodeTextField extends StatelessWidget {
  final TextEditingController codeController;
  final bool first;
  final bool last;
  final Function() onPressed;

  const PinCodeTextField({
    super.key,
    required this.codeController,
    required this.first,
    required this.last,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 30.w,
      height: 33.h,
      child: TextFormField(
        maxLength: 1,
        showCursor: false,
        readOnly: false,
        controller: codeController,
        keyboardType: TextInputType.number,
        cursorColor: ThemeHelper.crimson,
        textAlign: TextAlign.center,
        style: TextStyleHelper.f18w400.copyWith(color: ThemeHelper.black),
        decoration: InputDecoration(
          counter: const Offstage(),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 2.w,
              color: ThemeHelper.rgba196,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              width: 3,
              color: ThemeHelper.crimson,
            ),
          ),
        ),
        onChanged: (value) {
          if (value.length == 1 && last == false) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty && first == false) {
            FocusScope.of(context).previousFocus();
          }
        },
        onFieldSubmitted: (value) => onPressed(),
      ),
    );
  }
}
