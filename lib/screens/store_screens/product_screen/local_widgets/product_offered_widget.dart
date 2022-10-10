import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/boxShadow_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/customCachedNetworkImage_widget.dart';
import 'package:malina_app/screens/store_screens/store_screen/store_menu/buttonWithProductPrice_widget.dart';
import 'package:malina_app/screens/store_screens/store_screen/tableReservation_widgets/numberOFQuests.dart';

class ProductOfferedWidget extends StatefulWidget {
  final String? image;
  final String? name;
  final String? description;
  final String? dishPrice;
  final String? dishPriceBeforeDiscount;
  final Function() onPressed;

  const ProductOfferedWidget({
    Key? key,
    required this.image,
    required this.name,
    this.description,
    this.dishPriceBeforeDiscount,
    required this.dishPrice,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<ProductOfferedWidget> createState() => _ProductOfferedWidgetState();
}

class _ProductOfferedWidgetState extends State<ProductOfferedWidget> {
  bool isDial = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.w,
      height: 248.h,
      decoration: BoxDecoration(
        color: ThemeHelper.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [BoxShadowHelper.white50],
      ),
      child: Column(
        children: [
          CustomCachedNetworkImage(
            imageUrl: widget.image,
            width: 1.sw,
            height: 140.h,
            boxFit: BoxFit.cover,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(20.r),
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            widget.name ?? '',
            style:
                TextStyleHelper.f16w500.copyWith(color: ThemeHelper.blackDial),
          ),
          SizedBox(height: 5.h),
          Text(
            widget.description ?? '',
            style:
                TextStyleHelper.f12w400.copyWith(color: ThemeHelper.greyDial),
          ),
          SizedBox(height: 16.h),
          isDial
              ? ButtonWithProductPriceWidget(
                  dishPrice: widget.dishPrice,
                  dishPriceBeforeDiscount: widget.dishPriceBeforeDiscount,
                  onPressed: () {
                    setState(() {
                      isDial = !isDial;
                      widget.onPressed();
                    });
                  },
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: const NumberOfQuestsWidget(),
                ),
        ],
      ),
    );
  }
}
