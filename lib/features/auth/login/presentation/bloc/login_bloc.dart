import 'package:auth_app/core/usecase/params.dart';
import 'package:auth_app/core/utils/validations.dart';
import 'package:auth_app/features/auth/login/domain/usecases/login_params.dart';
import 'package:auth_app/features/auth/login/domain/usecases/login_usecase.dart';
import 'package:auth_app/features/auth/login/domain/usecases/logout_use_case.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUseCase _loginUseCase;
  final LogoutUseCase _logoutUseCase;
  final IValidations _validations;

  LoginBloc(this._loginUseCase, this._logoutUseCase, this._validations)
    : super(LoginInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  void _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<LoginState> emit,
  ) async {
    final email = event.email.trim();
    final password = event.password.trim();

    final errorMsg = validate(email, password);
    if (errorMsg != null) {
      emit(LoginFailure(errorMessage: errorMsg));
      return;
    }

    emit(LoginLoading());

    final result = await _loginUseCase.call(
      LoginParams(username: email, password: password),
    );

    if (kDebugMode) {
      print(result);
    }

    result.fold(
      (failure) => emit(LoginFailure(errorMessage: failure.toString())),
      (user) => emit(
        LoginSuccess(
          message: 'Welcome ${user.username.toUpperCase()}',
          accessToken: user.accessToken,
        ),
      ),
    );
  }

  void _onAuthLogoutRequested(
    AuthLogoutRequested event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    final result = await _logoutUseCase.call(NoParams());

    if (kDebugMode) {
      print(result);
    }

    result.fold(
      (failure) => emit(LogoutFailure(errorMessage: failure.toString())),
      (user) => emit(LogoutSuccess(message: 'Logout Successful')),
    );
  }

  String? validate(String email, String password) {
    if (_validations.isEmailEmpty(email)) {
      return 'Email cannot be empty.';
    }

    if (_validations.isPasswordEmpty(password)) {
      return 'Password cannot be empty.';
    }

    if (!_validations.isValidPassword(password)) {
      return 'Password cannot be less than 6 characters.';
    }

    return null;
  }
}
