// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'league.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Series _$SeriesFromJson(Map<String, dynamic> json) {
  return _Series.fromJson(json);
}

/// @nodoc
mixin _$Series {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'tournament_count')
  int? get tournamentCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'start_date')
  String? get startDate => throw _privateConstructorUsedError;
  @JsonKey(name: 'end_date')
  String? get endDate => throw _privateConstructorUsedError;

  /// Serializes this Series to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Series
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeriesCopyWith<Series> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesCopyWith<$Res> {
  factory $SeriesCopyWith(Series value, $Res Function(Series) then) =
      _$SeriesCopyWithImpl<$Res, Series>;
  @useResult
  $Res call(
      {int id,
      String name,
      String status,
      @JsonKey(name: 'tournament_count') int? tournamentCount,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'end_date') String? endDate});
}

/// @nodoc
class _$SeriesCopyWithImpl<$Res, $Val extends Series>
    implements $SeriesCopyWith<$Res> {
  _$SeriesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Series
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? tournamentCount = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tournamentCount: freezed == tournamentCount
          ? _value.tournamentCount
          : tournamentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeriesImplCopyWith<$Res> implements $SeriesCopyWith<$Res> {
  factory _$$SeriesImplCopyWith(
          _$SeriesImpl value, $Res Function(_$SeriesImpl) then) =
      __$$SeriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String status,
      @JsonKey(name: 'tournament_count') int? tournamentCount,
      @JsonKey(name: 'start_date') String? startDate,
      @JsonKey(name: 'end_date') String? endDate});
}

/// @nodoc
class __$$SeriesImplCopyWithImpl<$Res>
    extends _$SeriesCopyWithImpl<$Res, _$SeriesImpl>
    implements _$$SeriesImplCopyWith<$Res> {
  __$$SeriesImplCopyWithImpl(
      _$SeriesImpl _value, $Res Function(_$SeriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of Series
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? status = null,
    Object? tournamentCount = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
  }) {
    return _then(_$SeriesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tournamentCount: freezed == tournamentCount
          ? _value.tournamentCount
          : tournamentCount // ignore: cast_nullable_to_non_nullable
              as int?,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as String?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeriesImpl implements _Series {
  const _$SeriesImpl(
      {required this.id,
      required this.name,
      required this.status,
      @JsonKey(name: 'tournament_count') this.tournamentCount,
      @JsonKey(name: 'start_date') this.startDate,
      @JsonKey(name: 'end_date') this.endDate});

  factory _$SeriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeriesImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String status;
  @override
  @JsonKey(name: 'tournament_count')
  final int? tournamentCount;
  @override
  @JsonKey(name: 'start_date')
  final String? startDate;
  @override
  @JsonKey(name: 'end_date')
  final String? endDate;

  @override
  String toString() {
    return 'Series(id: $id, name: $name, status: $status, tournamentCount: $tournamentCount, startDate: $startDate, endDate: $endDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tournamentCount, tournamentCount) ||
                other.tournamentCount == tournamentCount) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, name, status, tournamentCount, startDate, endDate);

  /// Create a copy of Series
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesImplCopyWith<_$SeriesImpl> get copyWith =>
      __$$SeriesImplCopyWithImpl<_$SeriesImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeriesImplToJson(
      this,
    );
  }
}

abstract class _Series implements Series {
  const factory _Series(
      {required final int id,
      required final String name,
      required final String status,
      @JsonKey(name: 'tournament_count') final int? tournamentCount,
      @JsonKey(name: 'start_date') final String? startDate,
      @JsonKey(name: 'end_date') final String? endDate}) = _$SeriesImpl;

  factory _Series.fromJson(Map<String, dynamic> json) = _$SeriesImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get status;
  @override
  @JsonKey(name: 'tournament_count')
  int? get tournamentCount;
  @override
  @JsonKey(name: 'start_date')
  String? get startDate;
  @override
  @JsonKey(name: 'end_date')
  String? get endDate;

  /// Create a copy of Series
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeriesImplCopyWith<_$SeriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Tournament _$TournamentFromJson(Map<String, dynamic> json) {
  return _Tournament.fromJson(json);
}

/// @nodoc
mixin _$Tournament {
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'series_id')
  int? get seriesId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  @JsonKey(name: 'tournament_type')
  String? get tournamentType => throw _privateConstructorUsedError;
  @JsonKey(name: 'player_count')
  int? get playerCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'started_at')
  String? get startedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'completed_at')
  String? get completedAt => throw _privateConstructorUsedError;

  /// Serializes this Tournament to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Tournament
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TournamentCopyWith<Tournament> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentCopyWith<$Res> {
  factory $TournamentCopyWith(
          Tournament value, $Res Function(Tournament) then) =
      _$TournamentCopyWithImpl<$Res, Tournament>;
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'series_id') int? seriesId,
      String name,
      String status,
      @JsonKey(name: 'tournament_type') String? tournamentType,
      @JsonKey(name: 'player_count') int? playerCount,
      @JsonKey(name: 'started_at') String? startedAt,
      @JsonKey(name: 'completed_at') String? completedAt});
}

/// @nodoc
class _$TournamentCopyWithImpl<$Res, $Val extends Tournament>
    implements $TournamentCopyWith<$Res> {
  _$TournamentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Tournament
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? seriesId = freezed,
    Object? name = null,
    Object? status = null,
    Object? tournamentType = freezed,
    Object? playerCount = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      seriesId: freezed == seriesId
          ? _value.seriesId
          : seriesId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tournamentType: freezed == tournamentType
          ? _value.tournamentType
          : tournamentType // ignore: cast_nullable_to_non_nullable
              as String?,
      playerCount: freezed == playerCount
          ? _value.playerCount
          : playerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TournamentImplCopyWith<$Res>
    implements $TournamentCopyWith<$Res> {
  factory _$$TournamentImplCopyWith(
          _$TournamentImpl value, $Res Function(_$TournamentImpl) then) =
      __$$TournamentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      @JsonKey(name: 'series_id') int? seriesId,
      String name,
      String status,
      @JsonKey(name: 'tournament_type') String? tournamentType,
      @JsonKey(name: 'player_count') int? playerCount,
      @JsonKey(name: 'started_at') String? startedAt,
      @JsonKey(name: 'completed_at') String? completedAt});
}

