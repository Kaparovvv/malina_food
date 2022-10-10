import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';

class SupplementsWidget extends StatelessWidget {
  final String supplementsProduct;
  final String supplementsPrice;
  const SupplementsWidget({
    Key? key,
    required this.supplementsProduct,
    required this.supplementsPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Добавки:',
          style: TextStyleHelper.f16w500.copyWith(color: ThemeHelper.blackDial),
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            InkWell(
              onTap: () {},
              splashColor: ThemeHelper.bejGray,
              child: SizedBox(
                width: 30.w,
                height: 30.h,
                child: Image.asset(
                  IconHelper.done,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 15.w),
            Text(
              supplementsProduct,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyleHelper.f14w400
                  .copyWith(color: ThemeHelper.blackDial),
            ),
            SizedBox(width: 10.w),
            Row(
              children: [
                Text(
                  '+$supplementsPrice ',
                  style: TextStyleHelper.f16w400
                      .copyWith(color: ThemeHelper.greyDial),
                ),
                WidgetsHelpers().valuta(ThemeHelper.greyDial),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
