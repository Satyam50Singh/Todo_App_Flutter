import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    @JsonKey(name: 'id') @Default(-1) int id,
    @JsonKey(name: 'Username') @Default('') String username,
    @JsonKey(name: 'Email') @Default('') String email,
    @JsonKey(name: 'FirstName') @Default('') String firstName,
    @JsonKey(name: 'LastName') @Default('') String lastName,
    @JsonKey(name: 'Gender') @Default('') String gender,
    @JsonKey(name: 'Image') @Default('') String image,
    @JsonKey(name: 'AccessToken') @Default('') String accessToken,
    @JsonKey(name: 'RefreshToken') @Default('') String refreshToken,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
