import 'package:malina_app/screens/authorization_screens/register_screen/bloc/register_provider.dart';

class RegisterRepository {
  registerUser({
    required String name,
    required String surName,
    required String login,
    required String phone,
    required String email,
    required String deviceId,
  }) {
    RegisterProvider provider = RegisterProvider();
    provider.registerUser(
      name: name,
      surName: surName,
      login: login,
      phone: phone,
      email: email,
      deviceId: deviceId,
    );
    return "";
  }
}
