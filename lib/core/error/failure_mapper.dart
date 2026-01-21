import 'exceptions.dart';

class FailureMapper {
  static Failure map(dynamic exception) {
    if (exception is NoInternetException) {
      return NoInternetException(exception.errorMessage);
    }

    if (exception is UnauthorizedException) {
      return UnauthorizedException(exception.errorMessage);
    }

    if (exception is BadRequestException) {
      return BadRequestException(exception.errorMessage);
    }

    if (exception is ForbiddenException) {
      return ForbiddenException(exception.errorMessage);
    }

    if (exception is NotFoundException) {
      return NotFoundException(exception.errorMessage);
    }

    if (exception is RequestTimeout) {
      return RequestTimeout(exception.errorMessage);
    }

    if (exception is CacheException) {
      return CacheException(exception.errorMessage);
    }

    if (exception is ConflictException) {
      return ConflictException(exception.errorMessage);
    }

    if (exception is ServerException) {
      return ServerException(exception.errorMessage);
    }

    if (exception is Failure) {
      return exception;
    }

    return ServerException('Unexpected error occurred');
  }
}
