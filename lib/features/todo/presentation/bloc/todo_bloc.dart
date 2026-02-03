import 'package:auth_app/features/todo/domain/usecases/add_todo_usecase.dart';
import 'package:auth_app/features/todo/domain/usecases/get_todo_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/params.dart';
import '../../domain/entities/todo_entity.dart';
import '../../domain/usecases/add_todo_params.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final AddTodoUseCase _addTodoUseCase;
  final GetTodoUseCase _getTodoUseCase;

  TodoBloc(this._addTodoUseCase, this._getTodoUseCase) : super(TodoInitial()) {
    on<AddTodoRequested>(_onAddTodoRequested);
    on<GetTodoListRequested>(_onGetTodoListRequested);
  }

  void _onAddTodoRequested(
    AddTodoRequested event,
    Emitter<TodoState> emit,
  ) async {
    final String title = event.title.trim();
    final String description = event.description.trim();
    final String dueDate = event.dueDate.trim();

    final errMsg = validate(title, description, dueDate);

    if (errMsg != null) {
      emit(AddTodoFailure(errorMsg: errMsg));
    }

    emit(AddTodoLoading('Loading...'));

    final result = await _addTodoUseCase.call(
      AddTodoParams(title: title, description: description, dueDate: dueDate),
    );

    if (kDebugMode) {
      print(result);
    }

    result.fold(
      (failure) => emit(AddTodoFailure(errorMsg: failure.toString())),
      (response) => emit(AddTodoSuccess(message: response.message)),
    );
  }

  String? validate(String title, String description, String dueDate) {
    if (title.isEmpty) {
      return 'Title cannot be empty';
    }

    if (description.isEmpty) {
      return 'Description cannot be empty';
    }
    return null;
  }

  void _onGetTodoListRequested(
    GetTodoListRequested event,
    Emitter<TodoState> emit,
  ) async {
    emit(GetTodoListLoading('Loading...'));

    final result = await _getTodoUseCase.call(NoParams());

    if (kDebugMode) {
      print(result);
    }
    result.fold(
      (failure) => emit(GetTodoListFailure(errorMsg: failure.toString())),
      (response) => emit(GetTodoListSuccess(todos: response)),
    );
  }
}
