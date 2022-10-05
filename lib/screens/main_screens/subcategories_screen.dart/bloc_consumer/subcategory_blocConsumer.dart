import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:malina_app/global_widgets/loadingIndicator_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/local_widgets/section_button_widget.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/store_list_bloc/store_list_bloc.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/store_list_bloc/store_list_event.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/subcategories_bloc/subcategories_bloc.dart';

class SubcategoryBlocConsumer extends StatefulWidget {
  const SubcategoryBlocConsumer({
    Key? key,
    required SubcategoriesBloc subcategoriesBloc,
    required StoreListBloc storeListBloc,
  })  : _subcategoriesBloc = subcategoriesBloc,
        _storeListBloc = storeListBloc,
        super(key: key);

  final SubcategoriesBloc _subcategoriesBloc;
  final StoreListBloc _storeListBloc;

  @override
  State<SubcategoryBlocConsumer> createState() =>
      _SubcategoryBlocConsumerState();
}

class _SubcategoryBlocConsumerState extends State<SubcategoryBlocConsumer> {
  late Box subcategoryID;

  @override
  void initState() {
    subcategoryID = Hive.box('subcategoryID');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isActive = false;
    return BlocConsumer<SubcategoriesBloc, SubcategoriesState>(
      bloc: widget._subcategoriesBloc,
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
              subcategoryID.put(
                  'idCache', ' ${state.subcategoriesModelList[0].id}');
              log('1 ===== ${subcategoryID.get('idCache')}');
              widget._storeListBloc.add(GetStoreListEvent());
              return SectionButtonWidget(
                onPressed: () {
                  subcategoryID.put(
                      'idCache', ' ${state.subcategoriesModelList[index].id}');
                  log('2 ===== ${subcategoryID.get('idCache')}');
                  if (subcategoryID.isNotEmpty) {
                    widget._storeListBloc.add(GetStoreListEvent());
                  }
                },
                isActive: isActive,
                sectionName: state.subcategoriesModelList[index].name,
                iconUrl: state.subcategoriesModelList[index].icon,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 5.h);
            },
          );
        }
        return const SizedBox();
      },
    );
  }
}
