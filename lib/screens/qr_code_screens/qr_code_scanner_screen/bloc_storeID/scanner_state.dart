import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/Store_id_model.dart';

abstract class ScannerState {}

class ScannerInitial extends ScannerState {}

class LoadingScannerState extends ScannerState {}

class LoadedScannerState extends ScannerState {
  final StoreIdModel storeIdModel;

  LoadedScannerState({required this.storeIdModel});
}

class ErrorScannerState extends ScannerState {
  final CatchException? message;

  ErrorScannerState({required this.message});
}
