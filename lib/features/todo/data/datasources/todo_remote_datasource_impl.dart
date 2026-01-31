import 'dart:convert';

import 'package:auth_app/core/network/base_api_services.dart';
import 'package:auth_app/core/network/network_constants.dart';
import 'package:auth_app/features/todo/data/datasources/todo_remote_datasource.dart';
import 'package:auth_app/features/todo/data/models/add_todo_response/add_todo_response_model.dart';

import '../../../../core/utils/constants.dart';

class TodoRemoteDatasourceImpl implements TodoRemoteDatasource {
  final BaseApiServices _apiServices;

  TodoRemoteDatasourceImpl(this._apiServices);

  @override
  Future<AddTodoResponseModel> addTodo(
    String userId,
    String title,
    String description,
    String dueDate,
  ) async {
    final response = await _apiServices.postApi(
      NetworkConstants.addTodo,
      jsonEncode({
        Constants.userId: userId,
        Constants.title: title,
        Constants.description: description,
        Constants.dueDate: dueDate,
      }),
      NetworkConstants.baseTodoWebApiUrl,
    );

    return AddTodoResponseModel.fromJson(response);
  }
}
