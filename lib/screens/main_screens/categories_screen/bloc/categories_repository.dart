import 'package:malina_app/models/categories_model.dart';
import 'package:malina_app/screens/main_screens/categories_screen/bloc/categories_provider.dart';

class CategoriesRepository {
  Future<CategoriesModel> getCategories() {
    CategoriesProvider categoriesProvider = CategoriesProvider();

    return categoriesProvider.getCategories();
  }
}
