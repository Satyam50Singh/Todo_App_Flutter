part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

final class AuthLoginRequested extends LoginEvent {
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});
}

final class AuthLogoutRequested extends LoginEvent {}
