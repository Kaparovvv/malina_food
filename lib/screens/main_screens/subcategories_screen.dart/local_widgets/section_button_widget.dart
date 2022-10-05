import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/circle_cached_network_image.dart';

class SectionButtonWidget extends StatelessWidget {
  final bool isActive;
  final String? iconUrl;
  final String? sectionName;
  final Function() onPressed;
  const SectionButtonWidget({
    Key? key,
    this.iconUrl,
    this.sectionName,
    required this.onPressed,
    this.isActive = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(5.r),
      child: InkWell(
        onTap: () => onPressed(),
        borderRadius: BorderRadius.circular(5.r),
        splashColor: ThemeHelper.lightGrey,
        child: Ink(
          width: 85.w,
          height: 85.h,
          decoration: BoxDecoration(
            color: isActive ? ThemeHelper.yellow : ThemeHelper.white,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleCachedNetworkImageWidget(
                  imageUrl: iconUrl,
                  width: 45,
                  height: 45,
                ),
                SizedBox(height: 8.h),
                Text(
                  sectionName!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyleHelper.f12w400.copyWith(
                    color: ThemeHelper.blackDial,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
