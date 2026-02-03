// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'todo_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TodoDataModel {

@JsonKey(name: 'TodoId') int? get todoId;@JsonKey(name: 'Title') String? get todoTitle;@JsonKey(name: 'Description') String? get description;@JsonKey(name: 'DueDate') String? get dueDate;@JsonKey(name: 'RemainingDays') int? get remainingDays;
/// Create a copy of TodoDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TodoDataModelCopyWith<TodoDataModel> get copyWith => _$TodoDataModelCopyWithImpl<TodoDataModel>(this as TodoDataModel, _$identity);

  /// Serializes this TodoDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TodoDataModel&&(identical(other.todoId, todoId) || other.todoId == todoId)&&(identical(other.todoTitle, todoTitle) || other.todoTitle == todoTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.remainingDays, remainingDays) || other.remainingDays == remainingDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,todoId,todoTitle,description,dueDate,remainingDays);

@override
String toString() {
  return 'TodoDataModel(todoId: $todoId, todoTitle: $todoTitle, description: $description, dueDate: $dueDate, remainingDays: $remainingDays)';
}


}

/// @nodoc
abstract mixin class $TodoDataModelCopyWith<$Res>  {
  factory $TodoDataModelCopyWith(TodoDataModel value, $Res Function(TodoDataModel) _then) = _$TodoDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'TodoId') int? todoId,@JsonKey(name: 'Title') String? todoTitle,@JsonKey(name: 'Description') String? description,@JsonKey(name: 'DueDate') String? dueDate,@JsonKey(name: 'RemainingDays') int? remainingDays
});




}
/// @nodoc
class _$TodoDataModelCopyWithImpl<$Res>
    implements $TodoDataModelCopyWith<$Res> {
  _$TodoDataModelCopyWithImpl(this._self, this._then);

  final TodoDataModel _self;
  final $Res Function(TodoDataModel) _then;

/// Create a copy of TodoDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? todoId = freezed,Object? todoTitle = freezed,Object? description = freezed,Object? dueDate = freezed,Object? remainingDays = freezed,}) {
  return _then(_self.copyWith(
todoId: freezed == todoId ? _self.todoId : todoId // ignore: cast_nullable_to_non_nullable
as int?,todoTitle: freezed == todoTitle ? _self.todoTitle : todoTitle // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,remainingDays: freezed == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TodoDataModel].
extension TodoDataModelPatterns on TodoDataModel {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TodoDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TodoDataModel() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TodoDataModel value)  $default,){
final _that = this;
switch (_that) {
case _TodoDataModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TodoDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _TodoDataModel() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'TodoId')  int? todoId, @JsonKey(name: 'Title')  String? todoTitle, @JsonKey(name: 'Description')  String? description, @JsonKey(name: 'DueDate')  String? dueDate, @JsonKey(name: 'RemainingDays')  int? remainingDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TodoDataModel() when $default != null:
return $default(_that.todoId,_that.todoTitle,_that.description,_that.dueDate,_that.remainingDays);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'TodoId')  int? todoId, @JsonKey(name: 'Title')  String? todoTitle, @JsonKey(name: 'Description')  String? description, @JsonKey(name: 'DueDate')  String? dueDate, @JsonKey(name: 'RemainingDays')  int? remainingDays)  $default,) {final _that = this;
switch (_that) {
case _TodoDataModel():
return $default(_that.todoId,_that.todoTitle,_that.description,_that.dueDate,_that.remainingDays);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'TodoId')  int? todoId, @JsonKey(name: 'Title')  String? todoTitle, @JsonKey(name: 'Description')  String? description, @JsonKey(name: 'DueDate')  String? dueDate, @JsonKey(name: 'RemainingDays')  int? remainingDays)?  $default,) {final _that = this;
switch (_that) {
case _TodoDataModel() when $default != null:
return $default(_that.todoId,_that.todoTitle,_that.description,_that.dueDate,_that.remainingDays);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TodoDataModel implements TodoDataModel {
  const _TodoDataModel({@JsonKey(name: 'TodoId') this.todoId, @JsonKey(name: 'Title') this.todoTitle, @JsonKey(name: 'Description') this.description, @JsonKey(name: 'DueDate') this.dueDate, @JsonKey(name: 'RemainingDays') this.remainingDays});
  factory _TodoDataModel.fromJson(Map<String, dynamic> json) => _$TodoDataModelFromJson(json);

@override@JsonKey(name: 'TodoId') final  int? todoId;
@override@JsonKey(name: 'Title') final  String? todoTitle;
@override@JsonKey(name: 'Description') final  String? description;
@override@JsonKey(name: 'DueDate') final  String? dueDate;
@override@JsonKey(name: 'RemainingDays') final  int? remainingDays;

/// Create a copy of TodoDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TodoDataModelCopyWith<_TodoDataModel> get copyWith => __$TodoDataModelCopyWithImpl<_TodoDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TodoDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TodoDataModel&&(identical(other.todoId, todoId) || other.todoId == todoId)&&(identical(other.todoTitle, todoTitle) || other.todoTitle == todoTitle)&&(identical(other.description, description) || other.description == description)&&(identical(other.dueDate, dueDate) || other.dueDate == dueDate)&&(identical(other.remainingDays, remainingDays) || other.remainingDays == remainingDays));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,todoId,todoTitle,description,dueDate,remainingDays);

@override
String toString() {
  return 'TodoDataModel(todoId: $todoId, todoTitle: $todoTitle, description: $description, dueDate: $dueDate, remainingDays: $remainingDays)';
}


}

/// @nodoc
abstract mixin class _$TodoDataModelCopyWith<$Res> implements $TodoDataModelCopyWith<$Res> {
  factory _$TodoDataModelCopyWith(_TodoDataModel value, $Res Function(_TodoDataModel) _then) = __$TodoDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'TodoId') int? todoId,@JsonKey(name: 'Title') String? todoTitle,@JsonKey(name: 'Description') String? description,@JsonKey(name: 'DueDate') String? dueDate,@JsonKey(name: 'RemainingDays') int? remainingDays
});




}
/// @nodoc
class __$TodoDataModelCopyWithImpl<$Res>
    implements _$TodoDataModelCopyWith<$Res> {
  __$TodoDataModelCopyWithImpl(this._self, this._then);

  final _TodoDataModel _self;
  final $Res Function(_TodoDataModel) _then;

/// Create a copy of TodoDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? todoId = freezed,Object? todoTitle = freezed,Object? description = freezed,Object? dueDate = freezed,Object? remainingDays = freezed,}) {
  return _then(_TodoDataModel(
todoId: freezed == todoId ? _self.todoId : todoId // ignore: cast_nullable_to_non_nullable
as int?,todoTitle: freezed == todoTitle ? _self.todoTitle : todoTitle // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,dueDate: freezed == dueDate ? _self.dueDate : dueDate // ignore: cast_nullable_to_non_nullable
as String?,remainingDays: freezed == remainingDays ? _self.remainingDays : remainingDays // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
