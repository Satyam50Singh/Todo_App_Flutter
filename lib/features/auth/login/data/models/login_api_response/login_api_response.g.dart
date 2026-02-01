// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginApiResponse _$LoginApiResponseFromJson(Map<String, dynamic> json) =>
    _LoginApiResponse(
      status: (json['Status'] as num?)?.toInt(),
      message: json['Message'] as String?,
      data: json['Data'] == null
          ? null
          : LoginResponseModel.fromJson(json['Data'] as Map<String, dynamic>),
      errorMsg: json['ErrorMsg'] as String?,
    );

Map<String, dynamic> _$LoginApiResponseToJson(_LoginApiResponse instance) =>
    <String, dynamic>{
      'Status': instance.status,
      'Message': instance.message,
      'Data': instance.data,
      'ErrorMsg': instance.errorMsg,
    };
