import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:malina_app/commons/them_helper.dart';

class LoadingIndicatorWidget extends StatelessWidget {
  const LoadingIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20.w,
      height: 20.h,
      child: LoadingIndicator(
        indicatorType: Indicator.ballPulse,
        strokeWidth: 3,
        colors: [
          ThemeHelper.crimson,
          ThemeHelper.crimson,
          ThemeHelper.crimson,
        ],
      ),
    );
  }
}
