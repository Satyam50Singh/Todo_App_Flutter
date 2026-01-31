import 'package:auth_app/features/auth/login/data/models/login/login_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_api_response.freezed.dart';
part 'login_api_response.g.dart';

@freezed
abstract class LoginApiResponse with _$LoginApiResponse {
  const factory LoginApiResponse({
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'data') LoginResponseModel? data,
    @JsonKey(name: 'errorMsg') String? errorMsg,
  }) = _LoginApiResponse;

  factory LoginApiResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginApiResponseFromJson(json);
}
