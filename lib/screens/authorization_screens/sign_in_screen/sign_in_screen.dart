import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/loadingIndicator_widget.dart';
import 'package:malina_app/screens/authorization_screens/sign_in_screen/bloc/sign_in_bloc.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/bloc/sign_up_bloc.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/local_widgets/close_button_widget.dart';
import 'package:malina_app/screens/bottomNavigationBar_widget/bottomNavigationBar_widget.dart';
import 'package:otp_autofill/otp_autofill.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class SignInScreen extends StatefulWidget {
  final String phone;
  final String prefixPhone;
  const SignInScreen({
    super.key,
    required this.phone,
    required this.prefixPhone,
  });

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  late SignInBloc _signInBloc;
  late SignUpBloc _signUpBloc;

  final scaffoldKey = GlobalKey();

  late OTPTextEditController _otpTextEditController =
      OTPTextEditController(codeLength: 6);
  late OTPInteractor _otpInteractor;

  String currentIndex = '';

  @override
  void initState() {
    super.initState();
    _signInBloc = SignInBloc();
    _signUpBloc = SignUpBloc();
    _otpInteractor = OTPInteractor();

    if (Platform.isAndroid) {
      _otpTextEditController = OTPTextEditController(
        codeLength: 6,
        otpInteractor: _otpInteractor,
      )..startListenUserConsent((code) {
          final exp = RegExp(r'(\d{6})');
          return exp.stringMatch(code ?? '') ?? '';
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CloseButtonWidget().closeButton(() {
        Navigator.pop(context);
      }),
      key: scaffoldKey,
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
              'Мы отправили смс с кодом на номер \n${widget.phone}',
              textAlign: TextAlign.center,
              style: TextStyleHelper.f14w400.copyWith(
                color: ThemeHelper.blackDial,
              ),
            ),
            BlocConsumer<SignInBloc, SignInState>(
              bloc: _signInBloc,
              listener: (context, state) {
                if (state is ErrorSignInState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        state.message.toString(),
                      ),
                    ),
                  );
                }

                if (state is LoadedSignInState) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BottomNavigationBarWidget(
                        isLoginUser: true,
                      ),
                    ),
                  );
                  Box tokenBox = Hive.box('tokenBox');
                  Box refreshTokenBox = Hive.box('refreshTokenBox');
                  log('Token ======= ${tokenBox.get('token')}');
                  log('Refresh token  ======= ${refreshTokenBox.get('refreshToken')}');
                }
              },
              builder: (context, state) {
                if (state is LoadingSignInState) {
                  return const LoadingIndicatorWidget();
                }
                return Padding(
                  padding: EdgeInsets.only(
                      top: 13.h, bottom: 20.h, left: 67.5.w, right: 67.5.w),
                  child: PinCodeTextField(
                    controller: _otpTextEditController,
                    appContext: context,
                    length: 6,
                    hapticFeedbackTypes: HapticFeedbackTypes.vibrate,
                    keyboardType: TextInputType.number,
                    cursorColor: ThemeHelper.crimson,
                    textStyle: TextStyleHelper.f18w400
                        .copyWith(color: ThemeHelper.black),
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.underline,
                      fieldHeight: 33.h,
                      fieldWidth: 30.w,
                      activeColor: ThemeHelper.blue,
                      selectedColor: ThemeHelper.crimson,
                      inactiveColor: ThemeHelper.rgba196,
                    ),
                    onChanged: (value) {
                      debugPrint(value);
                      setState(
                        () {
                          currentIndex = value;
                        },
                      );
                    },
                    onCompleted: (value) {
                      _signInBloc.add(
                        PostSignInEvent(
                          phone: widget.prefixPhone,
                          confirmationCode: _otpTextEditController.text,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            TextButton(
              onPressed: () {
                _signUpBloc.add(
                  PostSignUpEvent(
                    phone: widget.prefixPhone,
                  ),
                );
              },
              child: Text(
                'Отправить еще раз',
                style: TextStyleHelper.f14w400.copyWith(
                  color: ThemeHelper.blackDial,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // @override
  // Future<void> dispose() async {
  //   await _otpTextEditController.stopListen();
  //   super.dispose();
  // }
}
