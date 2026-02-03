// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegisterDataModel {

@JsonKey(name: 'LoginMessage') String? get loginMessage;
/// Create a copy of RegisterDataModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegisterDataModelCopyWith<RegisterDataModel> get copyWith => _$RegisterDataModelCopyWithImpl<RegisterDataModel>(this as RegisterDataModel, _$identity);

  /// Serializes this RegisterDataModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegisterDataModel&&(identical(other.loginMessage, loginMessage) || other.loginMessage == loginMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,loginMessage);

@override
String toString() {
  return 'RegisterDataModel(loginMessage: $loginMessage)';
}


}

/// @nodoc
abstract mixin class $RegisterDataModelCopyWith<$Res>  {
  factory $RegisterDataModelCopyWith(RegisterDataModel value, $Res Function(RegisterDataModel) _then) = _$RegisterDataModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'LoginMessage') String? loginMessage
});




}
/// @nodoc
class _$RegisterDataModelCopyWithImpl<$Res>
    implements $RegisterDataModelCopyWith<$Res> {
  _$RegisterDataModelCopyWithImpl(this._self, this._then);

  final RegisterDataModel _self;
  final $Res Function(RegisterDataModel) _then;

/// Create a copy of RegisterDataModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loginMessage = freezed,}) {
  return _then(_self.copyWith(
loginMessage: freezed == loginMessage ? _self.loginMessage : loginMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegisterDataModel].
extension RegisterDataModelPatterns on RegisterDataModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegisterDataModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegisterDataModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegisterDataModel value)  $default,){
final _that = this;
switch (_that) {
case _RegisterDataModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegisterDataModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegisterDataModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'LoginMessage')  String? loginMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegisterDataModel() when $default != null:
return $default(_that.loginMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'LoginMessage')  String? loginMessage)  $default,) {final _that = this;
switch (_that) {
case _RegisterDataModel():
return $default(_that.loginMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'LoginMessage')  String? loginMessage)?  $default,) {final _that = this;
switch (_that) {
case _RegisterDataModel() when $default != null:
return $default(_that.loginMessage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegisterDataModel implements RegisterDataModel {
  const _RegisterDataModel({@JsonKey(name: 'LoginMessage') this.loginMessage});
  factory _RegisterDataModel.fromJson(Map<String, dynamic> json) => _$RegisterDataModelFromJson(json);

@override@JsonKey(name: 'LoginMessage') final  String? loginMessage;

/// Create a copy of RegisterDataModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegisterDataModelCopyWith<_RegisterDataModel> get copyWith => __$RegisterDataModelCopyWithImpl<_RegisterDataModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegisterDataModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegisterDataModel&&(identical(other.loginMessage, loginMessage) || other.loginMessage == loginMessage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,loginMessage);

@override
String toString() {
  return 'RegisterDataModel(loginMessage: $loginMessage)';
}


}

/// @nodoc
abstract mixin class _$RegisterDataModelCopyWith<$Res> implements $RegisterDataModelCopyWith<$Res> {
  factory _$RegisterDataModelCopyWith(_RegisterDataModel value, $Res Function(_RegisterDataModel) _then) = __$RegisterDataModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'LoginMessage') String? loginMessage
});




}
/// @nodoc
class __$RegisterDataModelCopyWithImpl<$Res>
    implements _$RegisterDataModelCopyWith<$Res> {
  __$RegisterDataModelCopyWithImpl(this._self, this._then);

  final _RegisterDataModel _self;
  final $Res Function(_RegisterDataModel) _then;

/// Create a copy of RegisterDataModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loginMessage = freezed,}) {
  return _then(_RegisterDataModel(
loginMessage: freezed == loginMessage ? _self.loginMessage : loginMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
