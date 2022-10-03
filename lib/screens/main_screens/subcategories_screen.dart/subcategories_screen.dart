import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/commons/widget_state.dart';
import 'package:malina_app/global_widgets/loadingIndicator_widget.dart';
import 'package:malina_app/global_widgets/searchTextField_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/containerStore_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/store_list_bloc/store_list_bloc.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/store_list_bloc/store_list_event.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/store_list_bloc/store_list_state.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/subcategories_bloc/subcategories_bloc.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/section_button_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/subcategoriesAppBar_widget.dart';
import 'package:malina_app/screens/store_screen/store_screen.dart';

class SubcategoriesScreen extends StatefulWidget {
  final String? categories;
  final String? imageUrl;
  const SubcategoriesScreen({
    super.key,
    required this.categories,
    required this.imageUrl,
  });

  @override
  State<SubcategoriesScreen> createState() => _SubcategoriesScreenState();
}

class _SubcategoriesScreenState extends State<SubcategoriesScreen> {
  late SubcategoriesBloc _subcategoriesBloc;
  late StoreListBloc _storeListBloc;

  @override
  void initState() {
    _subcategoriesBloc = SubcategoriesBloc();
    _storeListBloc = StoreListBloc();
    _subcategoriesBloc.add(GetSubcategoriesEvent());
    _storeListBloc.add(GetStoreListEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubcategoriesAppBar().appBar(
        widget.categories ?? 'unknown',
        ThemeHelper.rgb239,
        () => Navigator.pop(context),
        () {
          setState(() {
            WidgetState.isNotify = !WidgetState.isNotify;
          });
        },
      ),
      body: Container(
        width: 1.sw,
        height: 1.sh,
        color: ThemeHelper.rgb239,
        child: Padding(
          padding: EdgeInsets.only(top: 18.h, left: 7.w, right: 10.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SearchTextFieldWidget(
                  controller: TextEditingController(),
                  fillColor: ThemeHelper.white,
                  width: 334,
                ),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 90.w,
                      height: 495.h,
                      child:
                          BlocConsumer<SubcategoriesBloc, SubcategoriesState>(
                        bloc: _subcategoriesBloc,
                        listener: (context, state) {
                          if (state is ErrorSubcategoriesState) {
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
                          if (state is LoadingSubcategoriesState) {
                            return const Center(
                              child: LoadingIndicatorWidget(),
                            );
                          }

                          if (state is LoadedSubcategoriesState) {
                            return ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.subcategoriesModelList.length,
                              itemBuilder: (context, index) {
                                return SectionButtonWidget(
                                  onPressed: () {},
                                  sectionName:
                                      state.subcategoriesModelList[index].name,
                                  iconUrl:
                                      state.subcategoriesModelList[index].icon,
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 5.h);
                              },
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                    SizedBox(width: 8.w),
                    SizedBox(
                      width: 245.w,
                      height: 495.h,
                      child: BlocConsumer<StoreListBloc, StoreListState>(
                        bloc: _storeListBloc,
                        listener: (context, state) {
                          if (state is ErrorStoreListState) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  state.message.toString(),
                                ),
                              ),
                            );
                          }

                          if (state is LoadedStoreListState) {}
                        },
                        builder: (context, state) {
                          if (state is ErrorStoreListState) {
                            return ElevatedButton(
                              onPressed: () => _storeListBloc.add(
                                GetStoreListEvent(),
                              ),
                              style: ElevatedButton.styleFrom(
                                fixedSize: Size(100.w, 30.h),
                              ),
                              child: const Text('Try Again'),
                            );
                          }
                          if (state is LoadingStoreListState) {
                            return const Center(
                              child: LoadingIndicatorWidget(),
                            );
                          }

                          if (state is LoadedStoreListState) {
                            Box storeIdBox = Hive.box('storeIdBox');
                            return ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              itemCount: state.storeModelList.count!,
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return SizedBox(height: 15.h);
                              },
                              itemBuilder: (context, index) {
                                return ContainerStoreWidget(
                                  imageUrl: state
                                      .storeModelList.results![index].avatar,
                                  nameStore: state.storeModelList
                                          .results![index].name ??
                                      'unknown',
                                  onTap: () {
                                    storeIdBox.put(
                                        'storeIdCache',
                                        state
                                            .storeModelList.results![index].id);
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const StoreScreen(
                                            // storeModelList:
                                            //     state.storeModelList,
                                            ),
                                      ),
                                    );
                                  },
                                );
                              },
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
