// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TodoDataModel _$TodoDataModelFromJson(Map<String, dynamic> json) =>
    _TodoDataModel(
      todoId: (json['TodoId'] as num?)?.toInt(),
      todoTitle: json['Title'] as String?,
      description: json['Description'] as String?,
      dueDate: json['DueDate'] as String?,
      remainingDays: (json['RemainingDays'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TodoDataModelToJson(_TodoDataModel instance) =>
    <String, dynamic>{
      'TodoId': instance.todoId,
      'Title': instance.todoTitle,
      'Description': instance.description,
      'DueDate': instance.dueDate,
      'RemainingDays': instance.remainingDays,
    };
