import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/screens/authorization_screens/sign_in_screen/sign_in_screen.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/local_widgets/authTextField_widget.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/local_widgets/close_button_widget.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final TextEditingController phoneController = TextEditingController();

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
              width: 210.w,
              height: 42.h,
              child: Text(
                'Для оформления заказа нужен ваш телефон',
                textAlign: TextAlign.center,
                maxLines: 2,
                style: TextStyleHelper.f18w600.copyWith(
                  color: ThemeHelper.black,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            Text(
              'Заполните поле',
              style: TextStyleHelper.f14w400.copyWith(
                color: ThemeHelper.black,
              ),
            ),
            SizedBox(height: 25.h),
            AuthTextFieldWidget(
              phoneController: phoneController,
              onTab: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInScreen(),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 330.w,
              height: 28.h,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: 'Продолжая, Вы соглашаетесь со ',
                    style: TextStyleHelper.f12w400
                        .copyWith(color: ThemeHelper.black),
                  ),
                  TextSpan(
                    text:
                        'сбором, обработкой персональных данных и Ползовательским соглашением',
                    style: TextStyleHelper.f12w400.copyWith(
                      color: ThemeHelper.black,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
