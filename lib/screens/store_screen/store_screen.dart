import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/image_helper.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/commons/widget_state.dart';
import 'package:malina_app/global_widgets/customCachedNetworkImage_widget.dart';
import 'package:malina_app/global_widgets/loadingIndicator_widget.dart';
import 'package:malina_app/screens/bottomNavigationBar_widget/bottomNavigationBar_widget.dart';
import 'package:malina_app/screens/qr_code_screens/qr_code_scanner_screen/store_data_bloc/store_bloc.dart';
import 'package:malina_app/screens/qr_code_screens/qr_code_scanner_screen/store_data_bloc/store_event.dart';
import 'package:malina_app/screens/qr_code_screens/qr_code_scanner_screen/store_data_bloc/store_state.dart';
import 'package:malina_app/screens/store_screen/local_widgets/infoBoxStore_widget.dart';
import 'package:malina_app/screens/store_screen/local_widgets/mainTabBar_widget.dart';
import 'package:malina_app/screens/store_screen/local_widgets/availablePaymentPointsButton_widget.dart';
import 'package:malina_app/screens/store_screen/contact_store/functionalTabBar_widget.dart';
import 'package:malina_app/screens/store_screen/local_widgets/stocksBox_widget.dart';
import 'package:malina_app/screens/store_screen/store_menu/typesOfDishesTabBar_widget.dart';
import 'package:malina_app/screens/store_screen/reviews_about_the_store/reviews_store_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/subcategoriesAppBar_widget.dart';

class StoreScreen extends StatefulWidget {
  const StoreScreen({
    super.key,
  });

  @override
  State<StoreScreen> createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreScreen>
    with TickerProviderStateMixin {
  late TabController _tabControllerMain;
  late TabController _tabControllerFunctionalButton;
  late TabController _tabControllerDishes;
  late StoreBloc _storeBloc;

  @override
  void initState() {
    _storeBloc = StoreBloc();
    _storeBloc.add(GetStoreEvent());
    _tabControllerMain = TabController(length: 3, vsync: this);
    _tabControllerFunctionalButton = TabController(length: 4, vsync: this);
    _tabControllerDishes = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabControllerMain.dispose();
    _tabControllerFunctionalButton.dispose();
    _tabControllerDishes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: SubcategoriesAppBar().appBar(
        'Еда',
        Colors.transparent,
        () => Navigator.pop(context),
        () {
          setState(() {
            WidgetState.isNotify = !WidgetState.isNotify;
          });
        },
      ),
      body: BlocConsumer<StoreBloc, StoreState>(
        bloc: _storeBloc,
        listener: (context, state) {
          if (state is ErrorStoreState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.message.toString(),
                ),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is LoadingStoreState) {
            return const Center(
              child: LoadingIndicatorWidget(),
            );
          }

          if (state is LoadedStoreState) {
            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Column(
                    children: [
                      CustomCachedNetworkImage(
                        imageUrl: state.storeModel.avatar,
                        width: 1.sw,
                        height: 355.h,
                      ),
                      SizedBox(
                        width: 1.sw,
                        height: 1.sh,
                        child: Padding(
                          padding: EdgeInsets.only(top: 70.h, left: 8.w),
                          child: Column(
                            children: [
                              AvailablePaymentPointsButton(
                                onPressed: () {},
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                  left: 15.w,
                                  top: 20.h,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Акции',
                                      style: TextStyleHelper.f14w700.copyWith(
                                          color: ThemeHelper.blackDial),
                                    ),
                                    SizedBox(height: 10.h),
                                    SizedBox(
                                      width: 1.sw,
                                      height: 88.h,
                                      child: ListView.separated(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 5,
                                        itemBuilder: (context, index) =>
                                            const StocksBoxWidget(
                                          heading: 'Скидка 25%',
                                          text: 'на первый заказ',
                                          linearGradient: [
                                            Color(0xff9620CE),
                                            Color(0xffFF89A6),
                                          ],
                                        ),
                                        separatorBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(width: 10.w);
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 25.h),
                              MainTabBarWidget(
                                tabControllerFirst: _tabControllerMain,
                              ),
                              SizedBox(height: 25.h),
                              Expanded(
                                child: TabBarView(
                                  controller: _tabControllerMain,
                                  children: <Widget>[
                                    TypesOfDishesTabBarWidget(
                                      tabControllerDishes: _tabControllerDishes,
                                    ),
                                    FunctionalTabBarWidget(
                                      tabControllerSecond:
                                          _tabControllerFunctionalButton,
                                      infoListOfStore: {
                                        'worktime': state.storeModel.worktime,
                                        'phone': state.storeModel.phone,
                                        'whatsapp': state.storeModel.whatsapp,
                                        'telegram': state.storeModel.telegram,
                                        'instagram': state.storeModel.instagram,
                                        'email': state.storeModel.email,
                                        "city":
                                            state.storeModel.storeaddress!.city,
                                        "name":
                                            state.storeModel.storeaddress!.name,
                                        "latitude": state
                                            .storeModel.storeaddress!.latitude,
                                        "longitude": state
                                            .storeModel.storeaddress!.longitude,
                                      },
                                    ),
                                    const Center(child: ReviewsStoreWidget()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    top: 295.h,
                    left: 15.w,
                    right: 15.w,
                    child: InfoBoxStoreWidget(
                      storeName: state.storeModel.name,
                      typeStore: state.storeModel.name,
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: SizedBox(
        width: 70.w,
        height: 70.h,
        child: FloatingActionButton(
          onPressed: () {},
          child: CircleAvatar(child: Image.asset(ImageHelper.callingTheWaiter, fit: BoxFit.cover,)),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.amberAccent,
        child: Container(height: 50.h),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
