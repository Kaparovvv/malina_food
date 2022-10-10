import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';

class StocksBoxWidget extends StatelessWidget {
  final String? heading;
  final String? text;
  final List<Color> linearGradient;

  const StocksBoxWidget({
    Key? key,
    this.heading,
    this.text,
    required this.linearGradient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 158.w,
      height: 88.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        gradient: LinearGradient(
          colors: linearGradient,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: 13.h,
          horizontal: 15.w,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              heading!,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyleHelper.f16w700.copyWith(color: ThemeHelper.white),
            ),
            Text(
              text!,
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
              style: TextStyleHelper.f12w500.copyWith(color: ThemeHelper.white),
            ),
          ],
        ),
      ),
    );
  }
}
