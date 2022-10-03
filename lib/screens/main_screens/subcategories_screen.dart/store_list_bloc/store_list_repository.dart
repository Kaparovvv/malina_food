import 'package:malina_app/models/store_model_list.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/store_list_bloc/store_list_provider.dart';

class StoreListRepository {
    Future<StoreModelList> getStoreList() {
    StoreListProvider storeListProvider = StoreListProvider();

    return storeListProvider.getStoreList();
  }
}
