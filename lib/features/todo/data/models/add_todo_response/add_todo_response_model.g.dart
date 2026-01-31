// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_todo_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddTodoResponseModel _$AddTodoResponseModelFromJson(
  Map<String, dynamic> json,
) => _AddTodoResponseModel(
  status: (json['Status'] as num?)?.toInt(),
  message: json['Message'] as String?,
  errorMsg: json['ErrorMsg'] as String?,
);

Map<String, dynamic> _$AddTodoResponseModelToJson(
  _AddTodoResponseModel instance,
) => <String, dynamic>{
  'Status': instance.status,
  'Message': instance.message,
  'ErrorMsg': instance.errorMsg,
};
