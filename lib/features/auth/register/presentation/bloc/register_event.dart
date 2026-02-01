part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

final class AuthRegisterRequested extends RegisterEvent {
  final String username;
  final String email;
  final String password;
  final String confirmPassword;
  final String fullName;
  final String mobileNumber;

  AuthRegisterRequested({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.username,
    required this.fullName,
    required this.mobileNumber,
  });
}
