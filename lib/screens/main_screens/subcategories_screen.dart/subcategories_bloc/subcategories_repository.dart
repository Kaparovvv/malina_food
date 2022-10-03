import 'package:malina_app/models/subcategories_model.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/subcategories_bloc/subcategories_provider.dart';

class SubcategoriesRepository {
  Future<List<SubcategoriesModel>> getSubcategories() {
    SubcategoriesProvider subcategoriesProvider = SubcategoriesProvider();

    return subcategoriesProvider.getSubcategories();
  }
}
