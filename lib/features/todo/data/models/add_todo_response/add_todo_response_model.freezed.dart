// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_todo_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AddTodoResponseModel {

@JsonKey(name: 'status') int? get status;@JsonKey(name: 'message') String? get message;@JsonKey(name: 'errorMsg') String? get errorMsg;
/// Create a copy of AddTodoResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddTodoResponseModelCopyWith<AddTodoResponseModel> get copyWith => _$AddTodoResponseModelCopyWithImpl<AddTodoResponseModel>(this as AddTodoResponseModel, _$identity);

  /// Serializes this AddTodoResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AddTodoResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,errorMsg);

@override
String toString() {
  return 'AddTodoResponseModel(status: $status, message: $message, errorMsg: $errorMsg)';
}


}

/// @nodoc
abstract mixin class $AddTodoResponseModelCopyWith<$Res>  {
  factory $AddTodoResponseModelCopyWith(AddTodoResponseModel value, $Res Function(AddTodoResponseModel) _then) = _$AddTodoResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'status') int? status,@JsonKey(name: 'message') String? message,@JsonKey(name: 'errorMsg') String? errorMsg
});




}
/// @nodoc
class _$AddTodoResponseModelCopyWithImpl<$Res>
    implements $AddTodoResponseModelCopyWith<$Res> {
  _$AddTodoResponseModelCopyWithImpl(this._self, this._then);

  final AddTodoResponseModel _self;
  final $Res Function(AddTodoResponseModel) _then;

/// Create a copy of AddTodoResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? errorMsg = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorMsg: freezed == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AddTodoResponseModel].
extension AddTodoResponseModelPatterns on AddTodoResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AddTodoResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AddTodoResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AddTodoResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _AddTodoResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AddTodoResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _AddTodoResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'status')  int? status, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'errorMsg')  String? errorMsg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AddTodoResponseModel() when $default != null:
return $default(_that.status,_that.message,_that.errorMsg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'status')  int? status, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'errorMsg')  String? errorMsg)  $default,) {final _that = this;
switch (_that) {
case _AddTodoResponseModel():
return $default(_that.status,_that.message,_that.errorMsg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'status')  int? status, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'errorMsg')  String? errorMsg)?  $default,) {final _that = this;
switch (_that) {
case _AddTodoResponseModel() when $default != null:
return $default(_that.status,_that.message,_that.errorMsg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AddTodoResponseModel implements AddTodoResponseModel {
  const _AddTodoResponseModel({@JsonKey(name: 'status') this.status, @JsonKey(name: 'message') this.message, @JsonKey(name: 'errorMsg') this.errorMsg});
  factory _AddTodoResponseModel.fromJson(Map<String, dynamic> json) => _$AddTodoResponseModelFromJson(json);

@override@JsonKey(name: 'status') final  int? status;
@override@JsonKey(name: 'message') final  String? message;
@override@JsonKey(name: 'errorMsg') final  String? errorMsg;

/// Create a copy of AddTodoResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AddTodoResponseModelCopyWith<_AddTodoResponseModel> get copyWith => __$AddTodoResponseModelCopyWithImpl<_AddTodoResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AddTodoResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AddTodoResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,errorMsg);

@override
String toString() {
  return 'AddTodoResponseModel(status: $status, message: $message, errorMsg: $errorMsg)';
}


}

/// @nodoc
abstract mixin class _$AddTodoResponseModelCopyWith<$Res> implements $AddTodoResponseModelCopyWith<$Res> {
  factory _$AddTodoResponseModelCopyWith(_AddTodoResponseModel value, $Res Function(_AddTodoResponseModel) _then) = __$AddTodoResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'status') int? status,@JsonKey(name: 'message') String? message,@JsonKey(name: 'errorMsg') String? errorMsg
});




}
/// @nodoc
class __$AddTodoResponseModelCopyWithImpl<$Res>
    implements _$AddTodoResponseModelCopyWith<$Res> {
  __$AddTodoResponseModelCopyWithImpl(this._self, this._then);

  final _AddTodoResponseModel _self;
  final $Res Function(_AddTodoResponseModel) _then;

/// Create a copy of AddTodoResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? errorMsg = freezed,}) {
  return _then(_AddTodoResponseModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorMsg: freezed == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
