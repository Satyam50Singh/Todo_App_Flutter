import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_model.freezed.dart';
part 'login_response_model.g.dart';

@freezed
abstract class LoginResponseModel with _$LoginResponseModel {
  const factory LoginResponseModel({
    @JsonKey(name: 'id') @Default(-1) int id,
    @JsonKey(name: 'username') @Default('') String username,
    @JsonKey(name: 'email') @Default('') String email,
    @JsonKey(name: 'firstName') @Default('') String firstName,
    @JsonKey(name: 'lastName') @Default('') String lastName,
    @JsonKey(name: 'gender') @Default('') String gender,
    @JsonKey(name: 'image') @Default('') String image,
    @JsonKey(name: 'accessToken') @Default('') String accessToken,
    @JsonKey(name: 'refreshToken') @Default('') String refreshToken,
  }) = _LoginResponseModel;

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
