import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/commons/them_helper.dart';
import 'package:malina_app/commons/widget_state.dart';
import 'package:malina_app/global_blocs/search_bloc/search_category/search_bloc.dart';
import 'package:malina_app/global_widgets/searchTextField_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/bloc_consumer/search_store_blocConsumer.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/bloc_consumer/storeList_blocConsumer.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/bloc_consumer/subcategory_blocConsumer.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/store_list_bloc/store_list_bloc.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/subcategories_bloc/subcategories_bloc.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/subcategoriesAppBar_widget.dart';

class SubcategoriesScreen extends StatefulWidget {
  final String? categories;
  final String? imageUrl;
  final int? index;
  final TextEditingController? textEditingController;
  const SubcategoriesScreen({
    super.key,
    required this.categories,
    required this.imageUrl,
    required this.index,
    this.textEditingController,
  });

  @override
  State<SubcategoriesScreen> createState() => _SubcategoriesScreenState();
}

class _SubcategoriesScreenState extends State<SubcategoriesScreen> {
  late SubcategoriesBloc _subcategoriesBloc;
  late StoreListBloc _storeListBloc;
  late TextEditingController _searchQuery;
  late SearchBloc _searchBloc;
  String _valueSearch = '';

  @override
  void initState() {
    _searchQuery = TextEditingController();
    _searchBloc = SearchBloc();
    _subcategoriesBloc = SubcategoriesBloc();
    _storeListBloc = StoreListBloc();
    _subcategoriesBloc.add(GetSubcategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SubcategoriesAppBar().appBar(
        widget.categories ?? 'unknown',
        ThemeHelper.rgb239,
        () async {
          Navigator.pop(context);
          await Hive.box('subcategoryID').delete('idCache');
        },
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
                  controller: _searchQuery,
                  fillColor: ThemeHelper.white,
                  width: 334,
                  onChanged: (value) {
                    _valueSearch = value;
                    setState(() {
                      _searchBloc.add(
                        SearchStoreEvent(query: _valueSearch),
                      );
                    });
                    log(_valueSearch.toString());
                  },
                  // onFieldSubmited: (value) {
                  //   _valueSearch = value;
                  //   setState(() {
                  //     _searchBloc.add(
                  //       SearchStoreEvent(query: _valueSearch),
                  //     );
                  //   });
                  // },
                ),
                SizedBox(height: 25.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 90.w,
                      height: 495.h,
                      child: SubcategoryBlocConsumer(
                          subcategoriesBloc: _subcategoriesBloc,
                          storeListBloc: _storeListBloc),
                    ),
                    SizedBox(width: 8.w),
                    SizedBox(
                      width: 245.w,
                      height: 495.h,
                      child: _valueSearch.isNotEmpty
                          ? SearchStoreBlocConsumer(searchBloc: _searchBloc)
                          : StoreListBlocConsumer(
                              storeListBloc: _storeListBloc),
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
