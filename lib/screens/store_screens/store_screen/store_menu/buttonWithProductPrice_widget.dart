import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';

class ButtonWithProductPriceWidget extends StatefulWidget {
  final String? dishPrice;
  final String? dishPriceBeforeDiscount;
  final Function() onPressed;

  const ButtonWithProductPriceWidget({
    super.key,
    this.dishPrice,
    this.dishPriceBeforeDiscount,
    required this.onPressed,
  });

  @override
  State<ButtonWithProductPriceWidget> createState() =>
      _ButtonWithProductPriceWidgetState();
}

class _ButtonWithProductPriceWidgetState
    extends State<ButtonWithProductPriceWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => widget.onPressed(),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: ThemeHelper.bejGray,
        fixedSize: Size(140.w, 40.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.dishPriceBeforeDiscount ?? '0.00',
            style: TextStyleHelper.f14w400.copyWith(
              color: ThemeHelper.greyDial,
              decoration: TextDecoration.lineThrough,
            ),
          ),
          Text(
            widget.dishPrice ?? '0.00',
            style:
                TextStyleHelper.f16w400.copyWith(color: ThemeHelper.blackDial),
          ),
          WidgetsHelpers().valuta(ThemeHelper.blackDial),
        ],
      ),
    );
  }
}
