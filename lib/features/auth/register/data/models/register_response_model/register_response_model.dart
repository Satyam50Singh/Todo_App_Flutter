import 'package:freezed_annotation/freezed_annotation.dart';

import '../register_data_model/register_data_model.dart';

part 'register_response_model.freezed.dart';
part 'register_response_model.g.dart';

@freezed
abstract class RegisterResponseModel with _$RegisterResponseModel {
  const factory RegisterResponseModel({
    @JsonKey(name: 'Status') int? status,
    @JsonKey(name: 'Message') String? message,
    @JsonKey(name: 'ErrorMsg') String? errorMsg,
    @JsonKey(name: 'Data') RegisterDataModel? data,
  }) = _RegisterResponseModel;

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
}
