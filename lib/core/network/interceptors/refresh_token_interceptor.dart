import 'dart:async';

import 'package:auth_app/core/network/auth_storage/token_storage.dart';
import 'package:auth_app/core/network/interceptors/interceptor.dart';
import 'package:auth_app/core/network/services/auth_refresh_service.dart';
import 'package:http/http.dart' as http;

class RefreshTokenInterceptor implements Interceptor {
  final TokenStorage tokenStorage;
  final AuthRefreshService authRefreshService;
  final http.Client client;

  Completer<void>? _refreshCompleter;

  RefreshTokenInterceptor(
    this.tokenStorage,
    this.authRefreshService,
    this.client,
  );

  @override
  Future<http.Response> onError(error) {
    throw error;
  }

  @override
  Future<http.BaseRequest> onRequest(http.BaseRequest request) async {
    return request;
  }

  @override
  Future<http.Response> onResponse(http.BaseResponse response) async {
    if (response is http.Response) {
      if (response.statusCode != 401) return response;
    }

    if (response.statusCode == 401) {
      return _handle401(response);
    }
    return response as http.Response;
  }

  Future<http.Response> _handle401(http.BaseResponse response) async {
    if (_refreshCompleter == null) {
      _refreshCompleter = Completer();

      final success = await authRefreshService.refreshToken();

      if (success) {
        _refreshCompleter?.complete();
      } else {
        _refreshCompleter?.completeError(Exception('Refresh failed'));
      }

      _refreshCompleter = null;
    } else {
      await _refreshCompleter?.future;
    }

    final request = response.request;
    if (request != null) {
      final newRequest = http.Request(request.method, request.url);
      newRequest.headers.addAll(request.headers);
      newRequest.body = request is http.Request ? request.body : '';

      final newToken = await tokenStorage.getAccessToken();
      if (newToken != null) {
        newRequest.headers['Authorization'] = 'Bearer $newToken';
      }

      final streamedResponse = await http.Client().send(newRequest);
      return http.Response.fromStream(streamedResponse);
    }

    return response as http.Response;
  }
}
