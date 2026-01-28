part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthLoginRequested extends AuthEvent {
  final String email;
  final String password;

  AuthLoginRequested({required this.email, required this.password});
}

final class AuthLogoutRequested extends AuthEvent {}

final class AuthRegisterRequested extends AuthEvent {
  final String username;
  final String email;
  final String password;
  final String fullName;
  final String mobileNumber;

  AuthRegisterRequested({
    required this.email,
    required this.password,
    required this.username,
    required this.fullName,
    required this.mobileNumber,
  });
}
