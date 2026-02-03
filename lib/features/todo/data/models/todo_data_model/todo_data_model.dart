import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo_data_model.freezed.dart';
part 'todo_data_model.g.dart';

@freezed
abstract class TodoDataModel with _$TodoDataModel{
  const factory TodoDataModel({
    @JsonKey(name: 'TodoId') int? todoId,
    @JsonKey(name: 'Title') String? todoTitle,
    @JsonKey(name: 'Description') String? description,
    @JsonKey(name: 'DueDate') String? dueDate,
    @JsonKey(name: 'RemainingDays') int? remainingDays,
  }) = _TodoDataModel;

  factory TodoDataModel.fromJson(Map<String, dynamic> json) =>
      _$TodoDataModelFromJson(json);
}
