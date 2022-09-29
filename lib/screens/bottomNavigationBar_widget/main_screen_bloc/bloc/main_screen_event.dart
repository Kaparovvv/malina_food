part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenEvent {}

class FeedScreenEvent extends MainScreenEvent {}

class HomeScreenEvent extends MainScreenEvent {}

class CartScreenEvent extends MainScreenEvent {}

class ProfileScreenEvent extends MainScreenEvent {}
