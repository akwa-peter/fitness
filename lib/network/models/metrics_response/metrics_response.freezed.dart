// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'metrics_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetricsResponse {

 bool? get isSuccessful; int? get code; List<Metrics>? get data; String? get message;
/// Create a copy of MetricsResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetricsResponseCopyWith<MetricsResponse> get copyWith => _$MetricsResponseCopyWithImpl<MetricsResponse>(this as MetricsResponse, _$identity);

  /// Serializes this MetricsResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetricsResponse&&(identical(other.isSuccessful, isSuccessful) || other.isSuccessful == isSuccessful)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccessful,code,const DeepCollectionEquality().hash(data),message);

@override
String toString() {
  return 'MetricsResponse(isSuccessful: $isSuccessful, code: $code, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class $MetricsResponseCopyWith<$Res>  {
  factory $MetricsResponseCopyWith(MetricsResponse value, $Res Function(MetricsResponse) _then) = _$MetricsResponseCopyWithImpl;
@useResult
$Res call({
 bool? isSuccessful, int? code, List<Metrics>? data, String? message
});




}
/// @nodoc
class _$MetricsResponseCopyWithImpl<$Res>
    implements $MetricsResponseCopyWith<$Res> {
  _$MetricsResponseCopyWithImpl(this._self, this._then);

  final MetricsResponse _self;
  final $Res Function(MetricsResponse) _then;

/// Create a copy of MetricsResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isSuccessful = freezed,Object? code = freezed,Object? data = freezed,Object? message = freezed,}) {
  return _then(_self.copyWith(
isSuccessful: freezed == isSuccessful ? _self.isSuccessful : isSuccessful // ignore: cast_nullable_to_non_nullable
as bool?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<Metrics>?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MetricsResponse].
extension MetricsResponsePatterns on MetricsResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetricsResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetricsResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetricsResponse value)  $default,){
final _that = this;
switch (_that) {
case _MetricsResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetricsResponse value)?  $default,){
final _that = this;
switch (_that) {
case _MetricsResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool? isSuccessful,  int? code,  List<Metrics>? data,  String? message)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetricsResponse() when $default != null:
return $default(_that.isSuccessful,_that.code,_that.data,_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool? isSuccessful,  int? code,  List<Metrics>? data,  String? message)  $default,) {final _that = this;
switch (_that) {
case _MetricsResponse():
return $default(_that.isSuccessful,_that.code,_that.data,_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool? isSuccessful,  int? code,  List<Metrics>? data,  String? message)?  $default,) {final _that = this;
switch (_that) {
case _MetricsResponse() when $default != null:
return $default(_that.isSuccessful,_that.code,_that.data,_that.message);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetricsResponse implements MetricsResponse {
  const _MetricsResponse({this.isSuccessful, this.code, final  List<Metrics>? data, this.message}): _data = data;
  factory _MetricsResponse.fromJson(Map<String, dynamic> json) => _$MetricsResponseFromJson(json);

@override final  bool? isSuccessful;
@override final  int? code;
 final  List<Metrics>? _data;
@override List<Metrics>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  String? message;

/// Create a copy of MetricsResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetricsResponseCopyWith<_MetricsResponse> get copyWith => __$MetricsResponseCopyWithImpl<_MetricsResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetricsResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetricsResponse&&(identical(other.isSuccessful, isSuccessful) || other.isSuccessful == isSuccessful)&&(identical(other.code, code) || other.code == code)&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.message, message) || other.message == message));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isSuccessful,code,const DeepCollectionEquality().hash(_data),message);

@override
String toString() {
  return 'MetricsResponse(isSuccessful: $isSuccessful, code: $code, data: $data, message: $message)';
}


}

/// @nodoc
abstract mixin class _$MetricsResponseCopyWith<$Res> implements $MetricsResponseCopyWith<$Res> {
  factory _$MetricsResponseCopyWith(_MetricsResponse value, $Res Function(_MetricsResponse) _then) = __$MetricsResponseCopyWithImpl;
@override @useResult
$Res call({
 bool? isSuccessful, int? code, List<Metrics>? data, String? message
});




}
/// @nodoc
class __$MetricsResponseCopyWithImpl<$Res>
    implements _$MetricsResponseCopyWith<$Res> {
  __$MetricsResponseCopyWithImpl(this._self, this._then);

  final _MetricsResponse _self;
  final $Res Function(_MetricsResponse) _then;

/// Create a copy of MetricsResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isSuccessful = freezed,Object? code = freezed,Object? data = freezed,Object? message = freezed,}) {
  return _then(_MetricsResponse(
isSuccessful: freezed == isSuccessful ? _self.isSuccessful : isSuccessful // ignore: cast_nullable_to_non_nullable
as bool?,code: freezed == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as int?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<Metrics>?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
