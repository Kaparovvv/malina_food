import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/customCachedNetworkImage_widget.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';
import 'package:malina_app/screens/store_screens/store_screen/tableReservation_widgets/numberOFQuests.dart';

class BoxWithSelectedOrder extends StatelessWidget {
  final String? nameOrder;
  final String? description;
  final String price;
  final String? imageUrl;
  final Function() deleteOrder;

  const BoxWithSelectedOrder({
    super.key,
    this.nameOrder,
    this.description,
    required this.price,
    required this.imageUrl,
    required this.deleteOrder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 302.w,
      height: 106.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomCachedNetworkImage(
            imageUrl: imageUrl,
            width: 114.w,
            height: 106.h,
            borderRadius: BorderRadius.circular(10.r),
            boxFit: BoxFit.fill,
          ),
          SizedBox(width: 10.w),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 127.w,
                child: Text(
                  nameOrder ?? 'unknown',
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: TextStyleHelper.f16w500
                      .copyWith(color: ThemeHelper.blackDial),
                ),
              ),
              SizedBox(height: 5.h),
              SizedBox(
                width: 127.w,
                child: Text(
                  description ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleHelper.f12w400
                      .copyWith(color: ThemeHelper.greyDial),
                ),
              ),
              SizedBox(height: 15.h),
              const NumberOfQuestsWidget(),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    price,
                    style: TextStyleHelper.f16w400
                        .copyWith(color: ThemeHelper.blackDial),
                  ),
                  WidgetsHelpers().valuta(ThemeHelper.blackDial)
                ],
              ),
              IconButton(
                onPressed: () => deleteOrder(),
                icon: WidgetsHelpers().imageIcon(
                  IconHelper.deleteIcon,
                  20,
                  ThemeHelper.blackDial,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