/// @nodoc
class __$$TournamentImplCopyWithImpl<$Res>
    extends _$TournamentCopyWithImpl<$Res, _$TournamentImpl>
    implements _$$TournamentImplCopyWith<$Res> {
  __$$TournamentImplCopyWithImpl(
      _$TournamentImpl _value, $Res Function(_$TournamentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Tournament
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? seriesId = freezed,
    Object? name = null,
    Object? status = null,
    Object? tournamentType = freezed,
    Object? playerCount = freezed,
    Object? startedAt = freezed,
    Object? completedAt = freezed,
  }) {
    return _then(_$TournamentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      seriesId: freezed == seriesId
          ? _value.seriesId
          : seriesId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      tournamentType: freezed == tournamentType
          ? _value.tournamentType
          : tournamentType // ignore: cast_nullable_to_non_nullable
              as String?,
      playerCount: freezed == playerCount
          ? _value.playerCount
          : playerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      startedAt: freezed == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      completedAt: freezed == completedAt
          ? _value.completedAt
          : completedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TournamentImpl implements _Tournament {
  const _$TournamentImpl(
      {required this.id,
      @JsonKey(name: 'series_id') this.seriesId,
      required this.name,
      required this.status,
      @JsonKey(name: 'tournament_type') this.tournamentType,
      @JsonKey(name: 'player_count') this.playerCount,
      @JsonKey(name: 'started_at') this.startedAt,
      @JsonKey(name: 'completed_at') this.completedAt});

  factory _$TournamentImpl.fromJson(Map<String, dynamic> json) =>
      _$$TournamentImplFromJson(json);

  @override
  final int id;
  @override
  @JsonKey(name: 'series_id')
  final int? seriesId;
  @override
  final String name;
  @override
  final String status;
  @override
  @JsonKey(name: 'tournament_type')
  final String? tournamentType;
  @override
  @JsonKey(name: 'player_count')
  final int? playerCount;
  @override
  @JsonKey(name: 'started_at')
  final String? startedAt;
  @override
  @JsonKey(name: 'completed_at')
  final String? completedAt;

  @override
  String toString() {
    return 'Tournament(id: $id, seriesId: $seriesId, name: $name, status: $status, tournamentType: $tournamentType, playerCount: $playerCount, startedAt: $startedAt, completedAt: $completedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TournamentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.seriesId, seriesId) ||
                other.seriesId == seriesId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.tournamentType, tournamentType) ||
                other.tournamentType == tournamentType) &&
            (identical(other.playerCount, playerCount) ||
                other.playerCount == playerCount) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.completedAt, completedAt) ||
                other.completedAt == completedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, seriesId, name, status,
      tournamentType, playerCount, startedAt, completedAt);

  /// Create a copy of Tournament
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TournamentImplCopyWith<_$TournamentImpl> get copyWith =>
      __$$TournamentImplCopyWithImpl<_$TournamentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TournamentImplToJson(
      this,
    );
  }
}

abstract class _Tournament implements Tournament {
  const factory _Tournament(
          {required final int id,
          @JsonKey(name: 'series_id') final int? seriesId,
          required final String name,
          required final String status,
          @JsonKey(name: 'tournament_type') final String? tournamentType,
          @JsonKey(name: 'player_count') final int? playerCount,
          @JsonKey(name: 'started_at') final String? startedAt,
          @JsonKey(name: 'completed_at') final String? completedAt}) =
      _$TournamentImpl;

  factory _Tournament.fromJson(Map<String, dynamic> json) =
      _$TournamentImpl.fromJson;

  @override
  int get id;
  @override
  @JsonKey(name: 'series_id')
  int? get seriesId;
  @override
  String get name;
  @override
  String get status;
  @override
  @JsonKey(name: 'tournament_type')
  String? get tournamentType;
  @override
  @JsonKey(name: 'player_count')
  int? get playerCount;
  @override
  @JsonKey(name: 'started_at')
  String? get startedAt;
  @override
  @JsonKey(name: 'completed_at')
  String? get completedAt;

  /// Create a copy of Tournament
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TournamentImplCopyWith<_$TournamentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Player _$PlayerFromJson(Map<String, dynamic> json) {
  return _Player.fromJson(json);
}

/// @nodoc
mixin _$Player {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'ifpa_id')
  int? get ifpaId => throw _privateConstructorUsedError;

  /// Serializes this Player to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerCopyWith<Player> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerCopyWith<$Res> {
  factory $PlayerCopyWith(Player value, $Res Function(Player) then) =
      _$PlayerCopyWithImpl<$Res, Player>;
  @useResult
  $Res call({int id, String name, @JsonKey(name: 'ifpa_id') int? ifpaId});
}

/// @nodoc
class _$PlayerCopyWithImpl<$Res, $Val extends Player>
    implements $PlayerCopyWith<$Res> {
  _$PlayerCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ifpaId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ifpaId: freezed == ifpaId
          ? _value.ifpaId
          : ifpaId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerImplCopyWith<$Res> implements $PlayerCopyWith<$Res> {
  factory _$$PlayerImplCopyWith(
          _$PlayerImpl value, $Res Function(_$PlayerImpl) then) =
      __$$PlayerImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, @JsonKey(name: 'ifpa_id') int? ifpaId});
}

/// @nodoc
class __$$PlayerImplCopyWithImpl<$Res>
    extends _$PlayerCopyWithImpl<$Res, _$PlayerImpl>
    implements _$$PlayerImplCopyWith<$Res> {
  __$$PlayerImplCopyWithImpl(
      _$PlayerImpl _value, $Res Function(_$PlayerImpl) _then)
      : super(_value, _then);

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? ifpaId = freezed,
  }) {
    return _then(_$PlayerImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      ifpaId: freezed == ifpaId
          ? _value.ifpaId
          : ifpaId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerImpl implements _Player {
  const _$PlayerImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'ifpa_id') this.ifpaId});

  factory _$PlayerImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  @JsonKey(name: 'ifpa_id')
  final int? ifpaId;

  @override
  String toString() {
    return 'Player(id: $id, name: $name, ifpaId: $ifpaId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.ifpaId, ifpaId) || other.ifpaId == ifpaId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, ifpaId);

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      __$$PlayerImplCopyWithImpl<_$PlayerImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerImplToJson(
      this,
    );
  }
}

abstract class _Player implements Player {
  const factory _Player(
      {required final int id,
      required final String name,
      @JsonKey(name: 'ifpa_id') final int? ifpaId}) = _$PlayerImpl;

  factory _Player.fromJson(Map<String, dynamic> json) = _$PlayerImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'ifpa_id')
  int? get ifpaId;

  /// Create a copy of Player
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerImplCopyWith<_$PlayerImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Standing _$StandingFromJson(Map<String, dynamic> json) {
  return _Standing.fromJson(json);
}

/// @nodoc
mixin _$Standing {
  int get rank => throw _privateConstructorUsedError;
  @JsonKey(name: 'player_id')
  int get playerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'player_name')
  String get playerName => throw _privateConstructorUsedError;
  double? get points => throw _privateConstructorUsedError;
  int? get wins => throw _privateConstructorUsedError;
  int? get losses => throw _privateConstructorUsedError;

  /// Serializes this Standing to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Standing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StandingCopyWith<Standing> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StandingCopyWith<$Res> {
  factory $StandingCopyWith(Standing value, $Res Function(Standing) then) =
      _$StandingCopyWithImpl<$Res, Standing>;
  @useResult
  $Res call(
      {int rank,
      @JsonKey(name: 'player_id') int playerId,
      @JsonKey(name: 'player_name') String playerName,
      double? points,
      int? wins,
      int? losses});
}

