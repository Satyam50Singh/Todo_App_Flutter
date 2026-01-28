// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterResponseModel {

@JsonKey(name: 'status') int? get status;@JsonKey(name: 'message') String? get message;@JsonKey(name: 'errorMsg') String? get errorMsg;@JsonKey(name: 'loginMessage') String? get loginMessage;
/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterResponseModelCopyWith<RegisterResponseModel> get copyWith => _$RegisterResponseModelCopyWithImpl<RegisterResponseModel>(this as RegisterResponseModel, _$identity);

  /// Serializes this RegisterResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg)&&(identical(other.loginMessage, loginMessage) || other.loginMessage == loginMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,errorMsg,loginMessage);

@override
String toString() {
  return 'RegisterResponseModel(status: $status, message: $message, errorMsg: $errorMsg, loginMessage: $loginMessage)';
}


}

/// @nodoc
abstract mixin class $RegisterResponseModelCopyWith<$Res>  {
  factory $RegisterResponseModelCopyWith(RegisterResponseModel value, $Res Function(RegisterResponseModel) _then) = _$RegisterResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'status') int? status,@JsonKey(name: 'message') String? message,@JsonKey(name: 'errorMsg') String? errorMsg,@JsonKey(name: 'loginMessage') String? loginMessage
});




}
/// @nodoc
class _$RegisterResponseModelCopyWithImpl<$Res>
    implements $RegisterResponseModelCopyWith<$Res> {
  _$RegisterResponseModelCopyWithImpl(this._self, this._then);

  final RegisterResponseModel _self;
  final $Res Function(RegisterResponseModel) _then;

/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? errorMsg = freezed,Object? loginMessage = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorMsg: freezed == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String?,loginMessage: freezed == loginMessage ? _self.loginMessage : loginMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterResponseModel].
extension RegisterResponseModelPatterns on RegisterResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _RegisterResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'status')  int? status, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'errorMsg')  String? errorMsg, @JsonKey(name: 'loginMessage')  String? loginMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterResponseModel() when $default != null:
return $default(_that.status,_that.message,_that.errorMsg,_that.loginMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'status')  int? status, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'errorMsg')  String? errorMsg, @JsonKey(name: 'loginMessage')  String? loginMessage)  $default,) {final _that = this;
switch (_that) {
case _RegisterResponseModel():
return $default(_that.status,_that.message,_that.errorMsg,_that.loginMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'status')  int? status, @JsonKey(name: 'message')  String? message, @JsonKey(name: 'errorMsg')  String? errorMsg, @JsonKey(name: 'loginMessage')  String? loginMessage)?  $default,) {final _that = this;
switch (_that) {
case _RegisterResponseModel() when $default != null:
return $default(_that.status,_that.message,_that.errorMsg,_that.loginMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterResponseModel implements RegisterResponseModel {
  const _RegisterResponseModel({@JsonKey(name: 'status') this.status, @JsonKey(name: 'message') this.message, @JsonKey(name: 'errorMsg') this.errorMsg, @JsonKey(name: 'loginMessage') this.loginMessage});
  factory _RegisterResponseModel.fromJson(Map<String, dynamic> json) => _$RegisterResponseModelFromJson(json);

@override@JsonKey(name: 'status') final  int? status;
@override@JsonKey(name: 'message') final  String? message;
@override@JsonKey(name: 'errorMsg') final  String? errorMsg;
@override@JsonKey(name: 'loginMessage') final  String? loginMessage;

/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterResponseModelCopyWith<_RegisterResponseModel> get copyWith => __$RegisterResponseModelCopyWithImpl<_RegisterResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg)&&(identical(other.loginMessage, loginMessage) || other.loginMessage == loginMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,errorMsg,loginMessage);

@override
String toString() {
  return 'RegisterResponseModel(status: $status, message: $message, errorMsg: $errorMsg, loginMessage: $loginMessage)';
}


}

/// @nodoc
abstract mixin class _$RegisterResponseModelCopyWith<$Res> implements $RegisterResponseModelCopyWith<$Res> {
  factory _$RegisterResponseModelCopyWith(_RegisterResponseModel value, $Res Function(_RegisterResponseModel) _then) = __$RegisterResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'status') int? status,@JsonKey(name: 'message') String? message,@JsonKey(name: 'errorMsg') String? errorMsg,@JsonKey(name: 'loginMessage') String? loginMessage
});




}
/// @nodoc
class __$RegisterResponseModelCopyWithImpl<$Res>
    implements _$RegisterResponseModelCopyWith<$Res> {
  __$RegisterResponseModelCopyWithImpl(this._self, this._then);

  final _RegisterResponseModel _self;
  final $Res Function(_RegisterResponseModel) _then;

/// Create a copy of RegisterResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? errorMsg = freezed,Object? loginMessage = freezed,}) {
  return _then(_RegisterResponseModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorMsg: freezed == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String?,loginMessage: freezed == loginMessage ? _self.loginMessage : loginMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
