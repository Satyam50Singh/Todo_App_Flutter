part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {
  final String? message;

  AuthLoading({this.message});
}

final class AuthSuccess extends AuthState {
  final String? message;

  AuthSuccess({this.message});
}

final class AuthFailure extends AuthState {
  final String? errorMessage;

  AuthFailure({this.errorMessage});
}
