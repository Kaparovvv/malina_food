import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/widget_state.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/screens/authorization_screens/auth_screen/auth_screen.dart';
import 'package:malina_app/screens/bottomNavigationBar_widget/main_screen_bloc/bloc/main_screen_bloc.dart';
import 'package:malina_app/screens/bottomNavigationBar_widget/local_widgets/customBarItem_widget.dart';
import 'package:malina_app/screens/qr_code_screens/qr_code_scanner_screen/qr_code_scanner_screen.dart';

// ignore: must_be_immutable
class BottomNavigationBarWidget extends StatefulWidget {
  bool isLoginUser;
  BottomNavigationBarWidget({super.key, this.isLoginUser = false});

  @override
  State<BottomNavigationBarWidget> createState() =>
      _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  // int currentIndex = 0;
  late Widget screenName;
  late MainScreenBloc _mainScreenBloc;

  @override
  void initState() {
    _mainScreenBloc = MainScreenBloc();
    _mainScreenBloc.add(HomeScreenEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.isLoginUser
          ? BlocBuilder<MainScreenBloc, MainScreenState>(
              bloc: _mainScreenBloc,
              builder: (context, state) {
                if (state is ScreenState) {
                  return state.screenName;
                }
                return const SizedBox();
              },
            )
          : const AuthScreen(),
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
                _mainScreenBloc.add(FeedScreenEvent());
                setState(() {
                  widget.isLoginUser = true;
                  WidgetState.currentIndex = 1;
                  WidgetState.isFeed = !WidgetState.isFeed;
                  WidgetState.isProfile = false;
                  WidgetState.isBacket = false;
                });
              },
            ),
            CustomBarItewWidget(
              isState: WidgetState.isQrCode,
              iconName: IconHelper.qrCodeIcon,
              labelText: 'QR-code',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const QrCodeScannerScreen(),
                  ),
                );
                setState(() {
                  widget.isLoginUser = true;
                  WidgetState.isFeed = false;
                  WidgetState.isProfile = false;
                  WidgetState.isBacket = false;
                });
              },
            ),
            Material(
              child: InkWell(
                onTap: () {
                  _mainScreenBloc.add(HomeScreenEvent());
                  setState(() {
                    widget.isLoginUser = true;
                    WidgetState.isBacket = false;
                    WidgetState.isProfile = false;
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
                _mainScreenBloc.add(CartScreenEvent());

                setState(() {
                  widget.isLoginUser = true;
                  WidgetState.currentIndex = 2;
                  WidgetState.isBacket = !WidgetState.isBacket;
                  WidgetState.isFeed = false;
                  WidgetState.isProfile = false;
                });
              },
            ),
            CustomBarItewWidget(
              isState: WidgetState.isProfile,
              iconName: IconHelper.profileIcon,
              labelText: 'Профиль',
              onTap: () {
                _mainScreenBloc.add(ProfileScreenEvent());

                setState(() {
                  widget.isLoginUser = true;
                  WidgetState.currentIndex = 3;
                  WidgetState.isProfile = !WidgetState.isProfile;
                  WidgetState.isFeed = false;
                  WidgetState.isBacket = false;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
