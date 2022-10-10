import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'authorized_event.dart';
part 'authorized_state.dart';

class AuthorizedBloc extends Bloc<AuthorizedEvent, AuthorizedState> {
  AuthorizedBloc() : super(AuthorizedInitial()) {
    on<AuthorizedEvent>((event, emit) {
      if (event is UserAuthorizedEvent) {
        UserAuthorizedState();
      } else {
        UserNotAuthorizedState();
      }
    });
  }
}
