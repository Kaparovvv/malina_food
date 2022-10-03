import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/commons/widget_state.dart';
import 'package:malina_app/global_widgets/customCachedNetworkImage_widget.dart';
import 'package:malina_app/global_widgets/loadingIndicator_widget.dart';
import 'package:malina_app/models/store_model_list.dart';
import 'package:malina_app/screens/store_screen/store_data_bloc/store_bloc.dart';
import 'package:malina_app/screens/store_screen/store_data_bloc/store_event.dart';
import 'package:malina_app/screens/store_screen/store_data_bloc/store_state.dart';
import 'package:malina_app/screens/store_screen/local_widgets/infoBoxStore_widget.dart';
import 'package:malina_app/screens/store_screen/local_widgets/mainTabBar_widget.dart';
import 'package:malina_app/screens/store_screen/contact_store/functionalTabBar_widget.dart';
import 'package:malina_app/screens/store_screen/store_menu/typesOfDishesTabBar_widget.dart';
import 'package:malina_app/screens/store_screen/reviews_about_the_store/reviews_store_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/subcategoriesAppBar_widget.dart';

class StoreScreen extends StatefulWidget {
  // final StoreModelList? storeModelList;
  final bool isScanner;
  const StoreScreen({
    super.key,
    this.isScanner = false,
    //  this.storeModelList,
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
  Box storeIdBox = Hive.box('storeIdBox');

  @override
  void initState() {
    _storeBloc = StoreBloc();
    _storeBloc.add(GetStoreEvent());
    controllers();
    super.initState();
  }

  void controllers() {
    _tabControllerMain = TabController(length: 3, vsync: this);
    _tabControllerFunctionalButton = TabController(length: 2, vsync: this);
    _tabControllerDishes = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() async {
    _tabControllerMain.dispose();
    _tabControllerFunctionalButton.dispose();
    _tabControllerDishes.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoreBloc, StoreState>(
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
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: SubcategoriesAppBar().appBar(
              state.storeModel.name ?? 'Заведение',
              Colors.transparent,
              () async {
                Navigator.pop(context);
                await Hive.box('storeIdBox').delete('storeIdCache');
              },
              () {
                setState(() {
                  WidgetState.isNotify = !WidgetState.isNotify;
                });
              },
            ),
            body: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Column(
                    children: [
                      CustomCachedNetworkImage(
                        imageUrl: state.storeModel.avatar!,
                        width: 1.sw,
                        height: 355.h,
                        boxFit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 1.sw,
                        height: 1.sh,
                        child: Padding(
                          padding: EdgeInsets.only(top: 70.h, left: 8.w),
                          child: Column(
                            children: [
                              // AvailablePaymentPointsButton(
                              //   onPressed: () {},
                              // ),
                              // Padding(
                              //   padding: EdgeInsets.only(
                              //     left: 15.w,
                              //     top: 20.h,
                              //   ),
                              //   child: Column(
                              //     crossAxisAlignment: CrossAxisAlignment.start,
                              //     children: [
                              //       // Text(
                              //       //   'Акции',
                              //       //   style: TextStyleHelper.f14w700.copyWith(
                              //       //       color: ThemeHelper.blackDial),
                              //       // ),
                              //       // SizedBox(height: 10.h),
                              //       // SizedBox(
                              //       //   width: 1.sw,
                              //       //   height: 88.h,
                              //       //   child: ListView.separated(
                              //       //     physics: const BouncingScrollPhysics(),
                              //       //     scrollDirection: Axis.horizontal,
                              //       //     itemCount: 5,
                              //       //     itemBuilder: (context, index) =>
                              //       //         const StocksBoxWidget(
                              //       //       heading: 'Скидка 25%',
                              //       //       text: 'на первый заказ',
                              //       //       linearGradient: [
                              //       //         Color(0xff9620CE),
                              //       //         Color(0xffFF89A6),
                              //       //       ],
                              //       //     ),
                              //       //     separatorBuilder:
                              //       //         (BuildContext context, int index) {
                              //       //       return SizedBox(width: 10.w);
                              //       //     },
                              //       //   ),
                              //       // ),
                              //     ],
                              //   ),
                              // ),
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
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
