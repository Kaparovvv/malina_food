import 'package:malina_app/models/store_data_model.dart';
import 'package:malina_app/screens/store_screens/store_screen/store_data_bloc/store_provider.dart';

class StoreRepository {
  Future<StoreModel> getStoreData() {
    StoreProvider storeProvider = StoreProvider();
    return storeProvider.getStoreData();
  }
}
