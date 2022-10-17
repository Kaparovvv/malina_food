import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/boxShadow_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/leadingTitleAction_widget.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';
import 'package:malina_app/screens/checkout_screens/basket_with_dishes/local_widgets/boxWithSelectedOrder_widget.dart';
import 'package:malina_app/screens/checkout_screens/basket_with_dishes/local_widgets/orderButton_widget.dart';

class BasketWithDishesScreen extends StatelessWidget {
  const BasketWithDishesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: LeadingTitleActionWidget().appBar(
        'Корзина',
        'Очистить',
        ThemeHelper.colorF9F9F9,
        () {},
        () {},
        TextStyleHelper.f14w400.copyWith(color: ThemeHelper.blackDial),
      ),
      body: Container(
        color: ThemeHelper.colorF9F9F9,
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 330.w,
                  padding:
                      EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                  decoration: BoxDecoration(
                    color: ThemeHelper.white,
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [BoxShadowHelper.rgb159],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Munchen Pub',
                        style: TextStyleHelper.f18w500.copyWith(
                          color: ThemeHelper.color5F5F5F,
                        ),
                      ),
                      WidgetsHelpers().divider(),
                      SizedBox(height: 19.h),
                      SizedBox(
                        width: 1.sw,
                        height: 400.h,
                        child: ListView.separated(
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => BoxWithSelectedOrder(
                            nameOrder: 'Том ям',
                            description: 'Пицца с соусом том ям 230 гр',
                            price: '230',
                            imageUrl:
                                'https://avatars.mds.yandex.net/get-images-cbir/6798772/ohEMOSdVTQMRtDkz95Mg6Q4748/ocr',
                            deleteOrder: () {},
                          ),
                          separatorBuilder: (context, index) =>
                              SizedBox(height: 40.h),
                          itemCount: 3,
                        ),
                      ),
                      SizedBox(height: 30.h),
                      OrderButtonWidget(
                        price: '437',
                        onPressed: () {},
                      ),
                    ],
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
