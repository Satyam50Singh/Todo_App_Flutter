part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {
  final String? message;

  RegisterLoading({this.message});
}

final class RegisterSuccess extends RegisterState {
  final String? message;

  RegisterSuccess({this.message});
}

final class RegisterFailure extends RegisterState {
  final String? errorMessage;

  RegisterFailure({this.errorMessage});
}
