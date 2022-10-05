part of 'search_bloc.dart';

abstract class SearchEvent {}

class SearchCategoryEvent extends SearchEvent {
  final String query;

  SearchCategoryEvent({required this.query});
}

class SearchStoreEvent extends SearchEvent {
  final String query;

  SearchStoreEvent({required this.query});
}


