import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/store_model_list.dart';

abstract class StoreListState {}

class StoreListInitial extends StoreListState {}

class LoadingStoreListState extends StoreListState {}

class LoadedStoreListState extends StoreListState {
  final StoreModelList storeModelList;

  LoadedStoreListState({required this.storeModelList});
}

class ErrorStoreListState extends StoreListState {
  final CatchException message;

  ErrorStoreListState({required this.message});
}
