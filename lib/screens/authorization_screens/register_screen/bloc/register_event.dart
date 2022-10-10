part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

class PostRegisterEvent extends RegisterEvent {
  final String name;
  final String surName;
  final String login;
  final String phone;
  final String email;
  final String deviceId;

  PostRegisterEvent({
    required this.name,
    required this.surName,
    required this.login,
    required this.phone,
    required this.email,
    required this.deviceId,
  });
}
