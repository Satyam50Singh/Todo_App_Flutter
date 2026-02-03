import '../models/add_todo_response/add_todo_response_model.dart';
import '../models/get_todos_response/get_todo_response_model.dart';

abstract class TodoRemoteDatasource {
  Future<AddTodoResponseModel> addTodo(
    String userId,
    String title,
    String description,
    String dueDate,
  );

  Future<GetTodoResponseModel> getTodo(String userId);
}
