import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:malina_app/screens/cart_screen/cart_screen.dart';
import 'package:malina_app/screens/feed_screen/feed_screen.dart';
import 'package:malina_app/screens/main_screens/categories_screen/categories_screen.dart';
import 'package:malina_app/screens/profile_screen/profile_screen.dart';

part 'main_screen_event.dart';
part 'main_screen_state.dart';

class MainScreenBloc extends Bloc<MainScreenEvent, MainScreenState> {
  MainScreenBloc() : super(MainScreenInitial()) {
    on<MainScreenEvent>((event, emit) {
      if (event is FeedScreenEvent) {
        emit((ScreenState(screenName: const FeedScreen())));
      }

      if (event is HomeScreenEvent) {
        emit((ScreenState(screenName: const HomeScreen())));
      }

      if (event is CartScreenEvent) {
        emit((ScreenState(screenName: const CartScreen())));
      }

      if (event is ProfileScreenEvent) {
        emit((ScreenState(screenName: const ProfileScreen())));
      }
    });
  }
}
