// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_todo_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddTodoResponseModel _$AddTodoResponseModelFromJson(
  Map<String, dynamic> json,
) => _AddTodoResponseModel(
  status: (json['status'] as num?)?.toInt(),
  message: json['message'] as String?,
);

Map<String, dynamic> _$AddTodoResponseModelToJson(
  _AddTodoResponseModel instance,
) => <String, dynamic>{'status': instance.status, 'message': instance.message};
