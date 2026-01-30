part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {
  final String? message;

  LoginLoading({this.message});
}

final class LoginSuccess extends LoginState {
  final String? message;
  final String? accessToken;

  LoginSuccess({this.message, this.accessToken});
}

final class LoginFailure extends LoginState {
  final String? errorMessage;

  LoginFailure({this.errorMessage});
}
