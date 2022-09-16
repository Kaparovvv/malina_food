import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/screens/authorization_screens/sign_in_screen/local_widgets/pinCodeTextField_widget.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/local_widgets/close_button_widget.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});
  final TextEditingController num1 = TextEditingController();
  final TextEditingController num2 = TextEditingController();
  final TextEditingController num3 = TextEditingController();
  final TextEditingController num4 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CloseButtonWidget().closeButton(
        () => Navigator.pop(context),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 112.w,
              height: 42.h,
              child: Text(
                'Потвердите ваш номер',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyleHelper.f18w600.copyWith(
                  color: ThemeHelper.blackDial,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              'Мы отправили смс с кодом на номер \n+996 700 12-34-56',
              textAlign: TextAlign.center,
              style: TextStyleHelper.f14w400.copyWith(
                color: ThemeHelper.blackDial,
              ),
            ),
            SizedBox(height: 13.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PinCodeTextField(
                  codeController: num1,
                  first: true,
                  last: false,
                  onPressed: () {},
                ),
                SizedBox(width: 10.h),
                PinCodeTextField(
                  codeController: num2,
                  first: false,
                  last: false,
                  onPressed: () {},
                ),
                SizedBox(width: 10.h),
                PinCodeTextField(
                  codeController: num3,
                  first: false,
                  last: false,
                  onPressed: () {},
                ),
                SizedBox(width: 10.h),
                PinCodeTextField(
                  codeController: num4,
                  first: false,
                  last: true,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 20.h),
            TextButton(
              onPressed: () {},
              child: Text(
                'Отправить еще раз',
                style: TextStyleHelper.f14w400.copyWith(
                  color: ThemeHelper.blackDial,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
