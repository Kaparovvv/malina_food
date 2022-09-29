import 'package:malina_app/screens/authorization_screens/sign_in_screen/bloc/sign_in_provider.dart';

class SignInRepository {
  confirmCode({
    required String phone,
    required String confirmationCode,
  }) {
    SignInProvider provider = SignInProvider();
    provider.confirmCode(phone: phone, confirmationCode: confirmationCode);

    return "";
  }
}
