import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/boxShadow_helper.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/circle_cached_network_image.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';

class ReviewsWidgetHelpers {
  Container commentBox({
    String? userName,
    int? raiting,
    String? comment,
    String? date,
    String? masterName,
    String? imageMaster,
  }) {
    return Container(
      width: 330.w,
      height: 164.h,
      decoration: BoxDecoration(
        color: ThemeHelper.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [BoxShadowHelper.blurRadius15],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 15.h, horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 250.w,
              child: Text(
                userName ?? 'Пользователь',
                overflow: TextOverflow.ellipsis,
                style: TextStyleHelper.f16w600
                    .copyWith(color: ThemeHelper.blackDial),
              ),
            ),
            SizedBox(height: 5.h),
            SizedBox(
              width: 78.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  WidgetsHelpers().imageIcon(
                    IconHelper.iconStar,
                    9,
                    ThemeHelper.yellow,
                  ),
                  WidgetsHelpers().imageIcon(
                    IconHelper.iconStar,
                    9,
                    ThemeHelper.yellow,
                  ),
                  WidgetsHelpers().imageIcon(
                    IconHelper.iconStar,
                    9,
                    ThemeHelper.yellow,
                  ),
                  WidgetsHelpers().imageIcon(
                    IconHelper.iconStar,
                    9,
                    ThemeHelper.yellow,
                  ),
                  WidgetsHelpers().imageIcon(
                    IconHelper.iconStar,
                    9,
                    ThemeHelper.yellow,
                  ),
                ],
              ),
            ),
            SizedBox(height: 10.h),
            SizedBox(
              width: 301.w,
              height: 54.h,
              child: Text(
                comment ?? 'Комментарий нет',
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyleHelper.f14w400.copyWith(
                  color: ThemeHelper.lightGrey,
                ),
              ),
            ),
            SizedBox(height: 14.h),
            SizedBox(
              width: 301.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date ?? '00.00.00',
                    style: TextStyleHelper.f14w400.copyWith(
                      color: ThemeHelper.lightGrey,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'Мастер:',
                        style: TextStyleHelper.f14w400.copyWith(
                          color: ThemeHelper.lightGrey,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        masterName ?? 'Мастер',
                        style: TextStyleHelper.f14w400.copyWith(
                          color: ThemeHelper.blackDial,
                        ),
                      ),
                      SizedBox(width: 5.w),
                      CircleCachedNetworkImageWidget(
                        imageUrl: imageMaster ?? '',
                        width: 26,
                        height: 26,
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row raitingOfRatings({String? quantityRating}) {
    return Row(
      children: [
        SizedBox(
          width: 78.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WidgetsHelpers().imageIcon(
                IconHelper.iconStar,
                14,
                ThemeHelper.yellow,
              ),
              WidgetsHelpers().imageIcon(
                IconHelper.iconStar,
                14,
                ThemeHelper.yellow,
              ),
              WidgetsHelpers().imageIcon(
                IconHelper.iconStar,
                14,
                ThemeHelper.yellow,
              ),
              WidgetsHelpers().imageIcon(
                IconHelper.iconStar,
                14,
                ThemeHelper.yellow,
              ),
              WidgetsHelpers().imageIcon(
                IconHelper.iconStar,
                14,
                ThemeHelper.yellow,
              ),
            ],
          ),
        ),
        SizedBox(width: 5.w),
        Container(
          width: 110.w,
          height: 4.h,
          decoration: BoxDecoration(
            color: ThemeHelper.bejGray,
            borderRadius: BorderRadius.circular(5.r),
          ),
          child: Container(
            width: 50.w,
            height: 1.sh,
            decoration: BoxDecoration(
              color: ThemeHelper.green,
              borderRadius: BorderRadius.circular(5.r),
            ),
          ),
        ),
        SizedBox(width: 5.w),
        Text(
          quantityRating ?? '',
          style: TextStyleHelper.f14w400.copyWith(color: ThemeHelper.blackDial),
        ),
      ],
    );
  }

  Container reviewsBox({String? averageRating, String? quantityReviews}) {
    return Container(
      width: 77.w,
      height: 105.h,
      decoration: BoxDecoration(
        color: ThemeHelper.colorF8F7FA,
        borderRadius: BorderRadius.circular(6.6.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Рейтинг',
            style: TextStyleHelper.f14w500.copyWith(
              color: ThemeHelper.greyDial,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WidgetsHelpers().imageIcon(
                IconHelper.iconStar,
                18,
                ThemeHelper.yellow,
              ),
              Text(
                averageRating ?? '',
                style: TextStyleHelper.f20w500.copyWith(
                  color: ThemeHelper.greyDial,
                ),
              ),
            ],
          ),
          SizedBox(height: 27.h),
          Text(
            '$quantityReviews Отзыва',
            style: TextStyleHelper.f12w500.copyWith(
              color: ThemeHelper.greyDial,
            ),
          ),
        ],
      ),
    );
  }
}
