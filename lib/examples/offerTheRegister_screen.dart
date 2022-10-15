import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/commons/image_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/text_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/buttonCrimson_widget.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/local_widgets/close_button_widget.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/sign_up_screen.dart';
import 'package:malina_app/screens/nav_bar_widget.dart';

class OfferTheRegisterScreen extends StatelessWidget {
  const OfferTheRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CloseButtonWidget().closeButton(
        () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const NavBarWidget(currentIndex: 2),
            ),
          );
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            ImageHelper.appLogo,
            width: 200.w,
          ),
          SizedBox(height: 80.h),
          SizedBox(
            width: 240.w,
            child: Text(
              TextHelper.authTxt,
              textAlign: TextAlign.center,
              style: TextStyleHelper.f24w800.copyWith(color: ThemeHelper.black),
            ),
          ),
          SizedBox(height: 10.h),
          Text(
            TextHelper.authTxt1,
            textAlign: TextAlign.center,
            style: TextStyleHelper.f14w400.copyWith(color: ThemeHelper.c1C1C1C),
          ),
          SizedBox(height: 30.h),
          ButtonCrimsonWidget(
            txtButton: TextHelper.authTxt,
            textStyle:
                TextStyleHelper.f16w600.copyWith(color: ThemeHelper.white),
            width: 273,
            height: 43,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
              );
              Box tokenBox = Hive.box('tokenBox');
              Box refreshTokenBox = Hive.box('refreshTokenBox');
              log('Token ======= ${tokenBox.get('token')}');
              log('Refresh token  ======= ${refreshTokenBox.get('refreshToken')}');
            },
          ),
        ],
      ),
    );
  }
}
