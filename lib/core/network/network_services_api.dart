import 'dart:async';
import 'dart:convert';

import 'package:auth_app/core/network/base_api_services.dart';
import 'package:auth_app/core/network/network_constants.dart';
import 'package:http/http.dart' as http;

import '../error/exceptions.dart';
import 'auth_storage/token_storage.dart';
import 'intercepted_http_client.dart';

class NetworkServicesApi implements BaseApiServices {
  final TokenStorage tokenStorage;
  final InterceptedHttpClient _client;

  NetworkServicesApi(this.tokenStorage, this._client);

  @override
  Future<dynamic> getApi(String url) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .get(
            Uri.parse(url),
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          )
          .timeout(const Duration(seconds: 50));

      jsonResponse = await handleResponse(response);
    } on TimeoutException {
      throw RequestTimeout();
    } on Failure {
      rethrow;
    } catch (e) {
      throw ServerException('Unexpected server error');
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String path, var payload, String baseUrl) async {
    dynamic jsonResponse;

    String finalUrl = '$baseUrl$path';
    final url = Uri.parse(finalUrl);

    try {
      final request = http.Request('POST', url);

      request.headers.addAll({
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      });

      request.body = payload;

      final response = await _client
          .send(request)
          .timeout(const Duration(seconds: NetworkConstants.timeout));

      jsonResponse = await handleResponse(response);
    } on TimeoutException {
      throw RequestTimeout();
    } on Failure {
      rethrow;
    } catch (e) {
      throw ServerException('Unexpected server error');
    }

    return jsonResponse;
  }

  dynamic handleResponse(http.Response response) {
    final decodedBody = response.body.isNotEmpty
        ? jsonDecode(response.body)
        : null;

    var message = decodedBody is Map && decodedBody['ErrorMsg'] != null
        ? decodedBody['ErrorMsg']
        : decodedBody is Map && decodedBody['message'] != null
        ? decodedBody['message']
        : 'Something went wrong';

    switch (response.statusCode) {
      case 200:
        return decodedBody;
      case 400:
        throw BadRequestException(message);
      case 401:
        throw UnauthorizedException(message);
      case 403:
        throw ForbiddenException(message);
      case 404:
        throw NotFoundException(message);
      case 408:
        throw RequestTimeout(message);
      case 409:
        throw ConflictException(message);
      default:
        throw ServerException(message);
    }
  }
}
