import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/categories_model.dart';
import 'package:malina_app/screens/main_screens/categories_screen/bloc/categories_repository.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesEvent>((event, emit) async {
      if (event is GetCategoriesEvent) {
        emit(LoadingCategoriesState());
        try {
          CategoriesModel categoriesModel =
              await CategoriesRepository().getCategories();
          emit(
            LoadedCategoriesState(categoriesModelList: categoriesModel),
          );
        } catch (e) {
          print('user bloc error ======= $e');
          emit(
            ErrorCategoriesState(
              message: CatchException.convertException(e),
            ),
          );
        }
      }
    });
  }
}


/*
List<CategoriesModel> categoriesList = [
            CategoriesModel(
              categoriesName: 'Malina food',
              imageUrl: ImageHelper.malinaFood,
              isAvailable: true,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: true,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: false,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: false,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: false,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: false,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: false,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: false,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: false,
            ),
            CategoriesModel(
              categoriesName: 'Malina food',
              imageUrl: ImageHelper.malinaFood,
              isAvailable: true,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: true,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: false,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: false,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: false,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: false,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: false,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: false,
            ),
            CategoriesModel(
              categoriesName: 'Еда',
              imageUrl: ImageHelper.food,
              isAvailable: false,
            ),
          ];
 */