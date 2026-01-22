/// Local high score models.
library;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'score.freezed.dart';
part 'score.g.dart';

/// A local high score entry.
@freezed
class LocalScore with _$LocalScore {
  const factory LocalScore({
    required String id,
    @JsonKey(name: 'machine_id') required String machineId,
    @JsonKey(name: 'player_name') required String playerName,
    required int score,
    required DateTime timestamp,
  }) = _LocalScore;

  factory LocalScore.fromJson(Map<String, dynamic> json) =>
      _$LocalScoreFromJson(json);
}

/// Response after submitting a score.
@freezed
class SubmitScoreResponse with _$SubmitScoreResponse {
  const factory SubmitScoreResponse({
    required LocalScore score,
    int? rank,
  }) = _SubmitScoreResponse;

  factory SubmitScoreResponse.fromJson(Map<String, dynamic> json) =>
      _$SubmitScoreResponseFromJson(json);
}
