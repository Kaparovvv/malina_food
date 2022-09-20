import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/image_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_widgets/loadingIndicator_widget.dart';
import 'package:malina_app/global_widgets/searchTextField_widget.dart';
import 'package:malina_app/screens/main_screens/categories_screen/bloc/categories_bloc.dart';
import 'package:malina_app/screens/main_screens/categories_screen/local_widgets/box_categories.dart';
import 'package:malina_app/screens/main_screens/categories_screen/local_widgets/userBox_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/subcategories_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late CategoriesBloc _categoriesBloc;

  @override
  void initState() {
    _categoriesBloc = CategoriesBloc();
    _categoriesBloc.add(GetCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 39.h, left: 29.w, right: 29.w),
          child: SingleChildScrollView(
            child: Column(
              children: [
                UserBoxWidget(
                  imageUrl: ImageHelper.userPhoto,
                  userName: 'Екатерина',
                  boxTab: () {},
                  notifyTab: () {},
                ),
                SizedBox(height: 19.h),
                SearchTextFieldWidget(
                  fillColor: ThemeHelper.rgb238,
                  width: 302,
                  controller: TextEditingController(),
                ),
                BlocConsumer<CategoriesBloc, CategoriesState>(
                  bloc: _categoriesBloc,
                  listener: (context, state) {
                    if (state is ErrorCategoriesState) {
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
                    if (state is LoadingCategoriesState) {
                      return const Center(
                        child: LoadingIndicatorWidget(),
                      );
                    }

                    if (state is LoadedCategoriesState) {
                      return SizedBox(
                        width: 1.sw,
                        height: 412.h,
                        child: GridView.builder(
                          itemCount: state.categoriesModelList.results!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (context, index) => BoxCategories(
                            categoriesName:
                                state.categoriesModelList.results![index].name,
                            imageUrl: state
                                .categoriesModelList.results![index].avatar,
                            isAvailable: true,
                            onTab: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SubcategoriesScreen(
                                  imageUrl: state.categoriesModelList
                                      .results![index].avatar,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
