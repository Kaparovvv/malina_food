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
          List<CategoriesModel> categoriesModelList =
              await CategoriesRepository().getCategories();
          emit(
            LoadedCategoriesState(categoriesModelList: categoriesModelList),
          );
        } catch (e) {
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
