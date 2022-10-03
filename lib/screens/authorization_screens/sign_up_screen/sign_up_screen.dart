import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/loadingIndicator_widget.dart';
import 'package:malina_app/screens/authorization_screens/sign_in_screen/sign_in_screen.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/bloc/sign_up_bloc.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/local_widgets/authTextField_widget.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/local_widgets/close_button_widget.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController phoneController = TextEditingController();
  late SignUpBloc _signUpBloc;
  late bool isErrorText;

  @override
  void initState() {
    _signUpBloc = SignUpBloc();
    isErrorText = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MaskTextInputFormatter maskFormatter = MaskTextInputFormatter(
      mask: '+996 (###) ##-##-##',
      filter: {"#": RegExp(r'[0-9]', dotAll: true)},
      type: MaskAutoCompletionType.eager,
    );
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
            BlocConsumer<SignUpBloc, SignUpState>(
              bloc: _signUpBloc,
              listener: (context, state) {
                if (state is ErrorSignUpState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.message.toString(),
                      ),
                    ),
                  );
                }

                if (state is LoadedSignUpState) {
                  if (phoneController.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignInScreen(
                          phone: phoneController.text,
                          prefixPhone: '+996${maskFormatter.getUnmaskedText()}',
                        ),
                      ),
                    );
                  } else {
                    isErrorText = true;
                  }
                }
              },
              builder: (context, state) {
                if (state is LoadingSignUpState) {
                  return const LoadingIndicatorWidget();
                }
                return AuthTextFieldWidget(
                  maskFormatter: maskFormatter,
                  phoneController: phoneController,
                  onTab: () {
                    _signUpBloc.add(
                      PostSignUpEvent(
                        phone: '+996${maskFormatter.getUnmaskedText()}',
                      ),
                    );
                  },
                  isErrorText: isErrorText,
                );
              },
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: 330.w,
              height: 28.h,
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
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
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