/// @nodoc
class _$StandingCopyWithImpl<$Res, $Val extends Standing>
    implements $StandingCopyWith<$Res> {
  _$StandingCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Standing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? playerId = null,
    Object? playerName = null,
    Object? points = freezed,
    Object? wins = freezed,
    Object? losses = freezed,
  }) {
    return _then(_value.copyWith(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      playerName: null == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as double?,
      wins: freezed == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int?,
      losses: freezed == losses
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StandingImplCopyWith<$Res>
    implements $StandingCopyWith<$Res> {
  factory _$$StandingImplCopyWith(
          _$StandingImpl value, $Res Function(_$StandingImpl) then) =
      __$$StandingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int rank,
      @JsonKey(name: 'player_id') int playerId,
      @JsonKey(name: 'player_name') String playerName,
      double? points,
      int? wins,
      int? losses});
}

/// @nodoc
class __$$StandingImplCopyWithImpl<$Res>
    extends _$StandingCopyWithImpl<$Res, _$StandingImpl>
    implements _$$StandingImplCopyWith<$Res> {
  __$$StandingImplCopyWithImpl(
      _$StandingImpl _value, $Res Function(_$StandingImpl) _then)
      : super(_value, _then);

  /// Create a copy of Standing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rank = null,
    Object? playerId = null,
    Object? playerName = null,
    Object? points = freezed,
    Object? wins = freezed,
    Object? losses = freezed,
  }) {
    return _then(_$StandingImpl(
      rank: null == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int,
      playerId: null == playerId
          ? _value.playerId
          : playerId // ignore: cast_nullable_to_non_nullable
              as int,
      playerName: null == playerName
          ? _value.playerName
          : playerName // ignore: cast_nullable_to_non_nullable
              as String,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as double?,
      wins: freezed == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int?,
      losses: freezed == losses
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StandingImpl implements _Standing {
  const _$StandingImpl(
      {required this.rank,
      @JsonKey(name: 'player_id') required this.playerId,
      @JsonKey(name: 'player_name') required this.playerName,
      this.points,
      this.wins,
      this.losses});

  factory _$StandingImpl.fromJson(Map<String, dynamic> json) =>
      _$$StandingImplFromJson(json);

  @override
  final int rank;
  @override
  @JsonKey(name: 'player_id')
  final int playerId;
  @override
  @JsonKey(name: 'player_name')
  final String playerName;
  @override
  final double? points;
  @override
  final int? wins;
  @override
  final int? losses;

  @override
  String toString() {
    return 'Standing(rank: $rank, playerId: $playerId, playerName: $playerName, points: $points, wins: $wins, losses: $losses)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StandingImpl &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.playerId, playerId) ||
                other.playerId == playerId) &&
            (identical(other.playerName, playerName) ||
                other.playerName == playerName) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.wins, wins) || other.wins == wins) &&
            (identical(other.losses, losses) || other.losses == losses));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, rank, playerId, playerName, points, wins, losses);

  /// Create a copy of Standing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StandingImplCopyWith<_$StandingImpl> get copyWith =>
      __$$StandingImplCopyWithImpl<_$StandingImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StandingImplToJson(
      this,
    );
  }
}

abstract class _Standing implements Standing {
  const factory _Standing(
      {required final int rank,
      @JsonKey(name: 'player_id') required final int playerId,
      @JsonKey(name: 'player_name') required final String playerName,
      final double? points,
      final int? wins,
      final int? losses}) = _$StandingImpl;

  factory _Standing.fromJson(Map<String, dynamic> json) =
      _$StandingImpl.fromJson;

  @override
  int get rank;
  @override
  @JsonKey(name: 'player_id')
  int get playerId;
  @override
  @JsonKey(name: 'player_name')
  String get playerName;
  @override
  double? get points;
  @override
  int? get wins;
  @override
  int? get losses;

  /// Create a copy of Standing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StandingImplCopyWith<_$StandingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LeagueOverview _$LeagueOverviewFromJson(Map<String, dynamic> json) {
  return _LeagueOverview.fromJson(json);
}

/// @nodoc
mixin _$LeagueOverview {
  @JsonKey(name: 'active_series')
  Series? get activeSeries => throw _privateConstructorUsedError;
  List<Standing> get standings => throw _privateConstructorUsedError;
  @JsonKey(name: 'recent_tournaments')
  List<Tournament> get recentTournaments => throw _privateConstructorUsedError;
  @JsonKey(name: 'upcoming_tournaments')
  List<Tournament> get upcomingTournaments =>
      throw _privateConstructorUsedError;
  @JsonKey(name: 'last_updated')
  DateTime? get lastUpdated => throw _privateConstructorUsedError;

  /// Serializes this LeagueOverview to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LeagueOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LeagueOverviewCopyWith<LeagueOverview> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeagueOverviewCopyWith<$Res> {
  factory $LeagueOverviewCopyWith(
          LeagueOverview value, $Res Function(LeagueOverview) then) =
      _$LeagueOverviewCopyWithImpl<$Res, LeagueOverview>;
  @useResult
  $Res call(
      {@JsonKey(name: 'active_series') Series? activeSeries,
      List<Standing> standings,
      @JsonKey(name: 'recent_tournaments') List<Tournament> recentTournaments,
      @JsonKey(name: 'upcoming_tournaments')
      List<Tournament> upcomingTournaments,
      @JsonKey(name: 'last_updated') DateTime? lastUpdated});

  $SeriesCopyWith<$Res>? get activeSeries;
}

