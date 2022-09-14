import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';

class CustomBarItewWidget extends StatelessWidget {
  final bool isState;
  final String iconName;
  final String labelText;
  final Function() onTap;
  const CustomBarItewWidget({
    super.key,
    required this.isState,
    required this.iconName,
    required this.labelText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      splashColor: ThemeHelper.blackDial,
      child: Column(
        children: [
          Container(
            height: 1.5.h,
            width: 35.w,
            color: isState ? ThemeHelper.crimson : Colors.transparent,
          ),
          SizedBox(height: 8.h),
          ImageIcon(
            AssetImage(iconName),
            color: isState ? ThemeHelper.crimson : ThemeHelper.greyDial,
          ),
          SizedBox(height: 3.h),
          Text(
            labelText,
            style: isState
                ? TextStyleHelper.seletedLabel
                : TextStyleHelper.unseletedLabel,
          ),
        ],
      ),
    );
  }
}
