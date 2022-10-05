part of 'search_bloc.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class LoadingSearchState extends SearchState {}

class LoadedSearchCategoryState extends SearchState {
  final List<CategoriesModel> categoriesModelList;

  LoadedSearchCategoryState({required this.categoriesModelList});
}

class LoadedSearchStoreState extends SearchState {
  final StoreModelList storeModelList;

  LoadedSearchStoreState({required this.storeModelList});
}

class ErrorSearchState extends SearchState {
  final CatchException message;

  ErrorSearchState({required this.message});
}
