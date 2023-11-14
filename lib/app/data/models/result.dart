import 'package:eden_work_sample/core/constants/constants.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T value) = _SuccessResult;
  const factory Result.error(CustomError error) = _ErrorResult;
}

class CustomError {
  final String message;
  final int statusCode;

  const CustomError({
    required this.message,
    this.statusCode = -1,
  });

  factory CustomError.message(String msg) => CustomError(message: msg);

  factory CustomError.fromJson(JsonDynamic json) {
    return CustomError(
      message: json['message'] ?? '',
      statusCode: json['statusCode'] ?? -1,
    );
  }

  @override
  String toString() => 'Message: $message, Code: $statusCode';
}
