part of 'sign_in_bloc.dart';

abstract class SignInEvent {}

class PostSignInEvent extends SignInEvent {
  final String phone;
  final String confirmationCode;

  PostSignInEvent({
    required this.phone,
    required this.confirmationCode,
  });
}
