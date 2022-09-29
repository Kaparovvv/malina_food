import 'dart:ffi';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/screens/store_screen/contact_store/addressStore_widget.dart';
import 'package:malina_app/screens/store_screen/tableReservation_widgets/calenadarReservation_widget.dart';
import 'package:malina_app/screens/store_screen/tableReservation_widgets/numberOFQuests.dart';

class FunctionalTabBarWidget extends StatelessWidget {
  final Map<String, dynamic>? infoListOfStore;

  const FunctionalTabBarWidget({
    Key? key,
    required TabController tabControllerSecond,
    required this.infoListOfStore,
  })  : _tabControllerSecond = tabControllerSecond,
        super(key: key);

  final TabController _tabControllerSecond;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Column(
        children: [
          DefaultTabController(
            length: 4,
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  controller: _tabControllerSecond,
                  height: 27.h,
                  radius: 10.r,
                  backgroundColor: ThemeHelper.yellow,
                  unselectedBackgroundColor: ThemeHelper.colorF8F7FA,
                  borderWidth: 1,
                  borderColor: ThemeHelper.yellow,
                  unselectedBorderColor: ThemeHelper.colorF8F7FA,
                  physics: const BouncingScrollPhysics(),
                  tabs: [
                    Tab(
                      child: SizedBox(
                        height: 27.h,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Text(
                              'Наш адрес',
                              style: TextStyleHelper.f14w400
                                  .copyWith(color: ThemeHelper.blackDial),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: 27.h,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Text(
                              'Бронирование стола',
                              style: TextStyleHelper.f14w400
                                  .copyWith(color: ThemeHelper.blackDial),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: 27.h,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Text(
                              'Маршрут',
                              style: TextStyleHelper.f14w400
                                  .copyWith(color: ThemeHelper.blackDial),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: 27.h,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Text(
                              'Вызвать такси',
                              style: TextStyleHelper.f14w400
                                  .copyWith(color: ThemeHelper.blackDial),
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
          SizedBox(height: 25.h),
          Expanded(
            child: TabBarView(
              controller: _tabControllerSecond,
              children: <Widget>[
                 AddressStoresWidget(infoListOfStore: infoListOfStore),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 11.w,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Количество гостей',
                        style: TextStyleHelper.f16w500
                            .copyWith(color: ThemeHelper.blackDial),
                      ),
                      SizedBox(height: 15.h),
                      SizedBox(
                        width: 110.w,
                        child: const NumberOfQuestsWidget(),
                      ),
                      SizedBox(height: 12.h),
                      const CalendarReservationWidget(),
                    ],
                  ),
                ),
                const Center(
                  child: Text('Маршрут'),
                ),
                const Center(
                  child: Text('Вызвать такси'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
