part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class AuthLoginEvent extends AuthEvent {
  final Map<String, dynamic> body;

  AuthLoginEvent(this.body);
}

class AuthRegisterEvent extends AuthEvent {
   final Map<String, dynamic> body;

  AuthRegisterEvent(this.body);


}