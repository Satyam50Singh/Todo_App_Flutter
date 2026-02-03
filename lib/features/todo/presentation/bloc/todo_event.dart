part of 'todo_bloc.dart';

@immutable
sealed class TodoEvent {}

class AddTodoRequested extends TodoEvent {
  final String title;
  final String description;
  final String dueDate;

  AddTodoRequested({
    required this.title,
    required this.description,
    required this.dueDate,
  });
}

class GetTodoListRequested extends TodoEvent {
  GetTodoListRequested();
}
