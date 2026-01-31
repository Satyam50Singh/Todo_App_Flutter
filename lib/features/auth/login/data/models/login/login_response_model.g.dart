// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    _LoginResponseModel(
      id: (json['id'] as num?)?.toInt() ?? -1,
      username: json['Username'] as String? ?? '',
      email: json['Email'] as String? ?? '',
      firstName: json['FirstName'] as String? ?? '',
      lastName: json['LastName'] as String? ?? '',
      gender: json['Gender'] as String? ?? '',
      image: json['Image'] as String? ?? '',
      accessToken: json['AccessToken'] as String? ?? '',
      refreshToken: json['RefreshToken'] as String? ?? '',
    );

Map<String, dynamic> _$LoginResponseModelToJson(_LoginResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'Username': instance.username,
      'Email': instance.email,
      'FirstName': instance.firstName,
      'LastName': instance.lastName,
      'Gender': instance.gender,
      'Image': instance.image,
      'AccessToken': instance.accessToken,
      'RefreshToken': instance.refreshToken,
    };
