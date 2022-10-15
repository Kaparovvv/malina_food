import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/models/tokens_model.dart';
import 'package:malina_app/screens/authorization_screens/sign_in_screen/bloc/sign_in_repository.dart';
part 'sign_in_event.dart';
part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitial()) {
    on<SignInEvent>((event, emit) async {
      if (event is PostSignInEvent) {
        log('bloc1');
        emit(LoadingSignInState());
        try {
          log('bloc2');
          TokensModel tokensModel = await SignInRepository().confirmCode(
            phone: event.phone,
            confirmationCode: event.confirmationCode,
            deviceToken: event.deviceToken,
          );
          log('bloc3');
          // await SignInRepository().confirmCode(
          //   phone: event.phone,
          //   confirmationCode: event.confirmationCode,
          //   deviceToken: event.deviceToken,
          // );
          emit(
            LoadedSignInState(tokensModel: tokensModel),
          );
        } catch (e) {
          ErrorSignInState(
            message: CatchException.convertException(e),
          );
        }
      }
    });
  }
}
