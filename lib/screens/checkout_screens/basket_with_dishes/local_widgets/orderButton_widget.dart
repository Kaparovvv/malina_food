import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';

class OrderButtonWidget extends StatelessWidget {
  final String price;
  final Function() onPressed;
  const OrderButtonWidget({
    super.key,
    required this.price,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: Size(300.w, 50.h),
        backgroundColor: ThemeHelper.yellow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 27.w),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Заказать',
            style:
                TextStyleHelper.f16w500.copyWith(color: ThemeHelper.blackDial),
          ),
          Row(
            children: [
              Text(
                price,
                style: TextStyleHelper.f18w500
                    .copyWith(color: ThemeHelper.blackDial),
              ),
              SizedBox(width: 5.w),
              WidgetsHelpers().valuta(ThemeHelper.blackDial)
            ],
          ),
        ],
      ),
    );
  }
}
