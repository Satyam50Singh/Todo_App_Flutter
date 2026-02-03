import 'package:auth_app/core/error/exceptions.dart';
import 'package:auth_app/core/usecase/base_usecase.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecase/params.dart';
import '../entities/todo_entity.dart';
import '../repositories/todo_repository.dart';

class GetTodoUseCase implements BaseUseCase<List<TodoEntity>, NoParams> {
  final TodoRepository _todoRepository;

  GetTodoUseCase(this._todoRepository);

  @override
  Future<Either<Failure, List<TodoEntity>>> call(NoParams params) {
    return _todoRepository.getTodo();
  }
}
