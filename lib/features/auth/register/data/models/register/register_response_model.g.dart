// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RegisterResponseModel _$RegisterResponseModelFromJson(
  Map<String, dynamic> json,
) => _RegisterResponseModel(
  status: (json['status'] as num?)?.toInt(),
  message: json['message'] as String?,
  errorMsg: json['errorMsg'] as String?,
  loginMessage: json['loginMessage'] as String?,
);

Map<String, dynamic> _$RegisterResponseModelToJson(
  _RegisterResponseModel instance,
) => <String, dynamic>{
  'status': instance.status,
  'message': instance.message,
  'errorMsg': instance.errorMsg,
  'loginMessage': instance.loginMessage,
};
