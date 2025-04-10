import 'package:betna/core/services/auth_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
      final AuthApi _auth;

  AuthBloc(this._auth) : super(AuthInitial()) {
    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoginLoading());
      var result = await _auth.loginUser(body: event.body);

      result.fold(
        (failure) {
          emit(AuthLoginFailure(failure.errMessage));
        },
        (login) {
          if (login.containsKey("errors") && login["status"] == "error") {
           // print(login);
            emit(AuthLoginFailure("name or email already exists"));
          }
          emit(AuthLoginSuccess("logged in successfully"));
        },
      );
    });

    on<AuthRegisterEvent>((event, emit) async {
      emit(AuthRegisterLoading());
      var result = await _auth.signupUser(body: event.body);

      result.fold(
        (failure) {
          emit(AuthRegisterFailure(failure.errMessage));
        },
        (signup) {
          if (signup.containsKey("errors") && signup["status"] == "error") {
           // print(signup);
            emit(AuthRegisterFailure("name or email already exists"));
          }
          emit(AuthRegisterSuccess("signed up successfully"));
        },
      );
    });
  }
}
