import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>(_onAuthLoginRequested);
    on<AuthLogoutRequested>(_onAuthLogoutRequested);
  }

  void _onAuthLoginRequested(
    AuthLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());

      final email = event.email;
      final password = event.password;

      if (email.isEmpty) {
        return emit(AuthFailure(errorMessage: 'Email cannot be empty.'));
      } else if (password.length < 6) {
        return emit(
          AuthFailure(
            errorMessage: 'Password cannot be less than 6 characters.',
          ),
        );
      }
      await Future.delayed(const Duration(seconds: 2), () {
        return emit(
          AuthSuccess(message: 'Welcome ${email.toUpperCase().split('@')[0]}'),
        );
      });
    } catch (e) {
      emit(AuthFailure(errorMessage: 'Login failed. ${e.toString()}'));
    }
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
