import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/boxShadow_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/commons/widget_state.dart';
import 'package:malina_app/global_widgets/customCachedNetworkImage_widget.dart';
import 'package:malina_app/screens/store_screens/store_screen/store_menu/buttonWithProductPrice_widget.dart';
import 'package:malina_app/screens/store_screens/store_screen/tableReservation_widgets/numberOFQuests.dart';

class InfoBoxAboutTheDish extends StatefulWidget {
  final String? imageUrl;
  final String? dishName;
  final String? dishDescription;
  final String? dishPrice;
  final String? dishPriceBeforeDiscount;
  final Function() onPressed;

  const InfoBoxAboutTheDish({
    Key? key,
    required this.imageUrl,
    required this.dishName,
    required this.dishDescription,
    required this.dishPrice,
    this.dishPriceBeforeDiscount,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<InfoBoxAboutTheDish> createState() => _InfoBoxAboutTheDishState();
}

class _InfoBoxAboutTheDishState extends State<InfoBoxAboutTheDish> {
  bool isDial = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed(),
      child: Container(
        width: 160.w,
        height: 258.h,
        margin: EdgeInsets.symmetric(vertical: 10.h),
        decoration: BoxDecoration(
          color: ThemeHelper.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [BoxShadowHelper.rgb135],
        ),
        child: Column(
          children: [
            Stack(
              children: [
                CustomCachedNetworkImage(
                  imageUrl: widget.imageUrl,
                  width: 1.sw,
                  height: 160.h,
                  boxFit: BoxFit.cover,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                Positioned(
                  left: 120.w,
                  top: 10.h,
                  right: 10.w,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        WidgetState.isFavourites = !WidgetState.isFavourites;
                      });
                    },
                    borderRadius: BorderRadius.circular(15.r),
                    child: Container(
                      width: 30.w,
                      height: 30.h,
                      decoration: BoxDecoration(
                        color: ThemeHelper.white,
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadowHelper.blurRadius15],
                      ),
                      child: Center(
                        child: Icon(
                          WidgetState.isFavourites
                              ? Icons.favorite
                              : Icons.favorite_border_outlined,
                          color: WidgetState.isFavourites
                              ? ThemeHelper.crimson
                              : ThemeHelper.blackDial,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 5.h),
            SizedBox(
              width: 140.w,
              child: Center(
                child: Text(
                  widget.dishName ?? '',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleHelper.f16w500
                      .copyWith(color: ThemeHelper.blackDial),
                ),
              ),
            ),
            SizedBox(height: 2.h),
            SizedBox(
              width: 120.w,
              child: Center(
                child: Text(
                  widget.dishDescription ?? '',
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleHelper.f12w400
                      .copyWith(color: ThemeHelper.greyDial),
                ),
              ),
            ),
            SizedBox(height: 4.h),
            isDial
                ? ButtonWithProductPriceWidget(
                    dishPrice: widget.dishPrice,
                    dishPriceBeforeDiscount: widget.dishPriceBeforeDiscount,
                    onPressed: () {
                      setState(() {
                        isDial = !isDial;
                      });
                    },
                  )
                : Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: const NumberOfQuestsWidget(),
                  ),
          ],
        ),
      ),
    );
  }
}
