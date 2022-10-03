import 'package:bloc/bloc.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/subcategories_model.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/subcategories_bloc/subcategories_repository.dart';

part 'subcategories_event.dart';
part 'subcategories_state.dart';

class SubcategoriesBloc extends Bloc<SubcategoriesEvent, SubcategoriesState> {
  SubcategoriesBloc() : super(SubcategoriesInitial()) {
    on<GetSubcategoriesEvent>(
      (event, emit) async {
        emit(LoadingSubcategoriesState());
        try {
          List<SubcategoriesModel> subcategoriesModelList =
              await SubcategoriesRepository().getSubcategories();
          emit(
            LoadedSubcategoriesState(
                subcategoriesModelList: subcategoriesModelList),
          );
        } catch (e) {
          print('Subcategories bloc error ====== $e');
          emit(
            ErrorSubcategoriesState(
              message: CatchException.convertException(e),
            ),
          );
        }
      },
    );
  }
}
