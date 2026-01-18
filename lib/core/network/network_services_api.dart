import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:auth_app/core/network/base_api_services.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../error/exceptions.dart';

class NetworkServicesApi implements BaseApiServices {
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
      debugPrint("API URL: $url");
      debugPrint("Response StatusCode: ${response.statusCode}");
      jsonResponse = await handleResponse(response);
      debugPrint("Response Body: ${jsonResponse.toString()}");
    } on SocketException {
      throw NoInternetException();
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
  Future<dynamic> postApi(String url, var payload) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .post(
            Uri.parse(url),
            body: payload,
            headers: {
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            },
          )
          .timeout(const Duration(seconds: 30));

      debugPrint("API URL: $url && $payload");
      debugPrint(
        "Response StatusCode: ${response.statusCode} && ${response.body}",
      );
      jsonResponse = await handleResponse(response);
      debugPrint("Response Body: ${jsonResponse.toString()}");
    } on SocketException {
      throw NoInternetException();
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

    final message = decodedBody is Map && decodedBody['message'] != null
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
