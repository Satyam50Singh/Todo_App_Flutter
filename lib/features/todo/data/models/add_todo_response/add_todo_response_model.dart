import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_todo_response_model.freezed.dart';
part 'add_todo_response_model.g.dart';

@freezed
abstract class AddTodoResponseModel with _$AddTodoResponseModel {
  const factory AddTodoResponseModel({
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'Message') String? message,
    @JsonKey(name: 'ErrorMsg') String? errorMsg,
  }) = _AddTodoResponseModel;

  factory AddTodoResponseModel.fromJson(Map<String, dynamic> json) =>
      _$AddTodoResponseModelFromJson(json);
}
