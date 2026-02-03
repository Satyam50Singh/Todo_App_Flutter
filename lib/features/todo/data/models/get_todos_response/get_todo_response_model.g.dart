// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_todo_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GetTodoResponseModel _$GetTodoResponseModelFromJson(
  Map<String, dynamic> json,
) => _GetTodoResponseModel(
  status: (json['Status'] as num?)?.toInt(),
  message: json['Message'] as String?,
  errorMsg: json['ErrorMsg'] as String?,
  data: (json['Data'] as List<dynamic>?)
      ?.map((e) => TodoDataModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$GetTodoResponseModelToJson(
  _GetTodoResponseModel instance,
) => <String, dynamic>{
  'Status': instance.status,
  'Message': instance.message,
  'ErrorMsg': instance.errorMsg,
  'Data': instance.data,
};
