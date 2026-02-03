// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_todo_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GetTodoResponseModel {

@JsonKey(name: 'Status') int? get status;@JsonKey(name: 'Message') String? get message;@JsonKey(name: 'ErrorMsg') String? get errorMsg;@JsonKey(name: 'Data') List<TodoDataModel>? get data;
/// Create a copy of GetTodoResponseModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GetTodoResponseModelCopyWith<GetTodoResponseModel> get copyWith => _$GetTodoResponseModelCopyWithImpl<GetTodoResponseModel>(this as GetTodoResponseModel, _$identity);

  /// Serializes this GetTodoResponseModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GetTodoResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,errorMsg,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'GetTodoResponseModel(status: $status, message: $message, errorMsg: $errorMsg, data: $data)';
}


}

/// @nodoc
abstract mixin class $GetTodoResponseModelCopyWith<$Res>  {
  factory $GetTodoResponseModelCopyWith(GetTodoResponseModel value, $Res Function(GetTodoResponseModel) _then) = _$GetTodoResponseModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'Status') int? status,@JsonKey(name: 'Message') String? message,@JsonKey(name: 'ErrorMsg') String? errorMsg,@JsonKey(name: 'Data') List<TodoDataModel>? data
});




}
/// @nodoc
class _$GetTodoResponseModelCopyWithImpl<$Res>
    implements $GetTodoResponseModelCopyWith<$Res> {
  _$GetTodoResponseModelCopyWithImpl(this._self, this._then);

  final GetTodoResponseModel _self;
  final $Res Function(GetTodoResponseModel) _then;

/// Create a copy of GetTodoResponseModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? errorMsg = freezed,Object? data = freezed,}) {
  return _then(_self.copyWith(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorMsg: freezed == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<TodoDataModel>?,
  ));
}

}


/// Adds pattern-matching-related methods to [GetTodoResponseModel].
extension GetTodoResponseModelPatterns on GetTodoResponseModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GetTodoResponseModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetTodoResponseModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GetTodoResponseModel value)  $default,){
final _that = this;
switch (_that) {
case _GetTodoResponseModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GetTodoResponseModel value)?  $default,){
final _that = this;
switch (_that) {
case _GetTodoResponseModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'Status')  int? status, @JsonKey(name: 'Message')  String? message, @JsonKey(name: 'ErrorMsg')  String? errorMsg, @JsonKey(name: 'Data')  List<TodoDataModel>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetTodoResponseModel() when $default != null:
return $default(_that.status,_that.message,_that.errorMsg,_that.data);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'Status')  int? status, @JsonKey(name: 'Message')  String? message, @JsonKey(name: 'ErrorMsg')  String? errorMsg, @JsonKey(name: 'Data')  List<TodoDataModel>? data)  $default,) {final _that = this;
switch (_that) {
case _GetTodoResponseModel():
return $default(_that.status,_that.message,_that.errorMsg,_that.data);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'Status')  int? status, @JsonKey(name: 'Message')  String? message, @JsonKey(name: 'ErrorMsg')  String? errorMsg, @JsonKey(name: 'Data')  List<TodoDataModel>? data)?  $default,) {final _that = this;
switch (_that) {
case _GetTodoResponseModel() when $default != null:
return $default(_that.status,_that.message,_that.errorMsg,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GetTodoResponseModel implements GetTodoResponseModel {
  const _GetTodoResponseModel({@JsonKey(name: 'Status') this.status, @JsonKey(name: 'Message') this.message, @JsonKey(name: 'ErrorMsg') this.errorMsg, @JsonKey(name: 'Data') final  List<TodoDataModel>? data}): _data = data;
  factory _GetTodoResponseModel.fromJson(Map<String, dynamic> json) => _$GetTodoResponseModelFromJson(json);

@override@JsonKey(name: 'Status') final  int? status;
@override@JsonKey(name: 'Message') final  String? message;
@override@JsonKey(name: 'ErrorMsg') final  String? errorMsg;
 final  List<TodoDataModel>? _data;
@override@JsonKey(name: 'Data') List<TodoDataModel>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of GetTodoResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GetTodoResponseModelCopyWith<_GetTodoResponseModel> get copyWith => __$GetTodoResponseModelCopyWithImpl<_GetTodoResponseModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GetTodoResponseModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetTodoResponseModel&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.errorMsg, errorMsg) || other.errorMsg == errorMsg)&&const DeepCollectionEquality().equals(other._data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,status,message,errorMsg,const DeepCollectionEquality().hash(_data));

@override
String toString() {
  return 'GetTodoResponseModel(status: $status, message: $message, errorMsg: $errorMsg, data: $data)';
}


}

/// @nodoc
abstract mixin class _$GetTodoResponseModelCopyWith<$Res> implements $GetTodoResponseModelCopyWith<$Res> {
  factory _$GetTodoResponseModelCopyWith(_GetTodoResponseModel value, $Res Function(_GetTodoResponseModel) _then) = __$GetTodoResponseModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'Status') int? status,@JsonKey(name: 'Message') String? message,@JsonKey(name: 'ErrorMsg') String? errorMsg,@JsonKey(name: 'Data') List<TodoDataModel>? data
});




}
/// @nodoc
class __$GetTodoResponseModelCopyWithImpl<$Res>
    implements _$GetTodoResponseModelCopyWith<$Res> {
  __$GetTodoResponseModelCopyWithImpl(this._self, this._then);

  final _GetTodoResponseModel _self;
  final $Res Function(_GetTodoResponseModel) _then;

/// Create a copy of GetTodoResponseModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? errorMsg = freezed,Object? data = freezed,}) {
  return _then(_GetTodoResponseModel(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,errorMsg: freezed == errorMsg ? _self.errorMsg : errorMsg // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<TodoDataModel>?,
  ));
}


}

// dart format on
