import 'package:auth_app/core/error/exceptions.dart';
import 'package:auth_app/features/todo/domain/entities/add_todo_entity.dart';
import 'package:dartz/dartz.dart';

abstract class TodoRepository {
  Future<Either<Failure, AddTodoEntity>> addTodo({
    required String userId,
    required String title,
    required String description,
    required String dueDate,
  });
}
