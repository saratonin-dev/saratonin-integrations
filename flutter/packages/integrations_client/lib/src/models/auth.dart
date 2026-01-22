/// Authentication models.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth.freezed.dart';
part 'auth.g.dart';

/// User profile with RBAC support.
@freezed
class User with _$User {
  const User._();

  const factory User({
    required String id,
    required String phone,
    String? name,
    @Default([]) List<String> roles,
    @Default([]) List<String> permissions,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Check if user has a specific permission.
  /// Admin role automatically has all permissions.
  bool hasPermission(String permission) {
    if (hasRole('admin')) return true;
    return permissions.contains(permission);
  }

  /// Check if user has a specific role.
  bool hasRole(String role) => roles.contains(role);

  /// Check if user is an admin.
  bool get isAdmin => hasRole('admin');

  /// Check if user can favorite machines.
  bool get canFavorite => hasPermission('machines:favorite');
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
  const factory OtpResponse({required String message}) = _OtpResponse;

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
  const factory ApiError({required String error, required String message}) =
      _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
}
