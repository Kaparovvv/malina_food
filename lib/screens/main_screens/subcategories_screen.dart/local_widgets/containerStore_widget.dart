import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/icon_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/customCachedNetworkImage_widget.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/subcateg_widgets.dart';

class ContainerStoreWidget extends StatelessWidget {
  final String? imageUrl;
  final String nameStore;
  final Function() onTap;
  const ContainerStoreWidget({
    Key? key,
    required this.imageUrl,
    required this.nameStore,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.r),
      child: InkWell(
        onTap: () => onTap(),
        splashColor: ThemeHelper.crimson,
        borderRadius: BorderRadius.circular(10.r),
        child: Container(
          width: 250.w,
          height: 204.h,
          decoration: BoxDecoration(
            color: ThemeHelper.white,
            borderRadius: BorderRadius.circular(10.r),
            // boxShadow: [
            //   BoxShadow(
            //     color: ThemeHelper.color7a7a7a,
            //     offset: const Offset(0, 2),
            //     blurRadius: 15.r,
            //     spreadRadius: 0,
            //   ),
            // ],
          ),
          child: Column(
            children: [
              CustomCachedNetworkImage(
                width: 1.sh,
                height: 114.w,
                imageUrl: imageUrl ?? 'https://avatars.mds.yandex.net/i?id=b6b0de530521e05e66a74e853aed96c6-5869993-images-thumbs&n=13',
                boxFit: BoxFit.fill,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(10.r),
                ),
              ),
              Container(
                height: 90.h,
                decoration: BoxDecoration(
                  color: ThemeHelper.white,
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(15.r),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 15.w,
                    top: 10.h,
                    right: 10.w,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 170.w,
                            height: 21.h,
                            child: Text(
                              nameStore,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyleHelper.f18w600.copyWith(
                                color: ThemeHelper.blackDial,
                              ),
                            ),
                          ),
                          Container(
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
                                IconHelper.bookmarks,
                                18,
                                ThemeHelper.crimson,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 23.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SubcategoriesWidgets().boxIconText(
                            '4,5',
                            WidgetsHelpers().imageIcon(
                              IconHelper.iconStar,
                              12,
                              ThemeHelper.yellow,
                            ),
                            () {},
                          ),
                          SubcategoriesWidgets().boxIconText(
                            '5 км',
                            WidgetsHelpers().imageIcon(
                              IconHelper.location,
                              13,
                              ThemeHelper.blue,
                            ),
                            () {},
                          ),
                          SubcategoriesWidgets().boxText(
                            '\$\$\$',
                            ThemeHelper.green,
                            () {},
                          ),
                          SubcategoriesWidgets().boxIconText(
                            '4,5',
                            WidgetsHelpers().imageIcon(
                              IconHelper.iconDiscount,
                              16,
                              ThemeHelper.colorB16AF9,
                            ),
                            () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
