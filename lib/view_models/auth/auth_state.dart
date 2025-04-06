part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoginSuccess extends AuthState {
  final String msg;

  AuthLoginSuccess(this.msg);
}

class AuthLoginFailure extends AuthState {
  final String msg;

  AuthLoginFailure(this.msg);
}

class AuthLoginLoading extends AuthState {}

class AuthRegisterSuccess extends AuthState {
  final String msg;

  AuthRegisterSuccess(this.msg);
}

class AuthRegisterFailure extends AuthState {
  final String msg;

  AuthRegisterFailure(this.msg);
}

class AuthRegisterLoading extends AuthState {}