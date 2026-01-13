abstract class Failure implements Exception {
  final String errorMessage;

  const Failure(this.errorMessage);

  @override
  String toString() => errorMessage;
}

class NoInternetException extends Failure {
  NoInternetException([String errorMessage = 'No internet connection'])
    : super(errorMessage);
}

class BadRequestException extends Failure {
  BadRequestException([String errorMessage = 'Bad request'])
    : super(errorMessage);
}

class ConflictException extends Failure {
  ConflictException([String errorMessage = 'Conflict']) : super(errorMessage);
}

class CacheException extends Failure {
  CacheException([String errorMessage = 'Cache error']) : super(errorMessage);
}

class UnauthorizedException extends Failure {
  UnauthorizedException([String errorMessage = 'Unauthorized'])
    : super(errorMessage);
}

class NotFoundException extends Failure {
  NotFoundException([String errorMessage = 'Not found']) : super(errorMessage);
}

class ServerException extends Failure {
  ServerException([String errorMessage = 'Server error']) : super(errorMessage);
}

class RequestTimeout extends Failure {
  RequestTimeout([String errorMessage = 'Request timeout']) : super(errorMessage);
}