// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'score.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LocalScoreImpl _$$LocalScoreImplFromJson(Map<String, dynamic> json) =>
    _$LocalScoreImpl(
      id: json['id'] as String,
      machineId: json['machine_id'] as String,
      playerName: json['player_name'] as String,
      score: (json['score'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$$LocalScoreImplToJson(_$LocalScoreImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'machine_id': instance.machineId,
      'player_name': instance.playerName,
      'score': instance.score,
      'timestamp': instance.timestamp.toIso8601String(),
    };

_$SubmitScoreResponseImpl _$$SubmitScoreResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SubmitScoreResponseImpl(
      score: LocalScore.fromJson(json['score'] as Map<String, dynamic>),
      rank: (json['rank'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$SubmitScoreResponseImplToJson(
        _$SubmitScoreResponseImpl instance) =>
    <String, dynamic>{
      'score': instance.score,
      'rank': instance.rank,
    };
