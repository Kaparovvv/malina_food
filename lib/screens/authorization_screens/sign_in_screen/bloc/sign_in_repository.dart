import 'package:malina_app/models/tokens_model.dart';
import 'package:malina_app/screens/authorization_screens/sign_in_screen/bloc/sign_in_provider.dart';

class SignInRepository {
  Future<TokensModel> confirmCode({
    required String phone,
    required String confirmationCode,
    required String deviceToken,
  }) {
    SignInProvider provider = SignInProvider();
    return provider.confirmCode(
      phone: phone,
      confirmationCode: confirmationCode,
      deviceToken: deviceToken,
    );
  }
}
