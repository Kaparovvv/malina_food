part of 'subcategories_bloc.dart';

abstract class SubcategoriesState {}

class SubcategoriesInitial extends SubcategoriesState {}

class LoadingSubcategoriesState extends SubcategoriesState {}

class LoadedSubcategoriesState extends SubcategoriesState {
  final List<SubcategoriesModel> subcategoriesModelList;

  LoadedSubcategoriesState({required this.subcategoriesModelList});
}

class ErrorSubcategoriesState extends SubcategoriesState {
  final CatchException message;

  ErrorSubcategoriesState({required this.message});
}


