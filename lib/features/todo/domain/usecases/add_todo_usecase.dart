import 'package:auth_app/core/error/exceptions.dart';
import 'package:auth_app/core/usecase/base_usecase.dart';
import 'package:auth_app/features/todo/domain/entities/add_todo_entity.dart';
import 'package:dartz/dartz.dart';

import '../repositories/todo_repository.dart';
import 'add_todo_params.dart';

class AddTodoUseCase implements BaseUseCase<AddTodoEntity, AddTodoParams> {
  final TodoRepository _todoRepository;

  AddTodoUseCase(this._todoRepository);

  @override
  Future<Either<Failure, AddTodoEntity>> call(AddTodoParams params) {
    return _todoRepository.addTodo(
      title: params.title,
      description: params.description,
      dueDate: params.dueDate,
    );
  }
}
