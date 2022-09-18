part of 'categories_bloc.dart';

@immutable
abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class LoadingCategoriesState extends CategoriesState {}

class LoadedCategoriesState extends CategoriesState {
  final List<CategoriesModel> categoriesList;

  LoadedCategoriesState({required this.categoriesList});
}

class ErrorCategoriesState extends CategoriesState {
  final String? message;

  ErrorCategoriesState(this.message);
}
