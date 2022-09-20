import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';
import 'package:malina_app/screens/main_screens/institution_screen/local_widgets/iconBoxButton_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/subcateg_widgets.dart';

class InfoBoxInstitutionWidget extends StatelessWidget {
  final String? institutionName;
  final String? typeInstitution;
  InfoBoxInstitutionWidget({
    Key? key,
    required this.institutionName,
    required this.typeInstitution,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 330.w,
      height: 110.h,
      decoration: BoxDecoration(
          color: ThemeHelper.white,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
              color: ThemeHelper.rgb159,
              offset: const Offset(0, 4),
              blurRadius: 15.r,
              spreadRadius: 0,
            )
          ]),
      child: Padding(
        padding: EdgeInsets.only(
          left: 15.w,
          top: 10.h,
          right: 10.w,
          bottom: 15.w,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 200.w,
                      height: 21.h,
                      child: Text(
                        institutionName!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleHelper.f18w600.copyWith(
                          color: ThemeHelper.blackDial,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    SizedBox(
                      width: 150.w,
                      height: 17.h,
                      child: Text(
                        typeInstitution!,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyleHelper.f14w400.copyWith(
                          color: ThemeHelper.greyDial,
                        ),
                      ),
                    ),
                  ],
                ),
                IconBoxButtonWidget(
                  onPressed: () {},
                  iconName: IconHelper.shareIcon,
                  iconTheme: ThemeHelper.black,
                ),
                IconBoxButtonWidget(
                  onPressed: () {},
                  iconName: IconHelper.bookmarks,
                  iconTheme: ThemeHelper.crimson,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: listOfWidgets,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> listOfWidgets = [
    SubcategoriesWidgets().boxIconText(
      '4,5',
      WidgetsHelpers().imageIcon(
        IconHelper.iconStar,
        12,
        ThemeHelper.yellow,
      ),
      () {},
    ),
    SubcategoriesWidgets().boxIconText(
      '5 км',
      WidgetsHelpers().imageIcon(
        IconHelper.location,
        13,
        ThemeHelper.blue,
      ),
      () {},
    ),
    SubcategoriesWidgets().boxText(
      '\$\$\$',
      ThemeHelper.green,
      () {},
    ),
    SubcategoriesWidgets().boxIconText(
      '4,5',
      WidgetsHelpers().imageIcon(
        IconHelper.iconDiscount,
        16,
        ThemeHelper.colorB16AF9,
      ),
      () {},
    ),
    SubcategoriesWidgets().boxIcon(
      WidgetsHelpers().imageIcon(
        IconHelper.infoIcon,
        16,
        ThemeHelper.yellow,
      ),
      () {},
    ),
  ];
}
