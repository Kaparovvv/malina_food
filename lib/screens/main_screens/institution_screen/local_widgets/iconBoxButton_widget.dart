import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';

class IconBoxButtonWidget extends StatelessWidget {
  final Function() onPressed;
  final String iconName;
  final Color iconTheme;
  const IconBoxButtonWidget({
    Key? key,
    required this.onPressed,
    required this.iconName,
    required this.iconTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => onPressed(),
        borderRadius: BorderRadius.circular(5.r),
        child: Ink(
          width: 32.w,
          height: 32.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(
              color: ThemeHelper.bejGray,
              width: 1.w,
            ),
          ),
          child: Center(
            child: WidgetsHelpers().imageIcon(
              iconName,
              18,
              iconTheme,
            ),
          ),
        ),
      ),
    );
  }
}
