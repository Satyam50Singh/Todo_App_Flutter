import 'package:auth_app/features/auth/login/data/models/login/login_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_api_response.freezed.dart';
part 'login_api_response.g.dart';

@freezed
abstract class LoginApiResponse with _$LoginApiResponse {
  const factory LoginApiResponse({
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'Message') String? message,
    @JsonKey(name: 'Data') LoginResponseModel? data,
    @JsonKey(name: 'ErrorMsg') String? errorMsg,
  }) = _LoginApiResponse;

  factory LoginApiResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginApiResponseFromJson(json);
}
