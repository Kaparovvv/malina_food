import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/boxShadow_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/commons/widget_state.dart';
import 'package:malina_app/global_widgets/customCachedNetworkImage_widget.dart';
import 'package:malina_app/screens/store_screen/tableReservation_widgets/numberOFQuests.dart';

class TypesOfDishesTabBarWidget extends StatelessWidget {
  const TypesOfDishesTabBarWidget({
    Key? key,
    required TabController tabControllerDishes,
  })  : _tabControllerDishes = tabControllerDishes,
        super(key: key);

  final TabController _tabControllerDishes;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 1.sw,
      height: 1.sh,
      child: Column(
        children: [
          DefaultTabController(
            length: 4,
            child: Column(
              children: <Widget>[
                ButtonsTabBar(
                  controller: _tabControllerDishes,
                  height: 27.h,
                  radius: 10.r,
                  backgroundColor: ThemeHelper.yellow,
                  unselectedBackgroundColor: ThemeHelper.colorF8F7FA,
                  borderWidth: 1,
                  borderColor: ThemeHelper.yellow,
                  unselectedBorderColor: ThemeHelper.colorF8F7FA,
                  physics: const BouncingScrollPhysics(),
                  tabs: [
                    Tab(
                      child: SizedBox(
                        height: 27.h,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Text(
                              'Популярные блюда',
                              style: TextStyleHelper.f14w400
                                  .copyWith(color: ThemeHelper.blackDial),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: 27.h,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Text(
                              'Бургеры',
                              style: TextStyleHelper.f14w400
                                  .copyWith(color: ThemeHelper.blackDial),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: 27.h,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Text(
                              'Закуски',
                              style: TextStyleHelper.f14w400
                                  .copyWith(color: ThemeHelper.blackDial),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: SizedBox(
                        height: 27.h,
                        child: Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 5.h),
                            child: Text(
                              'Напитки',
                              style: TextStyleHelper.f14w400
                                  .copyWith(color: ThemeHelper.blackDial),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          // SizedBox(height: 25.h),
          Expanded(
            child: TabBarView(
              controller: _tabControllerDishes,
              children: <Widget>[
                SizedBox(
                  width: 1.sw,
                  height: 1.sh,
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding:
                        EdgeInsets.only(left: 15.w, right: 15.w, top: 25.h),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 20,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => const InfoBoxAboutTheDish(
                      imageUrl:
                          'https://www.schoolofphotography.co.in/wp-content/uploads/2017/10/food_photography_palm_beach_gardens_florida_parched_pig.jpg',
                      dishName: 'Том ям',
                      dishDescription: 'Пицца с соусом том ям',
                      dishPrice: '234',
                      dishPriceBeforeDiscount: '201',
                    ),
                  ),
                ),
                Center(
                  child: Text('Бургеры'),
                ),
                Center(
                  child: Text('Закуски'),
                ),
                Center(
                  child: Text('Напитки'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InfoBoxAboutTheDish extends StatefulWidget {
  final String? imageUrl;
  final String? dishName;
  final String? dishDescription;
  final String? dishPrice;
  final String? dishPriceBeforeDiscount;

  const InfoBoxAboutTheDish({
    Key? key,
    required this.imageUrl,
    required this.dishName,
    required this.dishDescription,
    required this.dishPrice,
    required this.dishPriceBeforeDiscount,
  }) : super(key: key);

  @override
  State<InfoBoxAboutTheDish> createState() => _InfoBoxAboutTheDishState();
}

class _InfoBoxAboutTheDishState extends State<InfoBoxAboutTheDish> {
  bool isDial = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.w,
      height: 258.h,
      margin: EdgeInsets.symmetric(vertical: 10.h),
      decoration: BoxDecoration(
        color: ThemeHelper.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [BoxShadowHelper.rgb135],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              CustomCachedNetworkImage(
                imageUrl: widget.imageUrl,
                width: 1.sw,
                height: 160.h,
                borderRadius: BorderRadius.circular(20.r),
              ),
              Positioned(
                left: 120.w,
                top: 10.h,
                right: 10.w,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      WidgetState.isFavourites = !WidgetState.isFavourites;
                    });
                  },
                  borderRadius: BorderRadius.circular(15.r),
                  child: Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                      color: ThemeHelper.white,
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadowHelper.blurRadius15],
                    ),
                    child: Center(
                      child: Icon(
                        WidgetState.isFavourites
                            ? Icons.favorite
                            : Icons.favorite_border_outlined,
                        color: WidgetState.isFavourites
                            ? ThemeHelper.crimson
                            : ThemeHelper.blackDial,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(height: 5.h),
          SizedBox(
            width: 140.w,
            child: Center(
              child: Text(
                widget.dishName ?? '',
                overflow: TextOverflow.ellipsis,
                style: TextStyleHelper.f16w500
                    .copyWith(color: ThemeHelper.blackDial),
              ),
            ),
          ),
          SizedBox(height: 2.h),
          SizedBox(
            width: 120.w,
            child: Center(
              child: Text(
                widget.dishDescription ?? '',
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyleHelper.f12w400
                    .copyWith(color: ThemeHelper.greyDial),
              ),
            ),
          ),
          SizedBox(height: 4.h),
          isDial
              ? ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isDial = !isDial;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: ThemeHelper.bejGray,
                    fixedSize: Size(140.w, 40.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        widget.dishPriceBeforeDiscount ?? '',
                        style: TextStyleHelper.f14w400.copyWith(
                          color: ThemeHelper.greyDial,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            widget.dishPrice ?? '0.00',
                            style: TextStyleHelper.f16w400
                                .copyWith(color: ThemeHelper.blackDial),
                          ),
                          SizedBox(width: 5.w),
                          Text(
                            'C',
                            style: TextStyleHelper.f16w400.copyWith(
                              color: ThemeHelper.blackDial,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: const NumberOfQuestsWidget(),
                )
        ],
      ),
    );
  }
}
