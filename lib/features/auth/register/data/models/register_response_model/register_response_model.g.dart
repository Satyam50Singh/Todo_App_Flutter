// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterResponseModel _$RegisterResponseModelFromJson(
  Map<String, dynamic> json,
) => _RegisterResponseModel(
  status: (json['Status'] as num?)?.toInt(),
  message: json['Message'] as String?,
  errorMsg: json['ErrorMsg'] as String?,
  data: json['Data'] == null
      ? null
      : RegisterDataModel.fromJson(json['Data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RegisterResponseModelToJson(
  _RegisterResponseModel instance,
) => <String, dynamic>{
  'Status': instance.status,
  'Message': instance.message,
  'ErrorMsg': instance.errorMsg,
  'Data': instance.data,
};
