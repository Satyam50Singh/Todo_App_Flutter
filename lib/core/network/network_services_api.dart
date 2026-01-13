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
    } catch (e) {
      throw ServerException();
    }

    return jsonResponse;
  }

  @override
  Future<dynamic> postApi(String url, var payload) async {
    dynamic jsonResponse;
    try {
      final response = await http
          .post(Uri.parse(url), body: payload)
          .timeout(const Duration(seconds: 50));

      jsonResponse = await handleResponse(response);
    } on SocketException {
      throw NoInternetException();
    } on TimeoutException {
      throw RequestTimeout();
    } catch (e) {
      throw ServerException();
    }

    return jsonResponse;
  }

  dynamic handleResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic jsonResponse = jsonDecode(response.body);
        return jsonResponse;
      case 400:
        throw BadRequestException();
      case 401:
        throw UnauthorizedException();
      case 403:
        throw ForbiddenException();
      case 404:
        throw NotFoundException();
      case 408:
        throw RequestTimeout();
      case 409:
        throw ConflictException();
      default:
        throw ServerException();
    }
  }
}
