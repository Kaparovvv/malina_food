import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/boxShadow_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/commons/widget_state.dart';
import 'package:malina_app/global_widgets/customCachedNetworkImage_widget.dart';
import 'package:malina_app/global_widgets/widgets_helpers.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/subcategoriesAppBar_widget.dart';
import 'package:malina_app/screens/store_screens/product_screen/local_widgets/addingProductToTheCart_widget.dart';
import 'package:malina_app/screens/store_screens/product_screen/local_widgets/productNutrients_widget.dart';
import 'package:malina_app/screens/store_screens/product_screen/local_widgets/product_offered_widget.dart';
import 'package:malina_app/screens/store_screens/product_screen/local_widgets/supplements_widget.dart';
import 'package:malina_app/screens/store_screens/store_screen/store_menu/typesOfDishesTabBar_widget.dart';
import 'package:malina_app/screens/store_screens/store_screen/tableReservation_widgets/numberOFQuests.dart';

class ProductScreen extends StatefulWidget {
  final String? nameStore;
  final String? productName;

  const ProductScreen({super.key, this.nameStore, required this.productName});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool isDial = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: SubcategoriesAppBar().appBar(
          widget.nameStore ?? 'Заведение',
          Colors.transparent,
          () {
            Navigator.of(context).pop();
          },
          () {
            setState(() {
              WidgetState.isNotify = !WidgetState.isNotify;
            });
          },
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CustomCachedNetworkImage(
                imageUrl:
                    'https://avatars.mds.yandex.net/i?id=3ade6b2eee6151653eb019b2ad1dd99d-4965564-images-thumbs&n=13',
                width: 1.sw,
                height: 355.h,
                boxFit: BoxFit.fill,
              ),
              SizedBox(height: 15.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AddingProductTotheCartWidget(
                      price: '200',
                      productName: widget.productName,
                      description: 'Пицца с соусом том ям (230 гр)',
                    ),
                    SizedBox(height: 25.h),
                    WidgetsHelpers().divider(),
                    SizedBox(height: 25.h),
                    Text(
                      'Состав:',
                      style: TextStyleHelper.f16w500
                          .copyWith(color: ThemeHelper.blackDial),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      'Булочка, котлета из говядины, сыр, салат и т.д.',
                      style: TextStyleHelper.f14w400
                          .copyWith(color: ThemeHelper.color898A8D),
                    ),
                    SizedBox(height: 25.h),
                    WidgetsHelpers().divider(),
                    SizedBox(height: 25.h),
                    const ProductNutrientsWidget(),
                    SizedBox(height: 25.h),
                    WidgetsHelpers().divider(),
                    SizedBox(height: 25.h),
                    SizedBox(height: 10.h),
                    const SupplementsWidget(
                      supplementsProduct: 'Дополнительно Соус',
                      supplementsPrice: '20',
                    ),
                    SizedBox(height: 25.h),
                    WidgetsHelpers().divider(),
                    SizedBox(height: 25.h),
                    Text(
                      'Вместе берут',
                      style: TextStyleHelper.f24w800
                          .copyWith(color: ThemeHelper.blackDial),
                    ),
                    SizedBox(height: 15.h),
                    SizedBox(
                      width: 1.sw,
                      height: 1.sh,
                      child: GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: 20,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: (1 / 2),
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) => ProductOfferedWidget(
                          image:
                              'https://yakutsk.ru/wp-content/uploads/2022/03/09/coca-cola-skardines-74215712.jpg',
                          name: 'Coca-Cola',
                          description: '0,25 л',
                          dishPrice: '45',
                          dishPriceBeforeDiscount: '49',
                          onPressed: () {},
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
