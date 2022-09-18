import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:malina_app/commons/image_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
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
                  // imageUrl: 'https://yandex.ru/images/search?text=ana+de+armas&img_url=http%3A%2F%2Fon-desktop.com%2Fwps%2F2020_Smiling_actress_Ana_de_Armas_on_a_gray_background_141645_.jpg&pos=8&rpt=simage&stype=image&lr=10309&parent-reqid=1663224842276237-8231058883730267249-sas3-0878-e73-sas-l7-balancer-8080-BAL-1591&source=serp',
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
                      return Center(
                        child: CircularProgressIndicator(
                          color: ThemeHelper.crimson,
                        ),
                      );
                    }

                    if (state is LoadedCategoriesState) {
                      return SizedBox(
                        width: 1.sw,
                        height: 412.h,
                        child: GridView.builder(
                          itemCount: state.categoriesList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemBuilder: (context, index) => BoxCategories(
                            categoriesName:
                                state.categoriesList[index].categoriesName,
                            imageUrl: state.categoriesList[index].imageUrl,
                            isAvailable:
                                state.categoriesList[index].isAvailable!,
                            onTab: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const SubcategoriesScreen(),
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
