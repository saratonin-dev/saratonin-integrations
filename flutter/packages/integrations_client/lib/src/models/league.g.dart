// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'league.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeriesImpl _$$SeriesImplFromJson(Map<String, dynamic> json) => _$SeriesImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      status: json['status'] as String,
      tournamentCount: (json['tournament_count'] as num?)?.toInt(),
      startDate: json['start_date'] as String?,
      endDate: json['end_date'] as String?,
    );

Map<String, dynamic> _$$SeriesImplToJson(_$SeriesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'status': instance.status,
      'tournament_count': instance.tournamentCount,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
    };

_$TournamentImpl _$$TournamentImplFromJson(Map<String, dynamic> json) =>
    _$TournamentImpl(
      id: (json['id'] as num).toInt(),
      seriesId: (json['series_id'] as num?)?.toInt(),
      name: json['name'] as String,
      status: json['status'] as String,
      tournamentType: json['tournament_type'] as String?,
      playerCount: (json['player_count'] as num?)?.toInt(),
      startedAt: json['started_at'] as String?,
      completedAt: json['completed_at'] as String?,
    );

Map<String, dynamic> _$$TournamentImplToJson(_$TournamentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'series_id': instance.seriesId,
      'name': instance.name,
      'status': instance.status,
      'tournament_type': instance.tournamentType,
      'player_count': instance.playerCount,
      'started_at': instance.startedAt,
      'completed_at': instance.completedAt,
    };

_$PlayerImpl _$$PlayerImplFromJson(Map<String, dynamic> json) => _$PlayerImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      ifpaId: (json['ifpa_id'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PlayerImplToJson(_$PlayerImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'ifpa_id': instance.ifpaId,
    };

_$StandingImpl _$$StandingImplFromJson(Map<String, dynamic> json) =>
    _$StandingImpl(
      rank: (json['rank'] as num).toInt(),
      playerId: (json['player_id'] as num).toInt(),
      playerName: json['player_name'] as String,
      points: (json['points'] as num?)?.toDouble(),
      wins: (json['wins'] as num?)?.toInt(),
      losses: (json['losses'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$StandingImplToJson(_$StandingImpl instance) =>
    <String, dynamic>{
      'rank': instance.rank,
      'player_id': instance.playerId,
      'player_name': instance.playerName,
      'points': instance.points,
      'wins': instance.wins,
      'losses': instance.losses,
    };

_$LeagueOverviewImpl _$$LeagueOverviewImplFromJson(Map<String, dynamic> json) =>
    _$LeagueOverviewImpl(
      activeSeries: json['active_series'] == null
          ? null
          : Series.fromJson(json['active_series'] as Map<String, dynamic>),
      standings: (json['standings'] as List<dynamic>?)
              ?.map((e) => Standing.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      recentTournaments: (json['recent_tournaments'] as List<dynamic>?)
              ?.map((e) => Tournament.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      upcomingTournaments: (json['upcoming_tournaments'] as List<dynamic>?)
              ?.map((e) => Tournament.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
    );

Map<String, dynamic> _$$LeagueOverviewImplToJson(
        _$LeagueOverviewImpl instance) =>
    <String, dynamic>{
      'active_series': instance.activeSeries,
      'standings': instance.standings,
      'recent_tournaments': instance.recentTournaments,
      'upcoming_tournaments': instance.upcomingTournaments,
      'last_updated': instance.lastUpdated?.toIso8601String(),
    };

_$SeriesDetailImpl _$$SeriesDetailImplFromJson(Map<String, dynamic> json) =>
    _$SeriesDetailImpl(
      series: Series.fromJson(json['series'] as Map<String, dynamic>),
      standings: (json['standings'] as List<dynamic>?)
              ?.map((e) => Standing.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tournaments: (json['tournaments'] as List<dynamic>?)
              ?.map((e) => Tournament.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SeriesDetailImplToJson(_$SeriesDetailImpl instance) =>
    <String, dynamic>{
      'series': instance.series,
      'standings': instance.standings,
      'tournaments': instance.tournaments,
    };

_$TournamentDetailImpl _$$TournamentDetailImplFromJson(
        Map<String, dynamic> json) =>
    _$TournamentDetailImpl(
      tournament:
          Tournament.fromJson(json['tournament'] as Map<String, dynamic>),
      standings: (json['standings'] as List<dynamic>?)
              ?.map((e) => Standing.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TournamentDetailImplToJson(
        _$TournamentDetailImpl instance) =>
    <String, dynamic>{
      'tournament': instance.tournament,
      'standings': instance.standings,
    };

_$PlayerProfileImpl _$$PlayerProfileImplFromJson(Map<String, dynamic> json) =>
    _$PlayerProfileImpl(
      player: Player.fromJson(json['player'] as Map<String, dynamic>),
      currentSeriesRank: (json['current_series_rank'] as num?)?.toInt(),
      currentSeriesPoints: (json['current_series_points'] as num?)?.toDouble(),
      totalTournaments: (json['total_tournaments'] as num?)?.toInt() ?? 0,
      totalWins: (json['total_wins'] as num?)?.toInt() ?? 0,
      totalLosses: (json['total_losses'] as num?)?.toInt() ?? 0,
      winRate: (json['win_rate'] as num?)?.toDouble(),
      bestFinish: (json['best_finish'] as num?)?.toInt(),
      tournamentHistory: (json['tournament_history'] as List<dynamic>?)
              ?.map((e) =>
                  PlayerTournamentStats.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PlayerProfileImplToJson(_$PlayerProfileImpl instance) =>
    <String, dynamic>{
      'player': instance.player,
      'current_series_rank': instance.currentSeriesRank,
      'current_series_points': instance.currentSeriesPoints,
      'total_tournaments': instance.totalTournaments,
      'total_wins': instance.totalWins,
      'total_losses': instance.totalLosses,
      'win_rate': instance.winRate,
      'best_finish': instance.bestFinish,
      'tournament_history': instance.tournamentHistory,
    };

_$PlayerTournamentStatsImpl _$$PlayerTournamentStatsImplFromJson(
        Map<String, dynamic> json) =>
    _$PlayerTournamentStatsImpl(
      tournamentId: (json['tournament_id'] as num).toInt(),
      tournamentName: json['tournament_name'] as String?,
      rank: (json['rank'] as num?)?.toInt(),
      points: (json['points'] as num?)?.toDouble(),
      wins: (json['wins'] as num?)?.toInt(),
      losses: (json['losses'] as num?)?.toInt(),
      date: json['date'] as String?,
    );

Map<String, dynamic> _$$PlayerTournamentStatsImplToJson(
        _$PlayerTournamentStatsImpl instance) =>
    <String, dynamic>{
      'tournament_id': instance.tournamentId,
      'tournament_name': instance.tournamentName,
      'rank': instance.rank,
      'points': instance.points,
      'wins': instance.wins,
      'losses': instance.losses,
      'date': instance.date,
    };
