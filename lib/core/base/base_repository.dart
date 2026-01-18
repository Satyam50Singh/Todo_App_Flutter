import 'package:auth_app/core/error/exceptions.dart';
import 'package:dartz/dartz.dart';

import '../error/failure_mapper.dart';

abstract class BaseRepository {
  Future<Either<Failure, T>> execute<T>(
      Future<T> Function() action,
      ) async {
    try {
      final result = await action();
      return Right(result);
    } catch (e) {
      return Left(FailureMapper.map(e));
    }
  }
}