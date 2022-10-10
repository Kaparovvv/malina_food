part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class LoadedRegisterState extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class ErrorRegisterState extends RegisterState {
  final CatchException message;

  ErrorRegisterState({required this.message});
}
