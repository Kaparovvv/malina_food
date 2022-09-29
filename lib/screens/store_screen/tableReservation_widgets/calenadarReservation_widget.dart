import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/screens/store_screen/tableReservation_widgets/buttonOfTheWeek_widget.dart';
import 'package:malina_app/screens/store_screen/tableReservation_widgets/customYellow_widget.dart';

class CalendarReservationWidget extends StatefulWidget {
  const CalendarReservationWidget({super.key});

  @override
  State<CalendarReservationWidget> createState() =>
      _CalendarReservationWidgetState();
}

class _CalendarReservationWidgetState extends State<CalendarReservationWidget> {
  DateTime selectedDate = DateTime.now();

  int currentDateSelectedIndex = 0;
  int currentHoursSelectedIndex = 0;

  ScrollController scrollController = ScrollController();

  List<String> listOfDays = ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'День',
          style:
              TextStyleHelper.f16w500.copyWith(color: ThemeHelper.blackDial),
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: 53.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 31,
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            itemBuilder: (context, index) {
              return ButtonDayOfTheWeekWidget(
                width: 35,
                height: 53,
                widgetData: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      DateTime.now()
                          .add(Duration(days: index))
                          .day
                          .toString(),
                      style: TextStyleHelper.f14w400.copyWith(
                        color: currentDateSelectedIndex == index
                            ? ThemeHelper.white
                            : ThemeHelper.blackDial,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      listOfDays[DateTime.now()
                                  .add(Duration(days: index))
                                  .weekday -
                              1]
                          .toString(),
                      style: TextStyleHelper.f12w400.copyWith(
                        color: currentDateSelectedIndex == index
                            ? ThemeHelper.white
                            : ThemeHelper.blackDial,
                      ),
                    ),
                  ],
                ),
                themeButton: currentDateSelectedIndex == index
                    ? ThemeHelper.green
                    : ThemeHelper.bejGray,
                onTap: () {
                  setState(() {
                    currentDateSelectedIndex = index;
                    selectedDate = DateTime.now().add(Duration(days: index));
                  });
                },
                isShadow: currentDateSelectedIndex == index ? true : false,
              );
            },
          ),
        ),
        SizedBox(height: 31.h),
        Text(
          'Время',
          style:
              TextStyleHelper.f16w500.copyWith(color: ThemeHelper.blackDial),
        ),
        SizedBox(height: 18.h),
        SizedBox(
          height: 35.h,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: 24,
            separatorBuilder: (context, index) => SizedBox(width: 10.w),
            itemBuilder: (context, index) {
              return ButtonDayOfTheWeekWidget(
                width: 53,
                height: 35,
                widgetData: Center(
                  child: Text(
                    '${DateTime.now().add(Duration(hours: index)).hour.toString()} : 00',
                    style: TextStyleHelper.f12w400.copyWith(
                      color: currentHoursSelectedIndex == index
                          ? ThemeHelper.white
                          : ThemeHelper.blackDial,
                    ),
                  ),
                ),
                onTap: () {
                  setState(() {
                    currentHoursSelectedIndex = index;
                    selectedDate = DateTime.now().add(Duration(days: index));
                  });
                },
                isShadow: currentHoursSelectedIndex == index ? true : false,
                themeButton: currentHoursSelectedIndex == index
                    ? ThemeHelper.green
                    : ThemeHelper.bejGray,
              );
            },
          ),
        ),
        CustomYellowWidget(
          title: 'Забронировать',
          onPressed: () {},
        ),
      ],
    );
  }
}
