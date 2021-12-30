import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';


part 'errors.freeze.freezed.dart';
part 'errors.freeze.g.dart';

@freezed
abstract class ApiErrors with _$ApiErrors {
  factory ApiErrors({
    String? message,
    int? code,
  }) = _ApiErrors;

  factory ApiErrors.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorsFromJson(json);
}
