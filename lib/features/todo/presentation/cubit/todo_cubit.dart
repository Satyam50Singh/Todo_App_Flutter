import 'package:auth_app/features/todo/data/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String title, String description, String dueDate) {
    final todo = TodoModel(
      name: title,
      description: description,
      dueDate: dueDate,
      createdAt: DateTime.now().toString(),
    );
    emit([...state, todo]);
  }

  void removeTodo(int index) {
    if (state.isNotEmpty) {
      state.removeAt(index);
    }
    emit([...state]);
  }
}
