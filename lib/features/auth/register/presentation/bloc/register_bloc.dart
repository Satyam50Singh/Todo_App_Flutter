import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/register_params.dart';
import '../../domain/usecases/register_usecase.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUseCase _registerUseCase;

  RegisterBloc(this._registerUseCase) : super(RegisterInitial()) {
    on<AuthRegisterRequested>(_onAuthRegisterRequested);
  }

  void _onAuthRegisterRequested(
    AuthRegisterRequested event,
    Emitter<RegisterState> emit,
  ) async {
    final username = event.username.trim();
    final email = event.email.trim();
    final password = event.password.trim();
    final confirmPassword = event.confirmPassword.trim();
    final fullName = event.fullName.trim();
    final mobileNumber = event.mobileNumber.trim();

    final errorMsg = validate(username, email, password, confirmPassword);

    if (errorMsg != null) {
      emit(RegisterFailure(errorMessage: errorMsg));
      return;
    }

    emit(RegisterLoading());

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
      (failure) => emit(RegisterFailure(errorMessage: failure.toString())),
      (response) => emit(RegisterSuccess(message: response.message)),
    );
  }

  String? validate(
    String username,
    String email,
    String password,
    String confirmPassword,
  ) {
    if (username.trim().isEmpty) {
      return 'Username cannot be empty';
    }
    if (email.trim().isEmpty) {
      return 'Email cannot be empty';
    }
    if (password.trim().isEmpty) {
      return 'Password cannot be empty';
    }
    if (confirmPassword.trim().isEmpty) {
      return 'Confirm password cannot be empty';
    }
    if (password.trim() != confirmPassword.trim()) {
      return 'Passwords do not match';
    }

    return null;
  }
}
