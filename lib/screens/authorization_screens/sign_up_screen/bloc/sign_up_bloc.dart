import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/screens/authorization_screens/sign_up_screen/bloc/sign_up_repository.dart';
part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(SignUpInitial()) {
    on<SignUpEvent>((event, emit) async {
      if (event is PostSignUpEvent) {
        try {
          emit(LoadingSignUpState());
          await SignUpRepository().createUser(phone: event.phone);

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
