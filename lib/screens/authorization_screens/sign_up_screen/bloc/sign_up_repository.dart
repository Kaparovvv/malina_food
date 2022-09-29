import 'package:malina_app/screens/authorization_screens/sign_up_screen/bloc/sign_up_provider.dart';

class SignUpRepository {
  createUser({
    required String phone,
  }) {
    SignUpProvider provider = SignUpProvider();
    provider.createUser(phone: phone);

    return "";
  }
}
