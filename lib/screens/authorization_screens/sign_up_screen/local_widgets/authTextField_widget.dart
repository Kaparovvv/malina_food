import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/local_widgets/sign_up_widgets.dart';

class AuthTextFieldWidget extends StatelessWidget {
  final TextEditingController phoneController;
  final Function() onTab;
  const AuthTextFieldWidget({
    super.key,
    required this.phoneController,
    required this.onTab,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 330.w,
      height: 50.h,
      child: TextFormField(
        controller: phoneController,
        keyboardType: TextInputType.phone,
        inputFormatters: [SignUpWidgets().maskFormatter],
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
            borderSide: BorderSide(color: ThemeHelper.crimson),
          ),
          hintText: '+996 ( _ _ _ ) _ _ - _ _ - _ _',
          hintStyle: TextStyleHelper.f18w400.copyWith(color: ThemeHelper.black),
          suffixIcon: SignUpWidgets().suffixButton(
            () => onTab(),
          ),
        ),
      ),
    );
  }
}
