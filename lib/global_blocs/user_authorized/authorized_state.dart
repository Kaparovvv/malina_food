part of 'authorized_bloc.dart';

@immutable
abstract class AuthorizedState {}

class AuthorizedInitial extends AuthorizedState {}

class UserAuthorizedState extends AuthorizedState {}

class UserNotAuthorizedState extends AuthorizedState {}
