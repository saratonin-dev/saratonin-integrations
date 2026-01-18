// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'score.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LocalScore _$LocalScoreFromJson(Map<String, dynamic> json) {
  return _LocalScore.fromJson(json);
}

/// @nodoc
mixin _$LocalScore {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'machine_id')
  String get machineId => throw _privateConstructorUsedError;
  @JsonKey(name: 'player_name')
  String get playerName => throw _privateConstructorUsedError;
  int get score => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;

  /// Serializes this LocalScore to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LocalScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalScoreCopyWith<LocalScore> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalScoreCopyWith<$Res> {
  factory $LocalScoreCopyWith(
          LocalScore value, $Res Function(LocalScore) then) =
      _$LocalScoreCopyWithImpl<$Res, LocalScore>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'machine_id') String machineId,
      @JsonKey(name: 'player_name') String playerName,
      int score,
      DateTime timestamp});
}

/// @nodoc
class _$LocalScoreCopyWithImpl<$Res, $Val extends LocalScore>
    implements $LocalScoreCopyWith<$Res> {
  _$LocalScoreCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LocalScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? machineId = null,
    Object? playerName = null,
    Object? score = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      machineId: null == machineId
          ? _value.machineId
          : machineId // ignore: cast_nullable_to_non_nullable
              as String,
      playerName: null == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalScoreImplCopyWith<$Res>
    implements $LocalScoreCopyWith<$Res> {
  factory _$$LocalScoreImplCopyWith(
          _$LocalScoreImpl value, $Res Function(_$LocalScoreImpl) then) =
      __$$LocalScoreImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'machine_id') String machineId,
      @JsonKey(name: 'player_name') String playerName,
      int score,
      DateTime timestamp});
}

/// @nodoc
class __$$LocalScoreImplCopyWithImpl<$Res>
    extends _$LocalScoreCopyWithImpl<$Res, _$LocalScoreImpl>
    implements _$$LocalScoreImplCopyWith<$Res> {
  __$$LocalScoreImplCopyWithImpl(
      _$LocalScoreImpl _value, $Res Function(_$LocalScoreImpl) _then)
      : super(_value, _then);

  /// Create a copy of LocalScore
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? machineId = null,
    Object? playerName = null,
    Object? score = null,
    Object? timestamp = null,
  }) {
    return _then(_$LocalScoreImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      machineId: null == machineId
          ? _value.machineId
          : machineId // ignore: cast_nullable_to_non_nullable
              as String,
      playerName: null == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as int,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LocalScoreImpl implements _LocalScore {
  const _$LocalScoreImpl(
      {required this.id,
      @JsonKey(name: 'machine_id') required this.machineId,
      @JsonKey(name: 'player_name') required this.playerName,
      required this.score,
      required this.timestamp});

  factory _$LocalScoreImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocalScoreImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'machine_id')
  final String machineId;
  @override
  @JsonKey(name: 'player_name')
  final String playerName;
  @override
  final int score;
  @override
  final DateTime timestamp;

  @override
  String toString() {
    return 'LocalScore(id: $id, machineId: $machineId, playerName: $playerName, score: $score, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalScoreImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.machineId, machineId) ||
                other.machineId == machineId) &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName) &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, machineId, playerName, score, timestamp);

  /// Create a copy of LocalScore
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalScoreImplCopyWith<_$LocalScoreImpl> get copyWith =>
      __$$LocalScoreImplCopyWithImpl<_$LocalScoreImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocalScoreImplToJson(
      this,
    );
  }
}

abstract class _LocalScore implements LocalScore {
  const factory _LocalScore(
      {required final String id,
      @JsonKey(name: 'machine_id') required final String machineId,
      @JsonKey(name: 'player_name') required final String playerName,
      required final int score,
      required final DateTime timestamp}) = _$LocalScoreImpl;

