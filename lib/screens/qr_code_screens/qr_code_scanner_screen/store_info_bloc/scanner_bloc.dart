import 'package:bloc/bloc.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/Store_id_model.dart';
import 'package:malina_app/screens/qr_code_screens/qr_code_scanner_screen/store_info_bloc/scanner_event.dart';
import 'package:malina_app/screens/qr_code_screens/qr_code_scanner_screen/store_info_bloc/scanner_repository.dart';
import 'package:malina_app/screens/qr_code_screens/qr_code_scanner_screen/store_info_bloc/scanner_state.dart';

class ScannerBloc extends Bloc<ScannerEvent, ScannerState> {
  ScannerBloc() : super(ScannerInitial()) {
    on<GetScannerEvent>(
      (event, emit) async {
        emit(LoadingScannerState());
        try {
          StoreIdModel storeIdModel = await ScannerRepository().getStoreId();
          emit(
            LoadedScannerState(storeIdModel: storeIdModel),
          );
        } catch (e) {
          emit(
            ErrorScannerState(
              message: CatchException.convertException(e),
            ),
          );
        }
      },
    );
  }
}
