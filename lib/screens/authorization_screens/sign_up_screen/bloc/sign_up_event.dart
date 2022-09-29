part of 'sign_up_bloc.dart';

abstract class SignUpEvent {}

class PostSignUpEvent extends SignUpEvent {
  final String phone;

  PostSignUpEvent({required this.phone});
}
