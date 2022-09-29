import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpWidgets {
  final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
    mask: '+996 (###) ##-##-##',
    filter: {"#": RegExp(r'[0-9]', dotAll: true)},
    type: MaskAutoCompletionType.eager,
  );

  Widget suffixButton(Function() onTap) {
    return InkWell(
      onTap: () => onTap(),
      borderRadius: BorderRadius.circular(25.r),
      splashColor: ThemeHelper.bejGray,
      child: Ink(
        width: 50.w,
        height: 50.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ThemeHelper.rgba10,
        ),
        child: Icon(
          Icons.arrow_forward,
          color: ThemeHelper.white,
          size: 33,
        ),
      ),
    );
  }
}
