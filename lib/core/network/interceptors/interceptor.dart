import 'package:http/http.dart' as http;

abstract class Interceptor {
  Future<http.BaseRequest> onRequest(http.BaseRequest request);

  Future<http.Response> onResponse(http.BaseResponse response);

  Future<http.Response> onError(dynamic error);
}
