// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'machine.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MachineImpl _$$MachineImplFromJson(Map<String, dynamic> json) =>
    _$MachineImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String?,
      year: (json['year'] as num?)?.toInt(),
      ipdbLink: json['ipdb_link'] as String?,
      opdbId: json['opdb_id'] as String?,
      machineType: json['machine_type'] as String?,
      displayType: json['display_type'] as String?,
      playerCount: (json['player_count'] as num?)?.toInt(),
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => MachineImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tips: json['tips'] == null
          ? null
          : Pintips.fromJson(json['tips'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$MachineImplToJson(_$MachineImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'manufacturer': instance.manufacturer,
      'year': instance.year,
      'ipdb_link': instance.ipdbLink,
      'opdb_id': instance.opdbId,
      'machine_type': instance.machineType,
      'display_type': instance.displayType,
      'player_count': instance.playerCount,
      'features': instance.features,
      'description': instance.description,
      'images': instance.images,
      'tips': instance.tips,
    };

_$MachineImageImpl _$$MachineImageImplFromJson(Map<String, dynamic> json) =>
    _$MachineImageImpl(
      url: json['url'] as String,
      imageType: json['image_type'] as String?,
      width: (json['width'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$MachineImageImplToJson(_$MachineImageImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
      'image_type': instance.imageType,
      'width': instance.width,
      'height': instance.height,
    };

_$PintipsImpl _$$PintipsImplFromJson(Map<String, dynamic> json) =>
    _$PintipsImpl(
      opdbId: json['opdb_id'] as String,
      name: json['name'] as String,
      sections: (json['sections'] as List<dynamic>?)
              ?.map((e) => TipsSection.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PintipsImplToJson(_$PintipsImpl instance) =>
    <String, dynamic>{
      'opdb_id': instance.opdbId,
      'name': instance.name,
      'sections': instance.sections,
    };

_$TipsSectionImpl _$$TipsSectionImplFromJson(Map<String, dynamic> json) =>
    _$TipsSectionImpl(
      title: json['title'] as String,
      content: (json['content'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      subsections: (json['subsections'] as List<dynamic>?)
              ?.map((e) => TipsSection.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$TipsSectionImplToJson(_$TipsSectionImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'subsections': instance.subsections,
    };

_$MachinesResponseImpl _$$MachinesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MachinesResponseImpl(
      machines: (json['machines'] as List<dynamic>)
          .map((e) => Machine.fromJson(e as Map<String, dynamic>))
          .toList(),
      machineCount: (json['machine_count'] as num).toInt(),
      lastSynced: json['last_synced'] == null
          ? null
          : DateTime.parse(json['last_synced'] as String),
    );

Map<String, dynamic> _$$MachinesResponseImplToJson(
        _$MachinesResponseImpl instance) =>
    <String, dynamic>{
      'machines': instance.machines,
      'machine_count': instance.machineCount,
      'last_synced': instance.lastSynced?.toIso8601String(),
    };

_$FavoriteInfoImpl _$$FavoriteInfoImplFromJson(Map<String, dynamic> json) =>
    _$FavoriteInfoImpl(
      userId: json['user_id'] as String,
      userName: json['user_name'] as String?,
    );

Map<String, dynamic> _$$FavoriteInfoImplToJson(_$FavoriteInfoImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'user_name': instance.userName,
    };

_$MachineWithFavoritesImpl _$$MachineWithFavoritesImplFromJson(
        Map<String, dynamic> json) =>
    _$MachineWithFavoritesImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      manufacturer: json['manufacturer'] as String?,
      year: (json['year'] as num?)?.toInt(),
      ipdbLink: json['ipdb_link'] as String?,
      opdbId: json['opdb_id'] as String?,
      machineType: json['machine_type'] as String?,
      displayType: json['display_type'] as String?,
      playerCount: (json['player_count'] as num?)?.toInt(),
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      description: json['description'] as String?,
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => MachineImage.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      tips: json['tips'] == null
          ? null
          : Pintips.fromJson(json['tips'] as Map<String, dynamic>),
      favoritedBy: (json['favorited_by'] as List<dynamic>?)
              ?.map((e) => FavoriteInfo.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MachineWithFavoritesImplToJson(
        _$MachineWithFavoritesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'manufacturer': instance.manufacturer,
      'year': instance.year,
      'ipdb_link': instance.ipdbLink,
      'opdb_id': instance.opdbId,
      'machine_type': instance.machineType,
      'display_type': instance.displayType,
      'player_count': instance.playerCount,
      'features': instance.features,
      'description': instance.description,
      'images': instance.images,
      'tips': instance.tips,
      'favorited_by': instance.favoritedBy,
    };

_$MachinesWithFavoritesResponseImpl
    _$$MachinesWithFavoritesResponseImplFromJson(Map<String, dynamic> json) =>
        _$MachinesWithFavoritesResponseImpl(
          machines: (json['machines'] as List<dynamic>)
              .map((e) =>
                  MachineWithFavorites.fromJson(e as Map<String, dynamic>))
              .toList(),
          machineCount: (json['machine_count'] as num).toInt(),
          lastSynced: json['last_synced'] == null
              ? null
              : DateTime.parse(json['last_synced'] as String),
        );

Map<String, dynamic> _$$MachinesWithFavoritesResponseImplToJson(
        _$MachinesWithFavoritesResponseImpl instance) =>
    <String, dynamic>{
      'machines': instance.machines,
      'machine_count': instance.machineCount,
      'last_synced': instance.lastSynced?.toIso8601String(),
    };
