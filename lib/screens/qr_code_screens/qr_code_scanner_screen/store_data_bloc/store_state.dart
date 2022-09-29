import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/store_data_model.dart';

abstract class StoreState {}

class StoreInitial extends StoreState {}

class LoadingStoreState extends StoreState {}

class LoadedStoreState extends StoreState {
  final StoreModel storeModel;

  LoadedStoreState({required this.storeModel});
}

class ErrorStoreState extends StoreState {
  final CatchException message;

  ErrorStoreState({required this.message});
}
