import 'package:bloc/bloc.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/store_data_model.dart';
import 'package:malina_app/screens/store_screen/store_data_bloc/store_event.dart';
import 'package:malina_app/screens/store_screen/store_data_bloc/store_repository.dart';
import 'package:malina_app/screens/store_screen/store_data_bloc/store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(StoreInitial()) {
    on<GetStoreEvent>((event, emit) async {
      emit(LoadingStoreState());
      try {
        StoreModel storeModel = await StoreRepository().getStoreData();
        emit(
          LoadedStoreState(storeModel: storeModel),
        );
      } catch (e) {
        emit(
          ErrorStoreState(
            message: CatchException.convertException(e),
          ),
        );
      }
    });
  }
}
