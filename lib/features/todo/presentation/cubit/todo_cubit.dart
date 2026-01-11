import 'package:auth_app/features/todo/data/models/todo_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCubit extends Cubit<List<TodoModel>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    final todo = TodoModel(name: title, createdAt: DateTime.now().toString());
    emit([...state, todo]);
  }

  void removeTodo(int index) {
    if (state.isNotEmpty) {
      state.removeAt(index);
    }
    emit([...state]);
  }

  @override
  void onChange(Change<List<TodoModel>> change) {
    super.onChange(change);
    print('TodoCubit: $change');
  }
}
