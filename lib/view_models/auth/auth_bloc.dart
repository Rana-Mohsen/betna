import 'package:betna/core/services/auth_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {

    on<AuthLoginEvent>((event, emit) async {
      emit(AuthLoginLoading());
      var respBody = await AuthApi().loginUser(body: event.body);

      if (respBody.containsKey("errors") && respBody["status"] == "error") {
        print(respBody);
        emit(AuthLoginFailure("name or email already exists"));
      }
      emit(AuthLoginSuccess("signed up successfully"));
    });

     on<AuthRegisterEvent>((event, emit) async{
      emit(AuthRegisterLoading());
      var respBody = await AuthApi().signupUser(body: event.body);

      if (respBody.containsKey("errors") && respBody["status"] == "error") {
        print(respBody);
        emit(AuthRegisterFailure("name or email already exists"));
      }
      emit(AuthRegisterSuccess("signed up successfully"));
    });
  }


}
