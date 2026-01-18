/// Authentication models.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

/// User profile.
@freezed
class User with _$User {
  const factory User({
    required String id,
    required String phone,
    @JsonKey(name: 'is_admin') @Default(false) bool isAdmin,
    @JsonKey(name: 'created_at') required DateTime createdAt,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}

/// Authentication tokens response.
@freezed
class AuthTokens with _$AuthTokens {
  const factory AuthTokens({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'refresh_token') required String refreshToken,
    @JsonKey(name: 'expires_in') required int expiresIn,
    @JsonKey(name: 'token_type') @Default('Bearer') String tokenType,
  }) = _AuthTokens;

  factory AuthTokens.fromJson(Map<String, dynamic> json) =>
      _$AuthTokensFromJson(json);
}

/// Response after requesting OTP.
@freezed
class OtpResponse with _$OtpResponse {
  const factory OtpResponse({
    required String message,
  }) = _OtpResponse;

  factory OtpResponse.fromJson(Map<String, dynamic> json) =>
      _$OtpResponseFromJson(json);
}

/// Response after refreshing token.
@freezed
class RefreshResponse with _$RefreshResponse {
  const factory RefreshResponse({
    @JsonKey(name: 'access_token') required String accessToken,
    @JsonKey(name: 'expires_in') required int expiresIn,
    @JsonKey(name: 'token_type') @Default('Bearer') String tokenType,
  }) = _RefreshResponse;

  factory RefreshResponse.fromJson(Map<String, dynamic> json) =>
      _$RefreshResponseFromJson(json);
}

/// API error response.
@freezed
class ApiError with _$ApiError {
  const factory ApiError({
    required String error,
    required String message,
  }) = _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
}
