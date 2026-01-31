import 'package:auth_app/features/todo/domain/usecases/add_todo_usecase.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/add_todo_params.dart';

part 'todo_event.dart';
part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final AddTodoUseCase _addTodoUseCase;

  TodoBloc(this._addTodoUseCase) : super(TodoInitial()) {
    on<AddTodoRequested>(_onAddTodoRequested);
  }

  void _onAddTodoRequested(
    AddTodoRequested event,
    Emitter<TodoState> emit,
  ) async {
    print('Add Todo Requested');
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

    // if (dueDate.isEmpty) {
    //   return 'Due date cannot be empty';
    // }
    return null;
  }
}
