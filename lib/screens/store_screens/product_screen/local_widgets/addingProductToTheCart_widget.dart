import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';
import 'package:malina_app/screens/store_screens/store_screen/tableReservation_widgets/numberOFQuests.dart';

class AddingProductTotheCartWidget extends StatelessWidget {
  final String? productName;
  final String? description;
  final String? price;

  const AddingProductTotheCartWidget({
    Key? key,
    required this.productName,
    required this.description,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200.w,
              child: Text(
                productName ?? '',
                overflow: TextOverflow.ellipsis,
                style: TextStyleHelper.f22w500
                    .copyWith(color: ThemeHelper.blackDial),
              ),
            ),
            SizedBox(height: 3.h),
            SizedBox(
              width: 200.w,
              child: Text(
                description ?? '',
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyleHelper.f18w400
                    .copyWith(color: ThemeHelper.greyDial),
              ),
            ),
            SizedBox(height: 20.h),
            const NumberOfQuestsWidget(),
          ],
        ),
        Container(
          decoration: BoxDecoration(
            color: ThemeHelper.bejGray,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 9.h,
            ),
            child: Row(
              children: [
                Text(
                  price ?? '00.0',
                  style: TextStyleHelper.f16w400
                      .copyWith(color: ThemeHelper.blackDial),
                ),
                SizedBox(width: 5.w),
                WidgetsHelpers().valuta(ThemeHelper.blackDial),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
