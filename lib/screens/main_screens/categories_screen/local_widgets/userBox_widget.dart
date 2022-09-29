import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/circle_cached_network_image.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';

class UserBoxWidget extends StatelessWidget {
  final String imageUrl;
  final String userName;
  final bool isNotify;
  final Function() boxTab;
  final Function() notifyTab;
  const UserBoxWidget({
    Key? key,
    required this.imageUrl,
    required this.userName,
    this.isNotify = false,
    required this.boxTab,
    required this.notifyTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => boxTab(),
      child: Container(
        width: 302.w,
        height: 79.h,
        decoration: BoxDecoration(
          color: ThemeHelper.backBlur,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 20.w, right: 15.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 41.w,
                    height: 41.h,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: ThemeHelper.backBlur,
                      border: Border.all(color: ThemeHelper.white),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(1.0.sm),
                      child: 
                      // CircleAvatar(
                      //   backgroundImage: AssetImage(imageUrl),
                      // ),
                      CircleCachedNetworkImageWidget(imageUrl: imageUrl, width: 38, height: 38)
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    userName,
                    style: TextStyleHelper.f14w700.copyWith(color: ThemeHelper.white),
                  ),
                ],
              ),
              IconButton(
                iconSize: 25,
                onPressed: () => notifyTab(),
                icon: isNotify
                    ? Stack(
                        children: [
                          WidgetsHelpers().imageIcon(
                            IconHelper.notifyTrue,
                            18,
                            ThemeHelper.white,
                          ),
                          Positioned(
                            top: 2.7.h,
                            left: 9.w,
                            child: WidgetsHelpers().imageIcon(
                              IconHelper.ellipse,
                              8,
                              ThemeHelper.crimson,
                            ),
                          ),
                        ],
                      )
                    : WidgetsHelpers().imageIcon(
                        IconHelper.notifyFalse,
                        18,
                        ThemeHelper.white,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
