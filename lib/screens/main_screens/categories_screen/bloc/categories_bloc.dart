import 'package:bloc/bloc.dart';
import 'package:malina_app/commons/image_helper.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/categories_model.dart';
import 'package:meta/meta.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<CategoriesEvent>((event, emit) {
      if (event is GetCategoriesEvent) {
        emit(LoadingCategoriesState());
        try {
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
          emit(
            LoadedCategoriesState(categoriesList: categoriesList),
          );
        } catch (e) {
          print('user bloc error ======= $e');
          emit(ErrorCategoriesState(e.toString()));
        }
      }
    });
  }
}
