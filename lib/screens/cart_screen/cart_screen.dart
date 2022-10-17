import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/customCachedNetworkImage_widget.dart';
import 'package:malina_app/global_widgets/searchTextField_widget.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/sign_up_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          'Корзина',
          style: TextStyleHelper.f20w700.copyWith(
            color: ThemeHelper.blackDial,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 48.h),
              Text(
                'Корзина пуста',
                style: TextStyleHelper.f18w500,
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: 170.w,
                child: Text(
                  'Воспользуйтесь поиском, что бы найти всё что нужно',
                  textAlign: TextAlign.center,
                  style: TextStyleHelper.f14w400.copyWith(
                    color: ThemeHelper.greyDial,
                  ),
                ),
              ),
              SizedBox(height: 15.h),
              SearchTextFieldWidget(
                controller: TextEditingController(),
                width: 302,
                fillColor: ThemeHelper.rgb238,
              ),
              SizedBox(height: 25.h),
              SizedBox(
                width: 243.w,
                child: Text(
                  'Если в корзине были товары - войдите, чтобы посмотреть список',
                  textAlign: TextAlign.center,
                  style: TextStyleHelper.f14w400.copyWith(
                    color: ThemeHelper.greyDial,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              TextButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpScreen(),
                  ),
                ),
                child: Text(
                  'Войти',
                  style: TextStyleHelper.f18w600.copyWith(
                    color: ThemeHelper.crimson,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: 41.h,
                  left: 15.w,
                  right: 25.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Новости',
                      style: TextStyleHelper.f24w800.copyWith(
                        color: ThemeHelper.blackDial,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: WidgetsHelpers().imageIcon(
                        IconHelper.buttonRight,
                        20,
                        ThemeHelper.primaryDark,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 1.sw,
                height: 160.h,
                child: ListView.separated(
                  padding: EdgeInsets.only(left: 15.w),
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {},
                    child: Stack(
                      children: [
                        CustomCachedNetworkImage(
                          imageUrl: 'https://a.d-cd.net/afeea0as-960.jpg',
                          width: 130.w,
                          height: 160.h,
                          borderRadius: BorderRadius.circular(15.r),
                          boxFit: BoxFit.fill,
                        ),
                        Positioned(
                          top: 12.h,
                          left: 96.w,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              gradient: const LinearGradient(
                                colors: [
                                  Color(0xffFF2A96),
                                  Color(0xff001783),
                                  Color(0xff0A114F),
                                ],
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.w),
                              child: Text(
                                '15%',
                                style: TextStyleHelper.f10w400
                                    .copyWith(color: ThemeHelper.white),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          top: 83.h,
                          left: 15.w,
                          right: 15.w,
                          child: Column(
                            children: [
                              Text(
                                'Аренда машины skjdc jsdkcs',
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleHelper.f16w700
                                    .copyWith(color: ThemeHelper.white),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                'до 30 января 2021',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyleHelper.f12w400
                                    .copyWith(color: ThemeHelper.crimson),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(width: 10.w),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
