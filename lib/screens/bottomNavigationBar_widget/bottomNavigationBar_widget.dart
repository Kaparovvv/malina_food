import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/widget_state.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/screens/cart_screen/cart_screen.dart';
import 'package:malina_app/screens/bottomNavigationBar_widget/local_widgets/customBarItem_widget.dart';
import 'package:malina_app/screens/feed_screen/feed_screen.dart';
import 'package:malina_app/screens/main_screens/categories_screen/categories_screen.dart';
import 'package:malina_app/screens/profile_screen/profile_screen.dart';
import 'package:malina_app/screens/qr_code_screen/qr_code_screen.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  int currentIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    const HomeScreen(),
    // const AuthScreen(),
    const FeedScreen(),
    const QrCodeScreen(),
    const CartScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[WidgetState.currentIndex],
      // body: const AuthScreen(),
      bottomNavigationBar: Container(
        width: 1.sw,
        height: 56.h,
        decoration: BoxDecoration(
          color: ThemeHelper.white,
          boxShadow: [
            BoxShadow(
              color: ThemeHelper.navBarShadow,
              offset: const Offset(15, 0),
              blurRadius: 30,
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            CustomBarItewWidget(
              isState: WidgetState.isFeed,
              iconName: IconHelper.feedIcon,
              labelText: 'Лента',
              onTap: () {
                setState(() {
                  WidgetState.currentIndex = 1;
                  WidgetState.isFeed = !WidgetState.isFeed;
                  WidgetState.isProfile = false;
                  WidgetState.isBacket = false;
                  WidgetState.isQrCode = false;
                });
              },
            ),
            CustomBarItewWidget(
              isState: WidgetState.isQrCode,
              iconName: IconHelper.qrCodeIcon,
              labelText: 'QR-code',
              onTap: () {
                setState(() {
                  WidgetState.currentIndex = 2;
                  WidgetState.isQrCode = !WidgetState.isQrCode;
                  WidgetState.isFeed = false;
                  WidgetState.isProfile = false;
                  WidgetState.isBacket = false;
                });
              },
            ),
            Material(
              child: InkWell(
                onTap: () {
                  setState(() {
                    WidgetState.isBacket = false;
                    WidgetState.isProfile = false;
                    WidgetState.isQrCode = false;
                    WidgetState.isFeed = false;
                  });
                  WidgetState.currentIndex = 0;
                },
                borderRadius: BorderRadius.circular(46.r),
                splashColor: ThemeHelper.bejGray,
                child: Ink(
                  width: 46.w,
                  height: 46.h,
                  decoration: BoxDecoration(
                    color: ThemeHelper.crimson,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    IconHelper.mainScreenIcon,
                    width: 18.w,
                    height: 18.h,
                    color: ThemeHelper.white,
                  ),
                ),
              ),
            ),
            CustomBarItewWidget(
              isState: WidgetState.isBacket,
              iconName: IconHelper.cartIcon,
              labelText: 'Корзина',
              onTap: () {
                setState(() {
                  WidgetState.currentIndex = 3;
                  WidgetState.isBacket = !WidgetState.isBacket;
                  WidgetState.isFeed = false;
                  WidgetState.isProfile = false;
                  WidgetState.isQrCode = false;
                });
              },
            ),
            CustomBarItewWidget(
              isState: WidgetState.isProfile,
              iconName: IconHelper.profileIcon,
              labelText: 'Профиль',
              onTap: () {
                setState(() {
                  WidgetState.currentIndex = 4;
                  WidgetState.isProfile = !WidgetState.isProfile;
                  WidgetState.isFeed = false;
                  WidgetState.isBacket = false;
                  WidgetState.isQrCode = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
