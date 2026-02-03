part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class AddTodoLoading extends TodoState {
  final String message;

  AddTodoLoading(this.message);
}

final class AddTodoSuccess extends TodoState {
  final String? message;

  AddTodoSuccess({required this.message});
}

final class AddTodoFailure extends TodoState {
  final String? errorMsg;

  AddTodoFailure({required this.errorMsg});
}

final class GetTodoListLoading extends TodoState {
  final String message;

  GetTodoListLoading(this.message);
}

final class GetTodoListSuccess extends TodoState {
  final List<TodoEntity> todos;

  GetTodoListSuccess({required this.todos});
}

final class GetTodoListFailure extends TodoState {
  final String? errorMsg;

  GetTodoListFailure({required this.errorMsg});
}