  factory _LocalScore.fromJson(Map<String, dynamic> json) =
      _$LocalScoreImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'machine_id')
  String get machineId;
  @override
  @JsonKey(name: 'player_name')
  String get playerName;
  @override
  int get score;
  @override
  DateTime get timestamp;

  /// Create a copy of LocalScore
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalScoreImplCopyWith<_$LocalScoreImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubmitScoreResponse _$SubmitScoreResponseFromJson(Map<String, dynamic> json) {
  return _SubmitScoreResponse.fromJson(json);
}

/// @nodoc
mixin _$SubmitScoreResponse {
  LocalScore get score => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;

  /// Serializes this SubmitScoreResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SubmitScoreResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SubmitScoreResponseCopyWith<SubmitScoreResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubmitScoreResponseCopyWith<$Res> {
  factory $SubmitScoreResponseCopyWith(
          SubmitScoreResponse value, $Res Function(SubmitScoreResponse) then) =
      _$SubmitScoreResponseCopyWithImpl<$Res, SubmitScoreResponse>;
  @useResult
  $Res call({LocalScore score, int? rank});

  $LocalScoreCopyWith<$Res> get score;
}

/// @nodoc
class _$SubmitScoreResponseCopyWithImpl<$Res, $Val extends SubmitScoreResponse>
    implements $SubmitScoreResponseCopyWith<$Res> {
  _$SubmitScoreResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SubmitScoreResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? rank = freezed,
  }) {
    return _then(_value.copyWith(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as LocalScore,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  /// Create a copy of SubmitScoreResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocalScoreCopyWith<$Res> get score {
    return $LocalScoreCopyWith<$Res>(_value.score, (value) {
      return _then(_value.copyWith(score: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SubmitScoreResponseImplCopyWith<$Res>
    implements $SubmitScoreResponseCopyWith<$Res> {
  factory _$$SubmitScoreResponseImplCopyWith(_$SubmitScoreResponseImpl value,
          $Res Function(_$SubmitScoreResponseImpl) then) =
      __$$SubmitScoreResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({LocalScore score, int? rank});

  @override
  $LocalScoreCopyWith<$Res> get score;
}

/// @nodoc
class __$$SubmitScoreResponseImplCopyWithImpl<$Res>
    extends _$SubmitScoreResponseCopyWithImpl<$Res, _$SubmitScoreResponseImpl>
    implements _$$SubmitScoreResponseImplCopyWith<$Res> {
  __$$SubmitScoreResponseImplCopyWithImpl(_$SubmitScoreResponseImpl _value,
      $Res Function(_$SubmitScoreResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SubmitScoreResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? score = null,
    Object? rank = freezed,
  }) {
    return _then(_$SubmitScoreResponseImpl(
      score: null == score
          ? _value.score
          : score // ignore: cast_nullable_to_non_nullable
              as LocalScore,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SubmitScoreResponseImpl implements _SubmitScoreResponse {
  const _$SubmitScoreResponseImpl({required this.score, this.rank});

  factory _$SubmitScoreResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubmitScoreResponseImplFromJson(json);

  @override
  final LocalScore score;
  @override
  final int? rank;

  @override
  String toString() {
    return 'SubmitScoreResponse(score: $score, rank: $rank)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubmitScoreResponseImpl &&
            (identical(other.score, score) || other.score == score) &&
            (identical(other.rank, rank) || other.rank == rank));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, score, rank);

  /// Create a copy of SubmitScoreResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SubmitScoreResponseImplCopyWith<_$SubmitScoreResponseImpl> get copyWith =>
      __$$SubmitScoreResponseImplCopyWithImpl<_$SubmitScoreResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubmitScoreResponseImplToJson(
      this,
    );
  }
}

abstract class _SubmitScoreResponse implements SubmitScoreResponse {
  const factory _SubmitScoreResponse(
      {required final LocalScore score,
      final int? rank}) = _$SubmitScoreResponseImpl;

  factory _SubmitScoreResponse.fromJson(Map<String, dynamic> json) =
      _$SubmitScoreResponseImpl.fromJson;

  @override
  LocalScore get score;
  @override
  int? get rank;

  /// Create a copy of SubmitScoreResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SubmitScoreResponseImplCopyWith<_$SubmitScoreResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
