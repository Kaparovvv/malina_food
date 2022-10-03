import 'package:malina_app/models/Store_id_model.dart';
import 'package:malina_app/screens/qr_code_screens/qr_code_scanner_screen/store_info_bloc/scanner_provider.dart';

class ScannerRepository {
  Future<StoreIdModel> getStoreId() {
    ScannerProvider scannerProvider = ScannerProvider();

    return scannerProvider.getStoreId();
  }
}
