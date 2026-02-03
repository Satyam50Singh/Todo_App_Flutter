import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_data_model.g.dart';
part 'register_data_model.freezed.dart';

@freezed
abstract class RegisterDataModel with _$RegisterDataModel {
  const factory RegisterDataModel({
    @JsonKey(name: 'LoginMessage') String? loginMessage,
  }) = _RegisterDataModel;

  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterDataModelFromJson(json);
}
