/// Pinball machine data models.

import 'package:freezed_annotation/freezed_annotation.dart';

part 'machine.freezed.dart';
part 'machine.g.dart';

/// A pinball machine with enriched data.
@freezed
class Machine with _$Machine {
  const factory Machine({
    /// Unique identifier (e.g., "pm_12345" for Pinball Map sourced machines).
    required String id,

    /// Machine name.
    required String name,

    /// Manufacturer (e.g., "Williams", "Stern").
    String? manufacturer,

    /// Year of manufacture.
    int? year,

    /// IPDB link.
    @JsonKey(name: 'ipdb_link') String? ipdbLink,

    /// OPDB ID for enrichment lookup.
    @JsonKey(name: 'opdb_id') String? opdbId,

    /// Machine type (e.g., "Solid State", "Electromechanical").
    @JsonKey(name: 'machine_type') String? machineType,

    /// Display type (e.g., "DMD", "LCD", "Alphanumeric").
    @JsonKey(name: 'display_type') String? displayType,

    /// Number of players.
    @JsonKey(name: 'player_count') int? playerCount,

    /// Features (e.g., "multiball", "video_mode").
    @Default([]) List<String> features,

    /// Description from OPDB.
    String? description,

    /// Images from OPDB.
    @Default([]) List<MachineImage> images,

    /// Strategy tips from Pintips/Pinball Primer.
    Pintips? tips,
  }) = _Machine;

  factory Machine.fromJson(Map<String, dynamic> json) =>
      _$MachineFromJson(json);
}

/// Machine image.
@freezed
class MachineImage with _$MachineImage {
  const factory MachineImage({
    required String url,
    @JsonKey(name: 'image_type') String? imageType,
    int? width,
    int? height,
  }) = _MachineImage;

  factory MachineImage.fromJson(Map<String, dynamic> json) =>
      _$MachineImageFromJson(json);
}

/// Strategy tips for a pinball machine.
@freezed
class Pintips with _$Pintips {
  const factory Pintips({
    /// OPDB ID.
    @JsonKey(name: 'opdb_id') required String opdbId,

    /// Machine name.
    required String name,

    /// Sections of tips.
    @Default([]) List<TipsSection> sections,
  }) = _Pintips;

  factory Pintips.fromJson(Map<String, dynamic> json) =>
      _$PintipsFromJson(json);
}

/// A section of strategy tips.
@freezed
class TipsSection with _$TipsSection {
  const factory TipsSection({
    /// Section title.
    required String title,

    /// Content paragraphs or list items.
    @Default([]) List<String> content,

    /// Subsections.
    @Default([]) List<TipsSection> subsections,
  }) = _TipsSection;

  factory TipsSection.fromJson(Map<String, dynamic> json) =>
      _$TipsSectionFromJson(json);
}

/// Response containing multiple machines.
@freezed
class MachinesResponse with _$MachinesResponse {
  const factory MachinesResponse({
    required List<Machine> machines,
    @JsonKey(name: 'machine_count') required int machineCount,
    @JsonKey(name: 'last_synced') DateTime? lastSynced,
  }) = _MachinesResponse;

  factory MachinesResponse.fromJson(Map<String, dynamic> json) =>
      _$MachinesResponseFromJson(json);
}

/// A machine with favorite count information.
@freezed
class MachineWithFavorites with _$MachineWithFavorites {
  const factory MachineWithFavorites({
    /// Unique identifier.
    required String id,

    /// Machine name.
    required String name,

    /// Manufacturer.
    String? manufacturer,

    /// Year of manufacture.
    int? year,

    /// IPDB link.
    @JsonKey(name: 'ipdb_link') String? ipdbLink,

    /// OPDB ID.
    @JsonKey(name: 'opdb_id') String? opdbId,

    /// Machine type.
    @JsonKey(name: 'machine_type') String? machineType,

    /// Display type.
    @JsonKey(name: 'display_type') String? displayType,

    /// Number of players.
    @JsonKey(name: 'player_count') int? playerCount,

    /// Features.
    @Default([]) List<String> features,

    /// Description.
    String? description,

    /// Images.
    @Default([]) List<MachineImage> images,

    /// Strategy tips.
    Pintips? tips,

    /// Number of users who favorited this machine.
    @JsonKey(name: 'favorite_count') @Default(0) int favoriteCount,
  }) = _MachineWithFavorites;

  factory MachineWithFavorites.fromJson(Map<String, dynamic> json) =>
      _$MachineWithFavoritesFromJson(json);
}

/// Response containing multiple machines with favorites.
@freezed
class MachinesWithFavoritesResponse with _$MachinesWithFavoritesResponse {
  const factory MachinesWithFavoritesResponse({
    required List<MachineWithFavorites> machines,
    @JsonKey(name: 'machine_count') required int machineCount,
  }) = _MachinesWithFavoritesResponse;

  factory MachinesWithFavoritesResponse.fromJson(Map<String, dynamic> json) =>
      _$MachinesWithFavoritesResponseFromJson(json);
}
