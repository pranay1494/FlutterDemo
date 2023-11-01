part of 'login_cubit.dart';

abstract class LoginState {}

class LoginInitialised extends LoginState {}
class LoginInitiated extends LoginState {}

class LoginSuccessful extends LoginState {
  final String accessToken;

  LoginSuccessful({required this.accessToken});
}

class LoginFailedWithError extends LoginState {
  final String error;

  LoginFailedWithError({required this.error});
}
