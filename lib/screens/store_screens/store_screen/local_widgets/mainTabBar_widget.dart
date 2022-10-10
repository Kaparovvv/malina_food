import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';

class MainTabBarWidget extends StatelessWidget {
  const MainTabBarWidget({
    Key? key,
    required TabController tabControllerFirst,
  })  : _tabControllerFirst = tabControllerFirst,
        super(key: key);

  final TabController _tabControllerFirst;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 40.h,
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: [
            ButtonsTabBar(
              controller: _tabControllerFirst,
              height: 40.h,
              radius: 10.r,
              backgroundColor: ThemeHelper.yellow,
              unselectedBackgroundColor: ThemeHelper.white,
              borderWidth: 1,
              borderColor: ThemeHelper.yellow,
              unselectedBorderColor: ThemeHelper.bejGray,
              physics: const BouncingScrollPhysics(),
              tabs: [
                Tab(
                  child: SizedBox(
                    width: 155.w,
                    height: 40.h,
                    child: Center(
                      child: Text(
                        'Меню',
                        style: TextStyleHelper.f16w500.copyWith(
                          color: ThemeHelper.blackDial,
                        ),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: 155.w,
                    height: 40.h,
                    child: Center(
                      child: Text(
                        'Контакты',
                        style: TextStyleHelper.f16w500.copyWith(
                          color: ThemeHelper.blackDial,
                        ),
                      ),
                    ),
                  ),
                ),
                Tab(
                  child: SizedBox(
                    width: 155.w,
                    height: 40.h,
                    child: Center(
                      child: Text(
                        'Отзывы',
                        style: TextStyleHelper.f16w500.copyWith(
                          color: ThemeHelper.blackDial,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
