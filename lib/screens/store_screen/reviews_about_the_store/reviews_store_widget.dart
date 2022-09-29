import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/boxShadow_helper.dart';
import 'package:malina_app/commons/text_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/screens/store_screen/reviews_about_the_store/reviews_widget_helpers.dart';

class ReviewsStoreWidget extends StatelessWidget {
  const ReviewsStoreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 330.w,
          height: 125.h,
          decoration: BoxDecoration(
              color: ThemeHelper.white,
              borderRadius: BorderRadius.circular(10.r),
              boxShadow: [BoxShadowHelper.blurRadius15]),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 11.h, horizontal: 10.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ReviewsWidgetHelpers()
                    .reviewsBox(averageRating: '4,5', quantityReviews: '367'),
                SizedBox(width: 10.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReviewsWidgetHelpers()
                        .raitingOfRatings(quantityRating: '320'),
                    ReviewsWidgetHelpers()
                        .raitingOfRatings(quantityRating: '320'),
                    ReviewsWidgetHelpers()
                        .raitingOfRatings(quantityRating: '320'),
                    ReviewsWidgetHelpers()
                        .raitingOfRatings(quantityRating: '320'),
                    ReviewsWidgetHelpers()
                        .raitingOfRatings(quantityRating: '320'),
                  ],
                ),
              ],
            ),
          ),
        ),
        ReviewsWidgetHelpers().commentBox(
          userName: null,
          raiting: 3,
          comment: TextHelper().userComment,
          date: '12.03.22',
          masterName: 'Jey Lo',
          imageMaster:
              'http://images5.fanpop.com/image/photos/29400000/American-Idol-jennifer-lopez-29488620-1922-2560.jpg',
        ),
      ],
    );
  }
}