/// @nodoc
class _$LeagueOverviewCopyWithImpl<$Res, $Val extends LeagueOverview>
    implements $LeagueOverviewCopyWith<$Res> {
  _$LeagueOverviewCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LeagueOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeSeries = freezed,
    Object? standings = null,
    Object? recentTournaments = null,
    Object? upcomingTournaments = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_value.copyWith(
      activeSeries: freezed == activeSeries
          ? _value.activeSeries
          : activeSeries // ignore: cast_nullable_to_non_nullable
              as Series?,
      standings: null == standings
          ? _value.standings
          : standings // ignore: cast_nullable_to_non_nullable
              as List<Standing>,
      recentTournaments: null == recentTournaments
          ? _value.recentTournaments
          : recentTournaments // ignore: cast_nullable_to_non_nullable
              as List<Tournament>,
      upcomingTournaments: null == upcomingTournaments
          ? _value.upcomingTournaments
          : upcomingTournaments // ignore: cast_nullable_to_non_nullable
              as List<Tournament>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  /// Create a copy of LeagueOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeriesCopyWith<$Res>? get activeSeries {
    if (_value.activeSeries == null) {
      return null;
    }

    return $SeriesCopyWith<$Res>(_value.activeSeries!, (value) {
      return _then(_value.copyWith(activeSeries: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LeagueOverviewImplCopyWith<$Res>
    implements $LeagueOverviewCopyWith<$Res> {
  factory _$$LeagueOverviewImplCopyWith(_$LeagueOverviewImpl value,
          $Res Function(_$LeagueOverviewImpl) then) =
      __$$LeagueOverviewImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'active_series') Series? activeSeries,
      List<Standing> standings,
      @JsonKey(name: 'recent_tournaments') List<Tournament> recentTournaments,
      @JsonKey(name: 'upcoming_tournaments')
      List<Tournament> upcomingTournaments,
      @JsonKey(name: 'last_updated') DateTime? lastUpdated});

  @override
  $SeriesCopyWith<$Res>? get activeSeries;
}

/// @nodoc
class __$$LeagueOverviewImplCopyWithImpl<$Res>
    extends _$LeagueOverviewCopyWithImpl<$Res, _$LeagueOverviewImpl>
    implements _$$LeagueOverviewImplCopyWith<$Res> {
  __$$LeagueOverviewImplCopyWithImpl(
      _$LeagueOverviewImpl _value, $Res Function(_$LeagueOverviewImpl) _then)
      : super(_value, _then);

  /// Create a copy of LeagueOverview
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activeSeries = freezed,
    Object? standings = null,
    Object? recentTournaments = null,
    Object? upcomingTournaments = null,
    Object? lastUpdated = freezed,
  }) {
    return _then(_$LeagueOverviewImpl(
      activeSeries: freezed == activeSeries
          ? _value.activeSeries
          : activeSeries // ignore: cast_nullable_to_non_nullable
              as Series?,
      standings: null == standings
          ? _value._standings
          : standings // ignore: cast_nullable_to_non_nullable
              as List<Standing>,
      recentTournaments: null == recentTournaments
          ? _value._recentTournaments
          : recentTournaments // ignore: cast_nullable_to_non_nullable
              as List<Tournament>,
      upcomingTournaments: null == upcomingTournaments
          ? _value._upcomingTournaments
          : upcomingTournaments // ignore: cast_nullable_to_non_nullable
              as List<Tournament>,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LeagueOverviewImpl implements _LeagueOverview {
  const _$LeagueOverviewImpl(
      {@JsonKey(name: 'active_series') this.activeSeries,
      final List<Standing> standings = const [],
      @JsonKey(name: 'recent_tournaments')
      final List<Tournament> recentTournaments = const [],
      @JsonKey(name: 'upcoming_tournaments')
      final List<Tournament> upcomingTournaments = const [],
      @JsonKey(name: 'last_updated') this.lastUpdated})
      : _standings = standings,
        _recentTournaments = recentTournaments,
        _upcomingTournaments = upcomingTournaments;

  factory _$LeagueOverviewImpl.fromJson(Map<String, dynamic> json) =>
      _$$LeagueOverviewImplFromJson(json);

  @override
  @JsonKey(name: 'active_series')
  final Series? activeSeries;
  final List<Standing> _standings;
  @override
  @JsonKey()
  List<Standing> get standings {
    if (_standings is EqualUnmodifiableListView) return _standings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_standings);
  }

  final List<Tournament> _recentTournaments;
  @override
  @JsonKey(name: 'recent_tournaments')
  List<Tournament> get recentTournaments {
    if (_recentTournaments is EqualUnmodifiableListView)
      return _recentTournaments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentTournaments);
  }

  final List<Tournament> _upcomingTournaments;
  @override
  @JsonKey(name: 'upcoming_tournaments')
  List<Tournament> get upcomingTournaments {
    if (_upcomingTournaments is EqualUnmodifiableListView)
      return _upcomingTournaments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_upcomingTournaments);
  }

  @override
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;

  @override
  String toString() {
    return 'LeagueOverview(activeSeries: $activeSeries, standings: $standings, recentTournaments: $recentTournaments, upcomingTournaments: $upcomingTournaments, lastUpdated: $lastUpdated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LeagueOverviewImpl &&
            (identical(other.activeSeries, activeSeries) ||
                other.activeSeries == activeSeries) &&
            const DeepCollectionEquality()
                .equals(other._standings, _standings) &&
            const DeepCollectionEquality()
                .equals(other._recentTournaments, _recentTournaments) &&
            const DeepCollectionEquality()
                .equals(other._upcomingTournaments, _upcomingTournaments) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activeSeries,
      const DeepCollectionEquality().hash(_standings),
      const DeepCollectionEquality().hash(_recentTournaments),
      const DeepCollectionEquality().hash(_upcomingTournaments),
      lastUpdated);

  /// Create a copy of LeagueOverview
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LeagueOverviewImplCopyWith<_$LeagueOverviewImpl> get copyWith =>
      __$$LeagueOverviewImplCopyWithImpl<_$LeagueOverviewImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LeagueOverviewImplToJson(
      this,
    );
  }
}

abstract class _LeagueOverview implements LeagueOverview {
  const factory _LeagueOverview(
          {@JsonKey(name: 'active_series') final Series? activeSeries,
          final List<Standing> standings,
          @JsonKey(name: 'recent_tournaments')
          final List<Tournament> recentTournaments,
          @JsonKey(name: 'upcoming_tournaments')
          final List<Tournament> upcomingTournaments,
          @JsonKey(name: 'last_updated') final DateTime? lastUpdated}) =
      _$LeagueOverviewImpl;

  factory _LeagueOverview.fromJson(Map<String, dynamic> json) =
      _$LeagueOverviewImpl.fromJson;

  @override
  @JsonKey(name: 'active_series')
  Series? get activeSeries;
  @override
  List<Standing> get standings;
  @override
  @JsonKey(name: 'recent_tournaments')
  List<Tournament> get recentTournaments;
  @override
  @JsonKey(name: 'upcoming_tournaments')
  List<Tournament> get upcomingTournaments;
  @override
  @JsonKey(name: 'last_updated')
  DateTime? get lastUpdated;

  /// Create a copy of LeagueOverview
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LeagueOverviewImplCopyWith<_$LeagueOverviewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SeriesDetail _$SeriesDetailFromJson(Map<String, dynamic> json) {
  return _SeriesDetail.fromJson(json);
}

/// @nodoc
mixin _$SeriesDetail {
  Series get series => throw _privateConstructorUsedError;
  List<Standing> get standings => throw _privateConstructorUsedError;
  List<Tournament> get tournaments => throw _privateConstructorUsedError;

  /// Serializes this SeriesDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SeriesDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SeriesDetailCopyWith<SeriesDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesDetailCopyWith<$Res> {
  factory $SeriesDetailCopyWith(
          SeriesDetail value, $Res Function(SeriesDetail) then) =
      _$SeriesDetailCopyWithImpl<$Res, SeriesDetail>;
  @useResult
  $Res call(
      {Series series, List<Standing> standings, List<Tournament> tournaments});

  $SeriesCopyWith<$Res> get series;
}

/// @nodoc
class _$SeriesDetailCopyWithImpl<$Res, $Val extends SeriesDetail>
    implements $SeriesDetailCopyWith<$Res> {
  _$SeriesDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SeriesDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? series = null,
    Object? standings = null,
    Object? tournaments = null,
  }) {
    return _then(_value.copyWith(
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as Series,
      standings: null == standings
          ? _value.standings
          : standings // ignore: cast_nullable_to_non_nullable
              as List<Standing>,
      tournaments: null == tournaments
          ? _value.tournaments
          : tournaments // ignore: cast_nullable_to_non_nullable
              as List<Tournament>,
    ) as $Val);
  }

  /// Create a copy of SeriesDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SeriesCopyWith<$Res> get series {
    return $SeriesCopyWith<$Res>(_value.series, (value) {
      return _then(_value.copyWith(series: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SeriesDetailImplCopyWith<$Res>
    implements $SeriesDetailCopyWith<$Res> {
  factory _$$SeriesDetailImplCopyWith(
          _$SeriesDetailImpl value, $Res Function(_$SeriesDetailImpl) then) =
      __$$SeriesDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Series series, List<Standing> standings, List<Tournament> tournaments});

  @override
  $SeriesCopyWith<$Res> get series;
}

/// @nodoc
class __$$SeriesDetailImplCopyWithImpl<$Res>
    extends _$SeriesDetailCopyWithImpl<$Res, _$SeriesDetailImpl>
    implements _$$SeriesDetailImplCopyWith<$Res> {
  __$$SeriesDetailImplCopyWithImpl(
      _$SeriesDetailImpl _value, $Res Function(_$SeriesDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of SeriesDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? series = null,
    Object? standings = null,
    Object? tournaments = null,
  }) {
    return _then(_$SeriesDetailImpl(
      series: null == series
          ? _value.series
          : series // ignore: cast_nullable_to_non_nullable
              as Series,
      standings: null == standings
          ? _value._standings
          : standings // ignore: cast_nullable_to_non_nullable
              as List<Standing>,
      tournaments: null == tournaments
          ? _value._tournaments
          : tournaments // ignore: cast_nullable_to_non_nullable
              as List<Tournament>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeriesDetailImpl implements _SeriesDetail {
  const _$SeriesDetailImpl(
      {required this.series,
      final List<Standing> standings = const [],
      final List<Tournament> tournaments = const []})
      : _standings = standings,
        _tournaments = tournaments;

  factory _$SeriesDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeriesDetailImplFromJson(json);

  @override
  final Series series;
  final List<Standing> _standings;
  @override
  @JsonKey()
  List<Standing> get standings {
    if (_standings is EqualUnmodifiableListView) return _standings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_standings);
  }

  final List<Tournament> _tournaments;
  @override
  @JsonKey()
  List<Tournament> get tournaments {
    if (_tournaments is EqualUnmodifiableListView) return _tournaments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tournaments);
  }

  @override
  String toString() {
    return 'SeriesDetail(series: $series, standings: $standings, tournaments: $tournaments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesDetailImpl &&
            (identical(other.series, series) || other.series == series) &&
            const DeepCollectionEquality()
                .equals(other._standings, _standings) &&
            const DeepCollectionEquality()
                .equals(other._tournaments, _tournaments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      series,
      const DeepCollectionEquality().hash(_standings),
      const DeepCollectionEquality().hash(_tournaments));

  /// Create a copy of SeriesDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesDetailImplCopyWith<_$SeriesDetailImpl> get copyWith =>
      __$$SeriesDetailImplCopyWithImpl<_$SeriesDetailImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeriesDetailImplToJson(
      this,
    );
  }
}

abstract class _SeriesDetail implements SeriesDetail {
  const factory _SeriesDetail(
      {required final Series series,
      final List<Standing> standings,
      final List<Tournament> tournaments}) = _$SeriesDetailImpl;

  factory _SeriesDetail.fromJson(Map<String, dynamic> json) =
      _$SeriesDetailImpl.fromJson;

  @override
  Series get series;
  @override
  List<Standing> get standings;
  @override
  List<Tournament> get tournaments;

  /// Create a copy of SeriesDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeriesDetailImplCopyWith<_$SeriesDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TournamentDetail _$TournamentDetailFromJson(Map<String, dynamic> json) {
  return _TournamentDetail.fromJson(json);
}

/// @nodoc
mixin _$TournamentDetail {
  Tournament get tournament => throw _privateConstructorUsedError;
  List<Standing> get standings => throw _privateConstructorUsedError;

  /// Serializes this TournamentDetail to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TournamentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TournamentDetailCopyWith<TournamentDetail> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TournamentDetailCopyWith<$Res> {
  factory $TournamentDetailCopyWith(
          TournamentDetail value, $Res Function(TournamentDetail) then) =
      _$TournamentDetailCopyWithImpl<$Res, TournamentDetail>;
  @useResult
  $Res call({Tournament tournament, List<Standing> standings});

  $TournamentCopyWith<$Res> get tournament;
}

/// @nodoc
class _$TournamentDetailCopyWithImpl<$Res, $Val extends TournamentDetail>
    implements $TournamentDetailCopyWith<$Res> {
  _$TournamentDetailCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TournamentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tournament = null,
    Object? standings = null,
  }) {
    return _then(_value.copyWith(
      tournament: null == tournament
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as Tournament,
      standings: null == standings
          ? _value.standings
          : standings // ignore: cast_nullable_to_non_nullable
              as List<Standing>,
    ) as $Val);
  }

  /// Create a copy of TournamentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $TournamentCopyWith<$Res> get tournament {
    return $TournamentCopyWith<$Res>(_value.tournament, (value) {
      return _then(_value.copyWith(tournament: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TournamentDetailImplCopyWith<$Res>
    implements $TournamentDetailCopyWith<$Res> {
  factory _$$TournamentDetailImplCopyWith(_$TournamentDetailImpl value,
          $Res Function(_$TournamentDetailImpl) then) =
      __$$TournamentDetailImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Tournament tournament, List<Standing> standings});

  @override
  $TournamentCopyWith<$Res> get tournament;
}

/// @nodoc
class __$$TournamentDetailImplCopyWithImpl<$Res>
    extends _$TournamentDetailCopyWithImpl<$Res, _$TournamentDetailImpl>
    implements _$$TournamentDetailImplCopyWith<$Res> {
  __$$TournamentDetailImplCopyWithImpl(_$TournamentDetailImpl _value,
      $Res Function(_$TournamentDetailImpl) _then)
      : super(_value, _then);

  /// Create a copy of TournamentDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tournament = null,
    Object? standings = null,
  }) {
    return _then(_$TournamentDetailImpl(
      tournament: null == tournament
          ? _value.tournament
          : tournament // ignore: cast_nullable_to_non_nullable
              as Tournament,
      standings: null == standings
          ? _value._standings
          : standings // ignore: cast_nullable_to_non_nullable
              as List<Standing>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TournamentDetailImpl implements _TournamentDetail {
  const _$TournamentDetailImpl(
      {required this.tournament, final List<Standing> standings = const []})
      : _standings = standings;

  factory _$TournamentDetailImpl.fromJson(Map<String, dynamic> json) =>
      _$$TournamentDetailImplFromJson(json);

  @override
  final Tournament tournament;
  final List<Standing> _standings;
  @override
  @JsonKey()
  List<Standing> get standings {
    if (_standings is EqualUnmodifiableListView) return _standings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_standings);
  }

  @override
  String toString() {
    return 'TournamentDetail(tournament: $tournament, standings: $standings)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TournamentDetailImpl &&
            (identical(other.tournament, tournament) ||
                other.tournament == tournament) &&
            const DeepCollectionEquality()
                .equals(other._standings, _standings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, tournament, const DeepCollectionEquality().hash(_standings));

  /// Create a copy of TournamentDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TournamentDetailImplCopyWith<_$TournamentDetailImpl> get copyWith =>
      __$$TournamentDetailImplCopyWithImpl<_$TournamentDetailImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TournamentDetailImplToJson(
      this,
    );
  }
}

abstract class _TournamentDetail implements TournamentDetail {
  const factory _TournamentDetail(
      {required final Tournament tournament,
      final List<Standing> standings}) = _$TournamentDetailImpl;

  factory _TournamentDetail.fromJson(Map<String, dynamic> json) =
      _$TournamentDetailImpl.fromJson;

  @override
  Tournament get tournament;
  @override
  List<Standing> get standings;

  /// Create a copy of TournamentDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TournamentDetailImplCopyWith<_$TournamentDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlayerProfile _$PlayerProfileFromJson(Map<String, dynamic> json) {
  return _PlayerProfile.fromJson(json);
}

/// @nodoc
mixin _$PlayerProfile {
  Player get player => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_series_rank')
  int? get currentSeriesRank => throw _privateConstructorUsedError;
  @JsonKey(name: 'current_series_points')
  double? get currentSeriesPoints => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_tournaments')
  int get totalTournaments => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_wins')
  int get totalWins => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_losses')
  int get totalLosses => throw _privateConstructorUsedError;
  @JsonKey(name: 'win_rate')
  double? get winRate => throw _privateConstructorUsedError;
  @JsonKey(name: 'best_finish')
  int? get bestFinish => throw _privateConstructorUsedError;
  @JsonKey(name: 'tournament_history')
  List<PlayerTournamentStats> get tournamentHistory =>
      throw _privateConstructorUsedError;

  /// Serializes this PlayerProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerProfileCopyWith<PlayerProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerProfileCopyWith<$Res> {
  factory $PlayerProfileCopyWith(
          PlayerProfile value, $Res Function(PlayerProfile) then) =
      _$PlayerProfileCopyWithImpl<$Res, PlayerProfile>;
  @useResult
  $Res call(
      {Player player,
      @JsonKey(name: 'current_series_rank') int? currentSeriesRank,
      @JsonKey(name: 'current_series_points') double? currentSeriesPoints,
      @JsonKey(name: 'total_tournaments') int totalTournaments,
      @JsonKey(name: 'total_wins') int totalWins,
      @JsonKey(name: 'total_losses') int totalLosses,
      @JsonKey(name: 'win_rate') double? winRate,
      @JsonKey(name: 'best_finish') int? bestFinish,
      @JsonKey(name: 'tournament_history')
      List<PlayerTournamentStats> tournamentHistory});

  $PlayerCopyWith<$Res> get player;
}

/// @nodoc
class _$PlayerProfileCopyWithImpl<$Res, $Val extends PlayerProfile>
    implements $PlayerProfileCopyWith<$Res> {
  _$PlayerProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? currentSeriesRank = freezed,
    Object? currentSeriesPoints = freezed,
    Object? totalTournaments = null,
    Object? totalWins = null,
    Object? totalLosses = null,
    Object? winRate = freezed,
    Object? bestFinish = freezed,
    Object? tournamentHistory = null,
  }) {
    return _then(_value.copyWith(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as Player,
      currentSeriesRank: freezed == currentSeriesRank
          ? _value.currentSeriesRank
          : currentSeriesRank // ignore: cast_nullable_to_non_nullable
              as int?,
      currentSeriesPoints: freezed == currentSeriesPoints
          ? _value.currentSeriesPoints
          : currentSeriesPoints // ignore: cast_nullable_to_non_nullable
              as double?,
      totalTournaments: null == totalTournaments
          ? _value.totalTournaments
          : totalTournaments // ignore: cast_nullable_to_non_nullable
              as int,
      totalWins: null == totalWins
          ? _value.totalWins
          : totalWins // ignore: cast_nullable_to_non_nullable
              as int,
      totalLosses: null == totalLosses
          ? _value.totalLosses
          : totalLosses // ignore: cast_nullable_to_non_nullable
              as int,
      winRate: freezed == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as double?,
      bestFinish: freezed == bestFinish
          ? _value.bestFinish
          : bestFinish // ignore: cast_nullable_to_non_nullable
              as int?,
      tournamentHistory: null == tournamentHistory
          ? _value.tournamentHistory
          : tournamentHistory // ignore: cast_nullable_to_non_nullable
              as List<PlayerTournamentStats>,
    ) as $Val);
  }

  /// Create a copy of PlayerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PlayerCopyWith<$Res> get player {
    return $PlayerCopyWith<$Res>(_value.player, (value) {
      return _then(_value.copyWith(player: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlayerProfileImplCopyWith<$Res>
    implements $PlayerProfileCopyWith<$Res> {
  factory _$$PlayerProfileImplCopyWith(
          _$PlayerProfileImpl value, $Res Function(_$PlayerProfileImpl) then) =
      __$$PlayerProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Player player,
      @JsonKey(name: 'current_series_rank') int? currentSeriesRank,
      @JsonKey(name: 'current_series_points') double? currentSeriesPoints,
      @JsonKey(name: 'total_tournaments') int totalTournaments,
      @JsonKey(name: 'total_wins') int totalWins,
      @JsonKey(name: 'total_losses') int totalLosses,
      @JsonKey(name: 'win_rate') double? winRate,
      @JsonKey(name: 'best_finish') int? bestFinish,
      @JsonKey(name: 'tournament_history')
      List<PlayerTournamentStats> tournamentHistory});

  @override
  $PlayerCopyWith<$Res> get player;
}

/// @nodoc
class __$$PlayerProfileImplCopyWithImpl<$Res>
    extends _$PlayerProfileCopyWithImpl<$Res, _$PlayerProfileImpl>
    implements _$$PlayerProfileImplCopyWith<$Res> {
  __$$PlayerProfileImplCopyWithImpl(
      _$PlayerProfileImpl _value, $Res Function(_$PlayerProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? player = null,
    Object? currentSeriesRank = freezed,
    Object? currentSeriesPoints = freezed,
    Object? totalTournaments = null,
    Object? totalWins = null,
    Object? totalLosses = null,
    Object? winRate = freezed,
    Object? bestFinish = freezed,
    Object? tournamentHistory = null,
  }) {
    return _then(_$PlayerProfileImpl(
      player: null == player
          ? _value.player
          : player // ignore: cast_nullable_to_non_nullable
              as Player,
      currentSeriesRank: freezed == currentSeriesRank
          ? _value.currentSeriesRank
          : currentSeriesRank // ignore: cast_nullable_to_non_nullable
              as int?,
      currentSeriesPoints: freezed == currentSeriesPoints
          ? _value.currentSeriesPoints
          : currentSeriesPoints // ignore: cast_nullable_to_non_nullable
              as double?,
      totalTournaments: null == totalTournaments
          ? _value.totalTournaments
          : totalTournaments // ignore: cast_nullable_to_non_nullable
              as int,
      totalWins: null == totalWins
          ? _value.totalWins
          : totalWins // ignore: cast_nullable_to_non_nullable
              as int,
      totalLosses: null == totalLosses
          ? _value.totalLosses
          : totalLosses // ignore: cast_nullable_to_non_nullable
              as int,
      winRate: freezed == winRate
          ? _value.winRate
          : winRate // ignore: cast_nullable_to_non_nullable
              as double?,
      bestFinish: freezed == bestFinish
          ? _value.bestFinish
          : bestFinish // ignore: cast_nullable_to_non_nullable
              as int?,
      tournamentHistory: null == tournamentHistory
          ? _value._tournamentHistory
          : tournamentHistory // ignore: cast_nullable_to_non_nullable
              as List<PlayerTournamentStats>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerProfileImpl implements _PlayerProfile {
  const _$PlayerProfileImpl(
      {required this.player,
      @JsonKey(name: 'current_series_rank') this.currentSeriesRank,
      @JsonKey(name: 'current_series_points') this.currentSeriesPoints,
      @JsonKey(name: 'total_tournaments') this.totalTournaments = 0,
      @JsonKey(name: 'total_wins') this.totalWins = 0,
      @JsonKey(name: 'total_losses') this.totalLosses = 0,
      @JsonKey(name: 'win_rate') this.winRate,
      @JsonKey(name: 'best_finish') this.bestFinish,
      @JsonKey(name: 'tournament_history')
      final List<PlayerTournamentStats> tournamentHistory = const []})
      : _tournamentHistory = tournamentHistory;

  factory _$PlayerProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerProfileImplFromJson(json);

  @override
  final Player player;
  @override
  @JsonKey(name: 'current_series_rank')
  final int? currentSeriesRank;
  @override
  @JsonKey(name: 'current_series_points')
  final double? currentSeriesPoints;
  @override
  @JsonKey(name: 'total_tournaments')
  final int totalTournaments;
  @override
  @JsonKey(name: 'total_wins')
  final int totalWins;
  @override
  @JsonKey(name: 'total_losses')
  final int totalLosses;
  @override
  @JsonKey(name: 'win_rate')
  final double? winRate;
  @override
  @JsonKey(name: 'best_finish')
  final int? bestFinish;
  final List<PlayerTournamentStats> _tournamentHistory;
  @override
  @JsonKey(name: 'tournament_history')
  List<PlayerTournamentStats> get tournamentHistory {
    if (_tournamentHistory is EqualUnmodifiableListView)
      return _tournamentHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tournamentHistory);
  }

  @override
  String toString() {
    return 'PlayerProfile(player: $player, currentSeriesRank: $currentSeriesRank, currentSeriesPoints: $currentSeriesPoints, totalTournaments: $totalTournaments, totalWins: $totalWins, totalLosses: $totalLosses, winRate: $winRate, bestFinish: $bestFinish, tournamentHistory: $tournamentHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerProfileImpl &&
            (identical(other.player, player) || other.player == player) &&
            (identical(other.currentSeriesRank, currentSeriesRank) ||
                other.currentSeriesRank == currentSeriesRank) &&
            (identical(other.currentSeriesPoints, currentSeriesPoints) ||
                other.currentSeriesPoints == currentSeriesPoints) &&
            (identical(other.totalTournaments, totalTournaments) ||
                other.totalTournaments == totalTournaments) &&
            (identical(other.totalWins, totalWins) ||
                other.totalWins == totalWins) &&
            (identical(other.totalLosses, totalLosses) ||
                other.totalLosses == totalLosses) &&
            (identical(other.winRate, winRate) || other.winRate == winRate) &&
            (identical(other.bestFinish, bestFinish) ||
                other.bestFinish == bestFinish) &&
            const DeepCollectionEquality()
                .equals(other._tournamentHistory, _tournamentHistory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      player,
      currentSeriesRank,
      currentSeriesPoints,
      totalTournaments,
      totalWins,
      totalLosses,
      winRate,
      bestFinish,
      const DeepCollectionEquality().hash(_tournamentHistory));

  /// Create a copy of PlayerProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerProfileImplCopyWith<_$PlayerProfileImpl> get copyWith =>
      __$$PlayerProfileImplCopyWithImpl<_$PlayerProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerProfileImplToJson(
      this,
    );
  }
}

abstract class _PlayerProfile implements PlayerProfile {
  const factory _PlayerProfile(
      {required final Player player,
      @JsonKey(name: 'current_series_rank') final int? currentSeriesRank,
      @JsonKey(name: 'current_series_points') final double? currentSeriesPoints,
      @JsonKey(name: 'total_tournaments') final int totalTournaments,
      @JsonKey(name: 'total_wins') final int totalWins,
      @JsonKey(name: 'total_losses') final int totalLosses,
      @JsonKey(name: 'win_rate') final double? winRate,
      @JsonKey(name: 'best_finish') final int? bestFinish,
      @JsonKey(name: 'tournament_history')
      final List<PlayerTournamentStats>
          tournamentHistory}) = _$PlayerProfileImpl;

  factory _PlayerProfile.fromJson(Map<String, dynamic> json) =
      _$PlayerProfileImpl.fromJson;

  @override
  Player get player;
  @override
  @JsonKey(name: 'current_series_rank')
  int? get currentSeriesRank;
  @override
  @JsonKey(name: 'current_series_points')
  double? get currentSeriesPoints;
  @override
  @JsonKey(name: 'total_tournaments')
  int get totalTournaments;
  @override
  @JsonKey(name: 'total_wins')
  int get totalWins;
  @override
  @JsonKey(name: 'total_losses')
  int get totalLosses;
  @override
  @JsonKey(name: 'win_rate')
  double? get winRate;
  @override
  @JsonKey(name: 'best_finish')
  int? get bestFinish;
  @override
  @JsonKey(name: 'tournament_history')
  List<PlayerTournamentStats> get tournamentHistory;

  /// Create a copy of PlayerProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerProfileImplCopyWith<_$PlayerProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PlayerTournamentStats _$PlayerTournamentStatsFromJson(
    Map<String, dynamic> json) {
  return _PlayerTournamentStats.fromJson(json);
}

/// @nodoc
mixin _$PlayerTournamentStats {
  @JsonKey(name: 'tournament_id')
  int get tournamentId => throw _privateConstructorUsedError;
  @JsonKey(name: 'tournament_name')
  String? get tournamentName => throw _privateConstructorUsedError;
  int? get rank => throw _privateConstructorUsedError;
  double? get points => throw _privateConstructorUsedError;
  int? get wins => throw _privateConstructorUsedError;
  int? get losses => throw _privateConstructorUsedError;
  String? get date => throw _privateConstructorUsedError;

  /// Serializes this PlayerTournamentStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PlayerTournamentStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PlayerTournamentStatsCopyWith<PlayerTournamentStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayerTournamentStatsCopyWith<$Res> {
  factory $PlayerTournamentStatsCopyWith(PlayerTournamentStats value,
          $Res Function(PlayerTournamentStats) then) =
      _$PlayerTournamentStatsCopyWithImpl<$Res, PlayerTournamentStats>;
  @useResult
  $Res call(
      {@JsonKey(name: 'tournament_id') int tournamentId,
      @JsonKey(name: 'tournament_name') String? tournamentName,
      int? rank,
      double? points,
      int? wins,
      int? losses,
      String? date});
}

/// @nodoc
class _$PlayerTournamentStatsCopyWithImpl<$Res,
        $Val extends PlayerTournamentStats>
    implements $PlayerTournamentStatsCopyWith<$Res> {
  _$PlayerTournamentStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PlayerTournamentStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tournamentId = null,
    Object? tournamentName = freezed,
    Object? rank = freezed,
    Object? points = freezed,
    Object? wins = freezed,
    Object? losses = freezed,
    Object? date = freezed,
  }) {
    return _then(_value.copyWith(
      tournamentId: null == tournamentId
          ? _value.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
      tournamentName: freezed == tournamentName
          ? _value.tournamentName
          : tournamentName // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as double?,
      wins: freezed == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int?,
      losses: freezed == losses
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PlayerTournamentStatsImplCopyWith<$Res>
    implements $PlayerTournamentStatsCopyWith<$Res> {
  factory _$$PlayerTournamentStatsImplCopyWith(
          _$PlayerTournamentStatsImpl value,
          $Res Function(_$PlayerTournamentStatsImpl) then) =
      __$$PlayerTournamentStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'tournament_id') int tournamentId,
      @JsonKey(name: 'tournament_name') String? tournamentName,
      int? rank,
      double? points,
      int? wins,
      int? losses,
      String? date});
}

/// @nodoc
class __$$PlayerTournamentStatsImplCopyWithImpl<$Res>
    extends _$PlayerTournamentStatsCopyWithImpl<$Res,
        _$PlayerTournamentStatsImpl>
    implements _$$PlayerTournamentStatsImplCopyWith<$Res> {
  __$$PlayerTournamentStatsImplCopyWithImpl(_$PlayerTournamentStatsImpl _value,
      $Res Function(_$PlayerTournamentStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of PlayerTournamentStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tournamentId = null,
    Object? tournamentName = freezed,
    Object? rank = freezed,
    Object? points = freezed,
    Object? wins = freezed,
    Object? losses = freezed,
    Object? date = freezed,
  }) {
    return _then(_$PlayerTournamentStatsImpl(
      tournamentId: null == tournamentId
          ? _value.tournamentId
          : tournamentId // ignore: cast_nullable_to_non_nullable
              as int,
      tournamentName: freezed == tournamentName
          ? _value.tournamentName
          : tournamentName // ignore: cast_nullable_to_non_nullable
              as String?,
      rank: freezed == rank
          ? _value.rank
          : rank // ignore: cast_nullable_to_non_nullable
              as int?,
      points: freezed == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as double?,
      wins: freezed == wins
          ? _value.wins
          : wins // ignore: cast_nullable_to_non_nullable
              as int?,
      losses: freezed == losses
          ? _value.losses
          : losses // ignore: cast_nullable_to_non_nullable
              as int?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayerTournamentStatsImpl implements _PlayerTournamentStats {
  const _$PlayerTournamentStatsImpl(
      {@JsonKey(name: 'tournament_id') required this.tournamentId,
      @JsonKey(name: 'tournament_name') this.tournamentName,
      this.rank,
      this.points,
      this.wins,
      this.losses,
      this.date});

  factory _$PlayerTournamentStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayerTournamentStatsImplFromJson(json);

  @override
  @JsonKey(name: 'tournament_id')
  final int tournamentId;
  @override
  @JsonKey(name: 'tournament_name')
  final String? tournamentName;
  @override
  final int? rank;
  @override
  final double? points;
  @override
  final int? wins;
  @override
  final int? losses;
  @override
  final String? date;

  @override
  String toString() {
    return 'PlayerTournamentStats(tournamentId: $tournamentId, tournamentName: $tournamentName, rank: $rank, points: $points, wins: $wins, losses: $losses, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayerTournamentStatsImpl &&
            (identical(other.tournamentId, tournamentId) ||
                other.tournamentId == tournamentId) &&
            (identical(other.tournamentName, tournamentName) ||
                other.tournamentName == tournamentName) &&
            (identical(other.rank, rank) || other.rank == rank) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.wins, wins) || other.wins == wins) &&
            (identical(other.losses, losses) || other.losses == losses) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, tournamentId, tournamentName,
      rank, points, wins, losses, date);

  /// Create a copy of PlayerTournamentStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayerTournamentStatsImplCopyWith<_$PlayerTournamentStatsImpl>
      get copyWith => __$$PlayerTournamentStatsImplCopyWithImpl<
          _$PlayerTournamentStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayerTournamentStatsImplToJson(
      this,
    );
  }
}

abstract class _PlayerTournamentStats implements PlayerTournamentStats {
  const factory _PlayerTournamentStats(
      {@JsonKey(name: 'tournament_id') required final int tournamentId,
      @JsonKey(name: 'tournament_name') final String? tournamentName,
      final int? rank,
      final double? points,
      final int? wins,
      final int? losses,
      final String? date}) = _$PlayerTournamentStatsImpl;

  factory _PlayerTournamentStats.fromJson(Map<String, dynamic> json) =
      _$PlayerTournamentStatsImpl.fromJson;

  @override
  @JsonKey(name: 'tournament_id')
  int get tournamentId;
  @override
  @JsonKey(name: 'tournament_name')
  String? get tournamentName;
  @override
  int? get rank;
  @override
  double? get points;
  @override
  int? get wins;
  @override
  int? get losses;
  @override
  String? get date;

  /// Create a copy of PlayerTournamentStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayerTournamentStatsImplCopyWith<_$PlayerTournamentStatsImpl>
      get copyWith => throw _privateConstructorUsedError;
}
