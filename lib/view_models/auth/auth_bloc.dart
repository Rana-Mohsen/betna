import 'package:betna/core/services/auth_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoginLoading());
      var result = await AuthApi().loginUser(body: event.body);

      result.fold(
        (failure) {
          emit(AuthLoginFailure(failure.errMessage));
        },
        (login) {
          if (login.containsKey("errors") && login["status"] == "error") {
            print(login);
            emit(AuthLoginFailure("name or email already exists"));
          }
          emit(AuthLoginSuccess("signed up successfully"));
        },
      );
    });

    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthRegisterLoading());
      var result = await AuthApi().signupUser(body: event.body);

      result.fold(
        (failure) {
          emit(AuthLoginFailure(failure.errMessage));
        },
        (signup) {
          if (signup.containsKey("errors") && signup["status"] == "error") {
            print(signup);
            emit(AuthLoginFailure("name or email already exists"));
          }
          emit(AuthLoginSuccess("signed up successfully"));
        },
      );
    });
  }
}
