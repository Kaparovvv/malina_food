import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/examples/push_screen.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';
import 'package:malina_app/screens/authorization_screens/register_screen/register_screen.dart';
import 'package:malina_app/screens/cart_screen/cart_screen.dart';
import 'package:malina_app/screens/main_screens/categories_screen/categories_screen.dart';
import 'package:malina_app/screens/profile_screen/profile_screen.dart';

import 'qr_code_screens/qr_code_scanner_screen/qr_code_scanner_screen.dart';

class NavBarWidget extends StatefulWidget {
  final int currentIndex;
  const NavBarWidget({
    super.key,
    required this.currentIndex,
  });

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  late int _selectedIndex;
  late String? deviceId;

  @override
  void initState() {
    _selectedIndex = widget.currentIndex;
    super.initState();
  }

  void onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: _selectedIndex,
          children: const [
            RegisterScreen(),
            QrCodeScannerScreen(),
            CategoriesScreen(),
            CartScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: ThemeHelper.navBarShadow,
            blurRadius: 30.r,
            offset: const Offset(15, 0),
          )
        ]),
        child: BottomNavigationBar(
          backgroundColor: ThemeHelper.white,
          selectedItemColor: ThemeHelper.crimson,
          unselectedIconTheme: IconThemeData(color: ThemeHelper.color7a7a7a),
          selectedLabelStyle: TextStyleHelper.seletedLabel,
          unselectedLabelStyle: TextStyleHelper.unseletedLabel,
          type: BottomNavigationBarType.fixed,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: WidgetsHelpers().logoIcon(IconHelper.feedIcon),
              label: 'Лента',
            ),
            BottomNavigationBarItem(
              icon: WidgetsHelpers().logoIcon(IconHelper.qrCodeIcon),
              label: 'QR-code',
            ),
            BottomNavigationBarItem(
              icon: itemIcon(),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: WidgetsHelpers().logoIcon(IconHelper.cartIcon),
              label: 'Корзина',
            ),
            BottomNavigationBarItem(
              icon: WidgetsHelpers().logoIcon(IconHelper.profileIcon),
              label: 'Профиль',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(
              () {
                _selectedIndex = index;
              },
            );
          },
        ),
      ),
    );
  }

  Widget itemIcon() {
    return Container(
      width: 46.w,
      height: 46.h,
      decoration: BoxDecoration(
        color: ThemeHelper.crimson,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: ThemeHelper.rgb170,
            offset: const Offset(0, 0),
            blurRadius: 10.r,
          ),
        ],
      ),
      child: ImageIcon(
        AssetImage(IconHelper.mainScreenIcon),
        size: 25,
        color: ThemeHelper.white,
      ),
    );
  }
}
