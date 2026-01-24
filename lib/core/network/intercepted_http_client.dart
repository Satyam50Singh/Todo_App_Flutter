import 'package:http/http.dart' as http;

import 'interceptors/interceptor.dart';

class InterceptedHttpClient {
  final http.Client _client;
  final List<Interceptor> _interceptors;

  InterceptedHttpClient(this._client, this._interceptors);

  Future<http.Response> send(http.BaseRequest request) async {
    for (final interceptor in _interceptors) {
      request = await interceptor.onRequest(request);
    }

    try {
      final steamedResponse = await _client.send(request);
      final response = http.Response.fromStream(steamedResponse);

      http.Response interceptedResponse = await response;
      for (final interceptor in _interceptors.reversed) {
        interceptedResponse = await interceptor.onResponse(interceptedResponse);
      }
      return interceptedResponse;
    } catch (e) {
      for (final interceptor in _interceptors.reversed) {
        await interceptor.onError(e);
      }
      rethrow;
    }
  }
}
