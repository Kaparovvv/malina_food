import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/screens/store_screens/product_screen/product_screen.dart';
import 'infoBoxAboutTheDish_widget.dart';

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
          Expanded(
            child: TabBarView(
              controller: _tabControllerDishes,
              children: <Widget>[
                SizedBox(
                  width: 1.sw,
                  height: 1.sh,
                  child: GridView.builder(
                    shrinkWrap: false,
                    padding:
                        EdgeInsets.only(left: 15.w, right: 15.w, top: 25.h),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 20,
                    gridDelegate:
                        (const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: (1 / 2.2),
                      mainAxisSpacing: 10,
                    )),
                    itemBuilder: (context, index) => InfoBoxAboutTheDish(
                      imageUrl:
                          'https://www.schoolofphotography.co.in/wp-content/uploads/2017/10/food_photography_palm_beach_gardens_florida_parched_pig.jpg',
                      dishName: 'Том ям',
                      dishDescription: 'Пицца с соусом том ям',
                      dishPrice: '234',
                      dishPriceBeforeDiscount: '201',
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductScreen(
                            productName: 'Том ям',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.sw,
                  height: 1.sh,
                  child: GridView.builder(
                    shrinkWrap: false,
                    padding:
                        EdgeInsets.only(left: 15.w, right: 15.w, top: 25.h),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 20,
                    gridDelegate:
                        (const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: (1 / 2.2),
                      mainAxisSpacing: 10,
                    )),
                    itemBuilder: (context, index) => InfoBoxAboutTheDish(
                      imageUrl:
                          'https://www.schoolofphotography.co.in/wp-content/uploads/2017/10/food_photography_palm_beach_gardens_florida_parched_pig.jpg',
                      dishName: 'Том ям',
                      dishDescription: 'Пицца с соусом том ям',
                      dishPrice: '234',
                      dishPriceBeforeDiscount: '201',
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductScreen(
                            productName: 'Том ям',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.sw,
                  height: 1.sh,
                  child: GridView.builder(
                    shrinkWrap: false,
                    padding:
                        EdgeInsets.only(left: 15.w, right: 15.w, top: 25.h),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 20,
                    gridDelegate:
                        (const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: (1 / 2.2),
                      mainAxisSpacing: 10,
                    )),
                    itemBuilder: (context, index) => InfoBoxAboutTheDish(
                      imageUrl:
                          'https://www.schoolofphotography.co.in/wp-content/uploads/2017/10/food_photography_palm_beach_gardens_florida_parched_pig.jpg',
                      dishName: 'Том ям',
                      dishDescription: 'Пицца с соусом том ям',
                      dishPrice: '234',
                      dishPriceBeforeDiscount: '201',
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductScreen(
                            productName: 'Том ям',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 1.sw,
                  height: 1.sh,
                  child: GridView.builder(
                    shrinkWrap: false,
                    padding:
                        EdgeInsets.only(left: 15.w, right: 15.w, top: 25.h),
                    physics: const BouncingScrollPhysics(),
                    itemCount: 20,
                    gridDelegate:
                        (const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      childAspectRatio: (1 / 2.2),
                      mainAxisSpacing: 10,
                    )),
                    itemBuilder: (context, index) => InfoBoxAboutTheDish(
                      imageUrl:
                          'https://www.schoolofphotography.co.in/wp-content/uploads/2017/10/food_photography_palm_beach_gardens_florida_parched_pig.jpg',
                      dishName: 'Том ям',
                      dishDescription: 'Пицца с соусом том ям',
                      dishPrice: '234',
                      dishPriceBeforeDiscount: '201',
                      onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const ProductScreen(
                            productName: 'Том ям',
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
