part of 'main_screen_bloc.dart';

@immutable
abstract class MainScreenState {}

class MainScreenInitial extends MainScreenState {}

class ScreenState extends MainScreenState {
  final Widget screenName;

  ScreenState({required this.screenName});
}