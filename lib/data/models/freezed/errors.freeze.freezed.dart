// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'errors.freeze.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ApiErrors _$ApiErrorsFromJson(Map<String, dynamic> json) {
  return _ApiErrors.fromJson(json);
}

/// @nodoc
class _$ApiErrorsTearOff {
  const _$ApiErrorsTearOff();

  _ApiErrors call({String? message, int? code}) {
    return _ApiErrors(
      message: message,
      code: code,
    );
  }

  ApiErrors fromJson(Map<String, Object> json) {
    return ApiErrors.fromJson(json);
  }
}

/// @nodoc
const $ApiErrors = _$ApiErrorsTearOff();

/// @nodoc
mixin _$ApiErrors {
  String? get message => throw _privateConstructorUsedError;
  int? get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ApiErrorsCopyWith<ApiErrors> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiErrorsCopyWith<$Res> {
  factory $ApiErrorsCopyWith(ApiErrors value, $Res Function(ApiErrors) then) =
      _$ApiErrorsCopyWithImpl<$Res>;
  $Res call({String? message, int? code});
}

/// @nodoc
class _$ApiErrorsCopyWithImpl<$Res> implements $ApiErrorsCopyWith<$Res> {
  _$ApiErrorsCopyWithImpl(this._value, this._then);

  final ApiErrors _value;
  // ignore: unused_field
  final $Res Function(ApiErrors) _then;

  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_value.copyWith(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$ApiErrorsCopyWith<$Res> implements $ApiErrorsCopyWith<$Res> {
  factory _$ApiErrorsCopyWith(
          _ApiErrors value, $Res Function(_ApiErrors) then) =
      __$ApiErrorsCopyWithImpl<$Res>;
  @override
  $Res call({String? message, int? code});
}

/// @nodoc
class __$ApiErrorsCopyWithImpl<$Res> extends _$ApiErrorsCopyWithImpl<$Res>
    implements _$ApiErrorsCopyWith<$Res> {
  __$ApiErrorsCopyWithImpl(_ApiErrors _value, $Res Function(_ApiErrors) _then)
      : super(_value, (v) => _then(v as _ApiErrors));

  @override
  _ApiErrors get _value => super._value as _ApiErrors;

  @override
  $Res call({
    Object? message = freezed,
    Object? code = freezed,
  }) {
    return _then(_ApiErrors(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ApiErrors with DiagnosticableTreeMixin implements _ApiErrors {
  _$_ApiErrors({this.message, this.code});

  factory _$_ApiErrors.fromJson(Map<String, dynamic> json) =>
      _$_$_ApiErrorsFromJson(json);

  @override
  final String? message;
  @override
  final int? code;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ApiErrors(message: $message, code: $code)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ApiErrors'))
      ..add(DiagnosticsProperty('message', message))
      ..add(DiagnosticsProperty('code', code));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ApiErrors &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(code);

  @JsonKey(ignore: true)
  @override
  _$ApiErrorsCopyWith<_ApiErrors> get copyWith =>
      __$ApiErrorsCopyWithImpl<_ApiErrors>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ApiErrorsToJson(this);
  }
}

abstract class _ApiErrors implements ApiErrors {
  factory _ApiErrors({String? message, int? code}) = _$_ApiErrors;

  factory _ApiErrors.fromJson(Map<String, dynamic> json) =
      _$_ApiErrors.fromJson;

  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  int? get code => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ApiErrorsCopyWith<_ApiErrors> get copyWith =>
      throw _privateConstructorUsedError;
}
