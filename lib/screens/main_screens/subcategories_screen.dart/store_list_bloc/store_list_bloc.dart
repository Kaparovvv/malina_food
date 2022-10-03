import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/store_model_list.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/store_list_bloc/store_list_event.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/store_list_bloc/store_list_repository.dart';
import 'package:malina_app/screens/main_screens/subcategories_screen.dart/store_list_bloc/store_list_state.dart';

class StoreListBloc extends Bloc<StoreListEvent, StoreListState> {
  StoreListBloc() : super(StoreListInitial()) {
    on<GetStoreListEvent>((event, emit) async {
      emit(LoadingStoreListState());
      try {
        StoreModelList storeModelList =
            await StoreListRepository().getStoreList();

        emit(
          LoadedStoreListState(storeModelList: storeModelList),
        );
      } catch (e) {
        print('StoreList bloc error ====== $e');
        emit(
          ErrorStoreListState(
            message: CatchException.convertException(e),
          ),
        );
      }
    });
  }
}
