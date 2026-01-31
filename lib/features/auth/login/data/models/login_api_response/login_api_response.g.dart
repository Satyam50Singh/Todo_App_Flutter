// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_api_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginApiResponse _$LoginApiResponseFromJson(Map<String, dynamic> json) =>
    _LoginApiResponse(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : LoginResponseModel.fromJson(json['data'] as Map<String, dynamic>),
      errorMsg: json['errorMsg'] as String?,
    );

Map<String, dynamic> _$LoginApiResponseToJson(_LoginApiResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data,
      'errorMsg': instance.errorMsg,
    };
