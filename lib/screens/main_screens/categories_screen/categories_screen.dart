import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/commons/textStyle_helper.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/global_blocs/search_bloc/search_category/search_bloc.dart';
import 'package:malina_app/global_widgets/loadingIndicator_widget.dart';
import 'package:malina_app/global_widgets/searchTextField_widget.dart';
import 'package:malina_app/screens/main_screens/categories_screen/bloc/categories_bloc.dart';
import 'package:malina_app/screens/main_screens/categories_screen/local_widgets/box_categories.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/subcategories_screen.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late CategoriesBloc _categoriesBloc;
  late SearchBloc _searchBloc;
  late Box _categoriesIdBox;
  int currentRoute = 0;
  String _valueSearch = '';

  late TextEditingController _searchQuery;

  @override
  void initState() {
    _searchQuery = TextEditingController();
    _categoriesBloc = CategoriesBloc();
    _searchBloc = SearchBloc();
    _categoriesBloc.add(GetCategoriesEvent());
    _categoriesIdBox = Hive.box('categoriesIdBox');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (BuildContext context) {
            return Scaffold(
              body: Padding(
                padding: EdgeInsets.only(top: 39.h, left: 29.w, right: 29.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // UserBoxWidget(
                      //   imageUrl:
                      //       'https://i.pinimg.com/736x/35/df/8c/35df8ccca96dcbcd3568c48b93f5c759.jpg',
                      //   userName: 'Екатерина',
                      //   boxTab: () => _categoriesBloc.add(GetCategoriesEvent()),
                      //   notifyTab: () {},
                      // ),
                      // SizedBox(height: 19.h),
                      SearchTextFieldWidget(
                        fillColor: ThemeHelper.rgb238,
                        width: 302,
                        controller: _searchQuery,
                        onChanged: (value) {
                          _valueSearch = value;
                          setState(() {
                            _searchBloc.add(
                              SearchCategoryEvent(
                                query: _valueSearch,
                              ),
                            );
                          });
                        },
                        onFieldSubmited: (value) {
                          _valueSearch = value;
                          setState(() {
                            _searchBloc.add(
                              SearchCategoryEvent(query: _valueSearch),
                            );
                          });
                        },
                      ),
                      SizedBox(height: 20.h),
                      _valueSearch.isNotEmpty
                          ? BlocConsumer<SearchBloc, SearchState>(
                              bloc: _searchBloc,
                              listener: (context, state) {
                                if (state is ErrorSearchState) {
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
                                if (state is LoadingSearchState) {
                                  return const Center(
                                    child: LoadingIndicatorWidget(),
                                  );
                                }

                                if (state is LoadedSearchCategoryState) {
                                  return state.categoriesModelList.isNotEmpty
                                      ? SizedBox(
                                          width: 1.sw,
                                          height: 1.sh,
                                          child: GridView.builder(
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              itemCount: state
                                                  .categoriesModelList.length,
                                              gridDelegate:
                                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 3,
                                              ),
                                              itemBuilder: (context, index) {
                                                final category = state
                                                    .categoriesModelList[index];
                                                return BoxCategories(
                                                  categoriesName: category.name,
                                                  imageUrl: category.icon,
                                                  available: category.available,
                                                  onTab: () {
                                                    currentRoute = index;
                                                    _categoriesIdBox.put(
                                                        'categoriesId',
                                                        category.id);
                                                    log('categoriesIdBox ======= ${_categoriesIdBox.get('categoriesId')}'
                                                        .toString());
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            SubcategoriesScreen(
                                                          index: index,
                                                          imageUrl:
                                                              category.icon,
                                                          categories:
                                                              category.name,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              }),
                                        )
                                      : Center(
                                          child: Text(
                                            'Категории с таким название нет',
                                            style: TextStyleHelper.f14w500,
                                          ),
                                        );
                                }
                                return const SizedBox();
                              },
                            )
                          : BlocConsumer<CategoriesBloc, CategoriesState>(
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
                                    height: 1.sh,
                                    child: GridView.builder(
                                      physics: const BouncingScrollPhysics(),
                                      itemCount:
                                          state.categoriesModelList.length,
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                      ),
                                      itemBuilder: (context, index) {
                                        final category =
                                            state.categoriesModelList[index];
                                        return BoxCategories(
                                          categoriesName: category.name,
                                          imageUrl: category.icon,
                                          available: category.available,
                                          onTab: () {
                                            currentRoute = index;
                                            _categoriesIdBox.put(
                                                'categoriesId', category.id);
                                            log('categoriesIdBox ======= ${_categoriesIdBox.get('categoriesId')}'
                                                .toString());
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    SubcategoriesScreen(
                                                  index: index,
                                                  imageUrl: category.icon,
                                                  categories: category.name,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  );
                                }
                                return const SizedBox();
                              },
                            ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
