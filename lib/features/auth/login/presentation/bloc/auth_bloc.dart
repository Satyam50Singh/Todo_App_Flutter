import 'package:auth_app/core/utils/validations.dart';
import 'package:auth_app/features/auth/login/domain/usecases/login_params.dart';
import 'package:auth_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:auth_app/features/auth/login/domain/usecases/register_params.dart';
import 'package:auth_app/features/auth/login/domain/usecases/register_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;
  final RegisterUseCase _registerUseCase;
  final IValidations _validations;

  AuthBloc(this._loginUseCase, this._registerUseCase, this._validations)
    : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
    on<AuthRegisterRequested>(_onAuthRegisterRequested);
  }

  void _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    final email = event.email.trim();
    final password = event.password.trim();

    if (_validations.isEmailEmpty(email)) {
      return emit(AuthFailure(errorMessage: 'Email cannot be empty.'));
    }

    if (_validations.isPasswordEmpty(password)) {
      return emit(AuthFailure(errorMessage: 'Password cannot be empty.'));
    }

    if (!_validations.isValidPassword(password)) {
      return emit(
        AuthFailure(errorMessage: 'Password cannot be less than 6 characters.'),
      );
    }

    emit(AuthLoading());

    final result = await _loginUseCase.call(
      LoginParams(username: email, password: password),
    );

    if (kDebugMode) {
      print(result);
    }

    result.fold(
      (failure) => emit(AuthFailure(errorMessage: failure.toString())),
      (user) => emit(
        AuthLoginSuccess(
          message: 'Welcome ${user.username.toUpperCase()}',
          accessToken: user.accessToken,
        ),
      ),
    );
  }

  void _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    try {
      await Future.delayed(const Duration(seconds: 2), () {
        return emit(AuthInitial());
      });
    } catch (e) {
      emit(AuthFailure(errorMessage: 'Logout failed. ${e.toString()}'));
    }
  }

  void _onAuthRegisterRequested(
    AuthRegisterRequested event,
    Emitter<AuthState> emit,
  ) async {
    final username = event.username.trim();
    final email = event.email.trim();
    final password = event.password.trim();
    final fullName = event.fullName.trim();
    final mobileNumber = event.mobileNumber.trim();

    emit(AuthLoading());

    final result = await _registerUseCase.call(
      RegisterParams(
        username: username,
        email: email,
        password: password,
        fullName: fullName,
        mobileNumber: mobileNumber,
      ),
    );

    if (kDebugMode) {
      print(result);
    }

    result.fold(
      (failure) => emit(AuthFailure(errorMessage: failure.toString())),
      (response) => emit(
        AuthRegisterSuccess(
          message: response.message,
        ),
      ),
    );
  }
}
