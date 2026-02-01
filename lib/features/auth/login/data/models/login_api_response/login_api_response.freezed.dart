// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginApiResponse {

@JsonKey(name: 'Status') int? get status;@JsonKey(name: 'Message') String? get message;@JsonKey(name: 'Data') LoginResponseModel? get data;@JsonKey(name: 'ErrorMsg') String? get errorMsg;
/// Create a copy of LoginApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginApiResponseCopyWith<LoginApiResponse> get copyWith => _$LoginApiResponseCopyWithImpl<LoginApiResponse>(this as LoginApiResponse, _$identity);

  /// Serializes this LoginApiResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginApiResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data,errorMsg);

@override
String toString() {
  return 'LoginApiResponse(status: $status, message: $message, data: $data, errorMsg: $errorMsg)';
}


}

/// @nodoc
abstract mixin class $LoginApiResponseCopyWith<$Res>  {
  factory $LoginApiResponseCopyWith(LoginApiResponse value, $Res Function(LoginApiResponse) _then) = _$LoginApiResponseCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Status') int? status,@JsonKey(name: 'Message') String? message,@JsonKey(name: 'Data') LoginResponseModel? data,@JsonKey(name: 'ErrorMsg') String? errorMsg
});


$LoginResponseModelCopyWith<$Res>? get data;

}
/// @nodoc
class _$LoginApiResponseCopyWithImpl<$Res>
    implements $LoginApiResponseCopyWith<$Res> {
  _$LoginApiResponseCopyWithImpl(this._self, this._then);

  final LoginApiResponse _self;
  final $Res Function(LoginApiResponse) _then;

/// Create a copy of LoginApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,Object? errorMsg = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginResponseModel?,errorMsg: freezed == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LoginApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginResponseModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LoginResponseModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginApiResponse].
extension LoginApiResponsePatterns on LoginApiResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginApiResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginApiResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginApiResponse value)  $default,){
final _that = this;
switch (_that) {
case _LoginApiResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginApiResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LoginApiResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Status')  int? status, @JsonKey(name: 'Message')  String? message, @JsonKey(name: 'Data')  LoginResponseModel? data, @JsonKey(name: 'ErrorMsg')  String? errorMsg)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginApiResponse() when $default != null:
return $default(_that.status,_that.message,_that.data,_that.errorMsg);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Status')  int? status, @JsonKey(name: 'Message')  String? message, @JsonKey(name: 'Data')  LoginResponseModel? data, @JsonKey(name: 'ErrorMsg')  String? errorMsg)  $default,) {final _that = this;
switch (_that) {
case _LoginApiResponse():
return $default(_that.status,_that.message,_that.data,_that.errorMsg);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Status')  int? status, @JsonKey(name: 'Message')  String? message, @JsonKey(name: 'Data')  LoginResponseModel? data, @JsonKey(name: 'ErrorMsg')  String? errorMsg)?  $default,) {final _that = this;
switch (_that) {
case _LoginApiResponse() when $default != null:
return $default(_that.status,_that.message,_that.data,_that.errorMsg);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginApiResponse implements LoginApiResponse {
  const _LoginApiResponse({@JsonKey(name: 'Status') this.status, @JsonKey(name: 'Message') this.message, @JsonKey(name: 'Data') this.data, @JsonKey(name: 'ErrorMsg') this.errorMsg});
  factory _LoginApiResponse.fromJson(Map<String, dynamic> json) => _$LoginApiResponseFromJson(json);

@override@JsonKey(name: 'Status') final  int? status;
@override@JsonKey(name: 'Message') final  String? message;
@override@JsonKey(name: 'Data') final  LoginResponseModel? data;
@override@JsonKey(name: 'ErrorMsg') final  String? errorMsg;

/// Create a copy of LoginApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginApiResponseCopyWith<_LoginApiResponse> get copyWith => __$LoginApiResponseCopyWithImpl<_LoginApiResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginApiResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginApiResponse&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data)&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,data,errorMsg);

@override
String toString() {
  return 'LoginApiResponse(status: $status, message: $message, data: $data, errorMsg: $errorMsg)';
}


}

/// @nodoc
abstract mixin class _$LoginApiResponseCopyWith<$Res> implements $LoginApiResponseCopyWith<$Res> {
  factory _$LoginApiResponseCopyWith(_LoginApiResponse value, $Res Function(_LoginApiResponse) _then) = __$LoginApiResponseCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Status') int? status,@JsonKey(name: 'Message') String? message,@JsonKey(name: 'Data') LoginResponseModel? data,@JsonKey(name: 'ErrorMsg') String? errorMsg
});


@override $LoginResponseModelCopyWith<$Res>? get data;

}
/// @nodoc
class __$LoginApiResponseCopyWithImpl<$Res>
    implements _$LoginApiResponseCopyWith<$Res> {
  __$LoginApiResponseCopyWithImpl(this._self, this._then);

  final _LoginApiResponse _self;
  final $Res Function(_LoginApiResponse) _then;

/// Create a copy of LoginApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,Object? errorMsg = freezed,}) {
  return _then(_LoginApiResponse(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as LoginResponseModel?,errorMsg: freezed == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LoginApiResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LoginResponseModelCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $LoginResponseModelCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}

// dart format on
