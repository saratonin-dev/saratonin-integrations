/// Pinball league data models.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'league.freezed.dart';
part 'league.g.dart';

/// A league series (seasonal competition).
@freezed
class Series with _$Series {
  const factory Series({
    required int id,
    required String name,
    required String status,
    @JsonKey(name: 'tournament_count') int? tournamentCount,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
  }) = _Series;

  factory Series.fromJson(Map<String, dynamic> json) => _$SeriesFromJson(json);
}

/// A tournament event.
@freezed
class Tournament with _$Tournament {
  const factory Tournament({
    required int id,
    @JsonKey(name: 'series_id') int? seriesId,
    required String name,
    required String status,
    @JsonKey(name: 'tournament_type') String? tournamentType,
    @JsonKey(name: 'player_count') int? playerCount,
    @JsonKey(name: 'started_at') String? startedAt,
    @JsonKey(name: 'completed_at') String? completedAt,
  }) = _Tournament;

  factory Tournament.fromJson(Map<String, dynamic> json) =>
      _$TournamentFromJson(json);
}

/// A player in the league.
@freezed
class Player with _$Player {
  const factory Player({
    required int id,
    required String name,
    @JsonKey(name: 'ifpa_id') int? ifpaId,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}

/// A standing in a series or tournament.
@freezed
class Standing with _$Standing {
  const factory Standing({
    required int rank,
    @JsonKey(name: 'player_id') required int playerId,
    @JsonKey(name: 'player_name') required String playerName,
    double? points,
    int? wins,
    int? losses,
  }) = _Standing;

  factory Standing.fromJson(Map<String, dynamic> json) =>
      _$StandingFromJson(json);
}

/// Overview of a league location.
@freezed
class LeagueOverview with _$LeagueOverview {
  const factory LeagueOverview({
    @JsonKey(name: 'active_series') Series? activeSeries,
    @Default([]) List<Standing> standings,
    @JsonKey(name: 'recent_tournaments') @Default([]) List<Tournament> recentTournaments,
    @JsonKey(name: 'upcoming_tournaments') @Default([]) List<Tournament> upcomingTournaments,
    @JsonKey(name: 'last_updated') DateTime? lastUpdated,
  }) = _LeagueOverview;

  factory LeagueOverview.fromJson(Map<String, dynamic> json) =>
      _$LeagueOverviewFromJson(json);
}

/// Detailed view of a series.
@freezed
class SeriesDetail with _$SeriesDetail {
  const factory SeriesDetail({
    required Series series,
    @Default([]) List<Standing> standings,
    @Default([]) List<Tournament> tournaments,
  }) = _SeriesDetail;

  factory SeriesDetail.fromJson(Map<String, dynamic> json) =>
      _$SeriesDetailFromJson(json);
}

/// Detailed view of a tournament.
@freezed
class TournamentDetail with _$TournamentDetail {
  const factory TournamentDetail({
    required Tournament tournament,
    @Default([]) List<Standing> standings,
  }) = _TournamentDetail;

  factory TournamentDetail.fromJson(Map<String, dynamic> json) =>
      _$TournamentDetailFromJson(json);
}

/// Player profile with aggregated stats.
@freezed
class PlayerProfile with _$PlayerProfile {
  const factory PlayerProfile({
    required Player player,
    @JsonKey(name: 'current_series_rank') int? currentSeriesRank,
    @JsonKey(name: 'current_series_points') double? currentSeriesPoints,
    @JsonKey(name: 'total_tournaments') @Default(0) int totalTournaments,
    @JsonKey(name: 'total_wins') @Default(0) int totalWins,
    @JsonKey(name: 'total_losses') @Default(0) int totalLosses,
    @JsonKey(name: 'win_rate') double? winRate,
    @JsonKey(name: 'best_finish') int? bestFinish,
    @JsonKey(name: 'tournament_history') @Default([]) List<PlayerTournamentStats> tournamentHistory,
  }) = _PlayerProfile;

  factory PlayerProfile.fromJson(Map<String, dynamic> json) =>
      _$PlayerProfileFromJson(json);
}

/// Player stats for a single tournament.
@freezed
class PlayerTournamentStats with _$PlayerTournamentStats {
  const factory PlayerTournamentStats({
    @JsonKey(name: 'tournament_id') required int tournamentId,
    @JsonKey(name: 'tournament_name') String? tournamentName,
    int? rank,
    double? points,
    int? wins,
    int? losses,
    String? date,
  }) = _PlayerTournamentStats;

  factory PlayerTournamentStats.fromJson(Map<String, dynamic> json) =>
      _$PlayerTournamentStatsFromJson(json);
}
