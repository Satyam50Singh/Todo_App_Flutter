import 'package:auth_app/core/utils/Validations.dart';
import 'package:auth_app/features/auth/login/domain/usecases/login_params.dart';
import 'package:auth_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase _loginUseCase;

  AuthBloc(this._loginUseCase) : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  void _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    final email = event.email.trim();
    final password = event.password.trim();

    if (Validations.isEmailEmpty(email)) {
      return emit(AuthFailure(errorMessage: 'Email cannot be empty.'));
    }

    if (Validations.isPasswordEmpty(password)) {
      return emit(AuthFailure(errorMessage: 'Password cannot be empty.'));
    }

    if (!Validations.isValidPassword(password)) {
      return emit(
        AuthFailure(errorMessage: 'Password cannot be less than 6 characters.'),
      );
    }

    emit(AuthLoading());

    final result = await _loginUseCase.call(LoginParams(username: email, password: password));

    if (kDebugMode) {
      print(result);
    }

    result.fold(
      (failure) => emit(AuthFailure(errorMessage: failure.toString())),
      (user) => emit(
        AuthSuccess(
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
}
