import 'package:freezed_annotation/freezed_annotation.dart';

import '../todo_data_model/todo_data_model.dart';

part 'get_todo_response_model.freezed.dart';
part 'get_todo_response_model.g.dart';

@freezed
abstract class GetTodoResponseModel with _$GetTodoResponseModel {
  const factory GetTodoResponseModel({
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'Message') String? message,
    @JsonKey(name: 'ErrorMsg') String? errorMsg,
    @JsonKey(name: 'Data') List<TodoDataModel>? data,
  }) = _GetTodoResponseModel;

  factory GetTodoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetTodoResponseModelFromJson(json);
}
