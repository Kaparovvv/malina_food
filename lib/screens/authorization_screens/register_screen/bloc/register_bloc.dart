import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:malina_app/helpers/catch_exception.dart';
import 'package:malina_app/screens/authorization_screens/register_screen/bloc/register_repository.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<PostRegisterEvent>(
      (event, emit) async {
        try {
          log('RegisterBloc1');
          emit(LoadingRegisterState());
          log('RegisterBloc2');
          await RegisterRepository().registerUser(
            name: event.name,
            surName: event.surName,
            login: event.login,
            phone: event.phone,
            email: event.email,
            deviceId: event.deviceId,
          );
          log('RegisterBloc3');

          emit(LoadedRegisterState());
          log('RegisterBloc4');
        } catch (e) {
          emit(
            ErrorRegisterState(
              message: CatchException.convertException(e),
            ),
          );
        }
      },
    );
  }
}
