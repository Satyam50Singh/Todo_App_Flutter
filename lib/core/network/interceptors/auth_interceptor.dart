import 'package:auth_app/core/network/interceptors/interceptor.dart';
import 'package:auth_app/core/network/token_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthInterceptor implements Interceptor {
  final TokenStorage tokenStorage;

  AuthInterceptor(this.tokenStorage);

  @override
  Future<http.Response> onError(error) async {
    if (kDebugMode) {
      debugPrint('ERROR: $error');
    }
    throw error;
  }

  @override
  Future<http.BaseRequest> onRequest(http.BaseRequest request) async {
    final token = await tokenStorage.getAccessToken();
    if (token != null && token.isNotEmpty) {
      request.headers['Authorization'] = 'Bearer $token';
    }
    if (kDebugMode) {
      debugPrint('METHOD: ${request.method} ${request.url}');
      debugPrint('Headers: ${request.headers}');
      if (request is http.Request) {
        debugPrint('Body: ${request.body}');
      } else if (request is http.MultipartRequest) {
        debugPrint('Fields: ${request.fields}');
        debugPrint('Files: ${request.files.map((f) => f.filename)}');
      } else {
        debugPrint('Body: <not available for ${request.runtimeType}>');
      }
    }
    return request;
  }

  @override
  Future<http.Response> onResponse(http.BaseResponse response) async {
    if (response is http.Response) {
      if (kDebugMode) {
        debugPrint('STATUS CODE: ${response.statusCode}');
        debugPrint('Body: ${response.body}');
      }
      return response;
    }

    if (response is http.StreamedResponse) {
      final body = await response.stream.bytesToString();

      final convertedResponse = http.Response(
        body,
        response.statusCode,
        headers: response.headers,
        request: response.request,
        reasonPhrase: response.reasonPhrase,
      );

      if (kDebugMode) {
        debugPrint('STATUS: ${convertedResponse.statusCode}');
        debugPrint('BODY: ${convertedResponse.body}');
      }

      return convertedResponse;
    }

    throw Exception('Unsupported response type: ${response.runtimeType}');
  }
}
