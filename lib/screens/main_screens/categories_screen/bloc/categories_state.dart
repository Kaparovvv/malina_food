part of 'categories_bloc.dart';

abstract class CategoriesState {}

class CategoriesInitial extends CategoriesState {}

class LoadingCategoriesState extends CategoriesState {}

class LoadedCategoriesState extends CategoriesState {
  final CategoriesModel categoriesModelList;

  LoadedCategoriesState({required this.categoriesModelList});
}

class ErrorCategoriesState extends CategoriesState {
  final CatchException? message;

  ErrorCategoriesState({required this.message});
}
