import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';

class ProductNutrientsWidget extends StatelessWidget {
  const ProductNutrientsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Ценность на 100 гр:',
          style: TextStyleHelper.f16w500.copyWith(color: ThemeHelper.blackDial),
        ),
        SizedBox(height: 10.w),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            width: 1.sw,
            height: 34.h,
            child: ListView.separated(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: 6,
              itemBuilder: (context, index) => Column(
                children: [
                  Text(
                    'ккал',
                    style: TextStyleHelper.f14w400
                        .copyWith(color: ThemeHelper.color898A8D),
                  ),
                  Text(
                    '449',
                    style: TextStyleHelper.f14w400
                        .copyWith(color: ThemeHelper.blackDial),
                  ),
                ],
              ),
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(width: 57.w);
              },
            ),
          ),
        )
      ],
    );
  }
}
