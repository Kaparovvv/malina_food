import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';

class InformationButtonWidget extends StatelessWidget {
  final Function() onTab;
  final Widget iconWidget;
  final String textButton;
  const InformationButtonWidget({
    Key? key,
    required this.onTab,
    required this.iconWidget,
    required this.textButton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () => onTab(),
        splashColor: ThemeHelper.bejGray,
        child: Ink(
          width: 330.w,
          height: 24.h,
          child: Row(
            children: [
              iconWidget,
              SizedBox(width: 10.w),
              SizedBox(
                width: 259.w,
                height: 24.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 3.h),
                  child: Text(
                    textButton,
                    style: TextStyleHelper.f16w500
                        .copyWith(color: ThemeHelper.blackDial),
                  ),
                ),
              ),
              SizedBox(width: 17.w),
              Icon(
                Icons.arrow_forward_ios_outlined,
                size: 20,
                color: ThemeHelper.blackDial,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
