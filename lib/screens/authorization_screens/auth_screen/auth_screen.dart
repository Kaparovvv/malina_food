import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/text_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/buttonCrimson_widget.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';
import 'package:malina_app/screens/authorization_screens/auth_screen/local_widgets/infoBox_widget.dart';
import 'package:malina_app/screens/authorization_screens/auth_screen/local_widgets/informationButton_widget.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/sign_up_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25.w, top: 52.h, right: 25.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextHelper.authTxt,
                  style: TextStyleHelper.f24w800
                      .copyWith(color: ThemeHelper.black),
                ),
                SizedBox(height: 10.h),
                Text(
                  TextHelper.authTxt1,
                  style: TextStyleHelper.f14w400
                      .copyWith(color: ThemeHelper.c1C1C1C),
                ),
                SizedBox(height: 10.h),
                ButtonCrimsonWidget(
                  txtButton: TextHelper.authTxt,
                  textStyle: TextStyleHelper.f16w600
                      .copyWith(color: ThemeHelper.white),
                  width: 273,
                  height: 43,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 30.h),
          InfoBoxWidget(
            listWidgets: [
              InformationButtonWidget(
                onTab: () {},
                iconWidget:
                    WidgetsHelpers().imageIconCrimson(IconHelper.deliveryIcon),
                textButton: 'Способы доставки',
              ),
              SizedBox(height: 14.h),
              WidgetsHelpers().divider(),
              SizedBox(height: 14.h),
              InformationButtonWidget(
                onTab: () {},
                iconWidget:
                    WidgetsHelpers().imageIconCrimson(IconHelper.cardIcon),
                textButton: 'Способы оплаты',
              ),
              SizedBox(height: 14.h),
              WidgetsHelpers().divider(),
              SizedBox(height: 14.h),
              InformationButtonWidget(
                onTab: () {},
                iconWidget:
                    WidgetsHelpers().imageIconCrimson(IconHelper.agreementIcon),
                textButton: 'Пользовательское соглашение',
              ),
              SizedBox(height: 14.h),
              WidgetsHelpers().divider(),
              SizedBox(height: 14.h),
              InformationButtonWidget(
                onTab: () {},
                iconWidget:
                    WidgetsHelpers().imageIconCrimson(IconHelper.commentIcon),
                textButton: 'Помощь',
              ),
              SizedBox(height: 14.h),
              WidgetsHelpers().divider(),
              SizedBox(height: 14.h),
              InformationButtonWidget(
                onTab: () {},
                iconWidget: Image.asset(
                  IconHelper.logoIcon,
                  width: 24.w,
                  height: 24.h,
                ),
                textButton: 'О приложении',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
