import 'package:auth_app/core/base/base_repository.dart';
import 'package:auth_app/core/error/exceptions.dart';
import 'package:auth_app/features/todo/data/datasources/todo_remote_datasource.dart';
import 'package:auth_app/features/todo/data/models/add_todo_response/add_todo_response_model.dart';
import 'package:auth_app/features/todo/domain/entities/add_todo_entity.dart';
import 'package:auth_app/features/todo/domain/repositories/todo_repository.dart';
import 'package:dartz/dartz.dart';

class TodoRepositoryImpl extends BaseRepository implements TodoRepository {
  final TodoRemoteDatasource _datasource;

  TodoRepositoryImpl(this._datasource);

  @override
  Future<Either<Failure, AddTodoEntity>> addTodo({
    required String userId,
    required String title,
    required String description,
    required String dueDate,
  }) {
    return execute(() async {
      final AddTodoResponseModel responseModel = await _datasource.addTodo(
        userId,
        title,
        description,
        dueDate,
      );
      return AddTodoEntity(
        status: responseModel.status ?? 0,
        message: responseModel.message ?? '',
      );
    });
  }
}
