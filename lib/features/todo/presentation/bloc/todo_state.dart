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
