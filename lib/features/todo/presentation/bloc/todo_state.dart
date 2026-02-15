part of 'todo_bloc.dart';

@immutable
sealed class TodoState {}

final class TodoInitial extends TodoState {}

final class TodoLoading extends TodoState {
  final String message;

  TodoLoading(this.message);
}

final class AddTodoSuccess extends TodoState {
  final String? message;

  AddTodoSuccess({required this.message});
}

final class AddTodoFailure extends TodoState {
  final String? errorMsg;

  AddTodoFailure({required this.errorMsg});
}

final class GetTodoListSuccess extends TodoState {
  final List<TodoEntity> todos;

  GetTodoListSuccess({required this.todos});
}

final class GetTodoListFailure extends TodoState {
  final String? errorMsg;

  GetTodoListFailure({required this.errorMsg});
}

final class DeleteTodoSuccess extends TodoState {
  final String message;

  DeleteTodoSuccess({required this.message});
}

final class DeleteTodoFailure extends TodoState {
  final String? errorMsg;

  DeleteTodoFailure({required this.errorMsg});
}
