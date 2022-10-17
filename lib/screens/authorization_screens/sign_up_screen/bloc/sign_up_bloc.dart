import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/bloc/sign_up_repository.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      log('bloc1');
      if (event is PostSignUpEvent) {
        log('bloc2');
        try {
          emit(LoadingSignUpState());
          log('bloc3');
          await SignUpRepository().createUser(phone: event.phone);
          log('bloc4');
          emit(LoadedSignUpState());
        } catch (e) {
          emit(
            ErrorSignUpState(
              message: CatchException.convertException(e),
            ),
          );
        }
      }
    });
  }
}
