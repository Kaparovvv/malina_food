import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/local_widgets/sign_up_widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthTextFieldWidget extends StatelessWidget {
  final TextEditingController phoneController;
  final Function() onTab;
  final MaskTextInputFormatter maskFormatter;
  final bool isErrorText;
  const AuthTextFieldWidget({
    super.key,
    required this.phoneController,
    required this.onTab,
    required this.maskFormatter,
    this.isErrorText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330.w,
      height: 50.h,
      child: TextFormField(
        controller: phoneController,
        keyboardType: TextInputType.phone,
        inputFormatters: [maskFormatter],
        style: TextStyleHelper.f18w400.copyWith(color: ThemeHelper.black),
        cursorColor: ThemeHelper.crimson,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.only(left: 12.w),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(color: ThemeHelper.lightGrey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25.r),
            borderSide: BorderSide(color: ThemeHelper.blue),
          ),
          hintText: '+996 ( _ _ _ ) _ _ - _ _ - _ _',
          hintStyle: TextStyleHelper.f18w400.copyWith(color: ThemeHelper.black),
          suffixIcon: SignUpWidgets().suffixButton(
            () => onTab(),
          ),
          errorBorder: isErrorText
              ? OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.r),
                  borderSide:
                      BorderSide(color: ThemeHelper.crimson, width: 2.w),
                )
              : null,
          errorText: isErrorText ? 'Поле не может быть пустым' : null,
          errorStyle:
              TextStyleHelper.f14w500.copyWith(color: ThemeHelper.crimson),
        ),
      ),
    );
  }
}
