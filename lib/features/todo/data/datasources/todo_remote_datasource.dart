import 'package:auth_app/features/todo/data/models/add_todo_response/add_todo_response_model.dart';

abstract class TodoRemoteDatasource {
  Future<AddTodoResponseModel> addTodo(
    String userId,
    String title,
    String description,
    String dueDate,
  );
}
