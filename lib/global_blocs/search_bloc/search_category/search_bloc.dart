import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:malina_app/global_blocs/search_bloc/search_category/string_extension.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/categories_model.dart';
import 'package:malina_app/models/store_model_list.dart';
import 'package:malina_app/screens/main_screens/categories_screen/bloc/categories_repository.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/store_list_bloc/store_list_repository.dart';
part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchCategoryEvent>(
      (event, emit) async {
        emit(LoadingSearchState());
        try {
          List<CategoriesModel> categoriesModelList =
              await CategoriesRepository()
                  .getCategories(query: event.query.toCapitalized());
          emit(
            LoadedSearchCategoryState(categoriesModelList: categoriesModelList),
          );
        } catch (e) {
          emit(
            ErrorSearchState(
              message: CatchException.convertException(e),
            ),
          );
        }
      },
    );

    on<SearchStoreEvent>(
      (event, emit) async {
        emit(LoadingSearchState());
        try {
          StoreModelList storeModelList = await StoreListRepository()
              .getStoreList(query: event.query.toCapitalized());

          emit(
            LoadedSearchStoreState(storeModelList: storeModelList),
          );
        } catch (e) {
          emit(
            ErrorSearchState(
              message: CatchException.convertException(e),
            ),
          );
        }
      },
    );
  }
}
