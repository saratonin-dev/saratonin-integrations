// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'machine.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Machine _$MachineFromJson(Map<String, dynamic> json) {
  return _Machine.fromJson(json);
}

/// @nodoc
mixin _$Machine {
  /// Unique identifier (e.g., "pm_12345" for Pinball Map sourced machines).
  String get id => throw _privateConstructorUsedError;

  /// Machine name.
  String get name => throw _privateConstructorUsedError;

  /// Manufacturer (e.g., "Williams", "Stern").
  String? get manufacturer => throw _privateConstructorUsedError;

  /// Year of manufacture.
  int? get year => throw _privateConstructorUsedError;

  /// IPDB link.
  @JsonKey(name: 'ipdb_link')
  String? get ipdbLink => throw _privateConstructorUsedError;

  /// OPDB ID for enrichment lookup.
  @JsonKey(name: 'opdb_id')
  String? get opdbId => throw _privateConstructorUsedError;

  /// Machine type (e.g., "Solid State", "Electromechanical").
  @JsonKey(name: 'machine_type')
  String? get machineType => throw _privateConstructorUsedError;

  /// Display type (e.g., "DMD", "LCD", "Alphanumeric").
  @JsonKey(name: 'display_type')
  String? get displayType => throw _privateConstructorUsedError;

  /// Number of players.
  @JsonKey(name: 'player_count')
  int? get playerCount => throw _privateConstructorUsedError;

  /// Features (e.g., "multiball", "video_mode").
  List<String> get features => throw _privateConstructorUsedError;

  /// Description from OPDB.
  String? get description => throw _privateConstructorUsedError;

  /// Images from OPDB.
  List<MachineImage> get images => throw _privateConstructorUsedError;

  /// Strategy tips from Pintips/Pinball Primer.
  Pintips? get tips => throw _privateConstructorUsedError;

  /// Serializes this Machine to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Machine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MachineCopyWith<Machine> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachineCopyWith<$Res> {
  factory $MachineCopyWith(Machine value, $Res Function(Machine) then) =
      _$MachineCopyWithImpl<$Res, Machine>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? manufacturer,
      int? year,
      @JsonKey(name: 'ipdb_link') String? ipdbLink,
      @JsonKey(name: 'opdb_id') String? opdbId,
      @JsonKey(name: 'machine_type') String? machineType,
      @JsonKey(name: 'display_type') String? displayType,
      @JsonKey(name: 'player_count') int? playerCount,
      List<String> features,
      String? description,
      List<MachineImage> images,
      Pintips? tips});

  $PintipsCopyWith<$Res>? get tips;
}

/// @nodoc
class _$MachineCopyWithImpl<$Res, $Val extends Machine>
    implements $MachineCopyWith<$Res> {
  _$MachineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Machine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? manufacturer = freezed,
    Object? year = freezed,
    Object? ipdbLink = freezed,
    Object? opdbId = freezed,
    Object? machineType = freezed,
    Object? displayType = freezed,
    Object? playerCount = freezed,
    Object? features = null,
    Object? description = freezed,
    Object? images = null,
    Object? tips = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      ipdbLink: freezed == ipdbLink
          ? _value.ipdbLink
          : ipdbLink // ignore: cast_nullable_to_non_nullable
              as String?,
      opdbId: freezed == opdbId
          ? _value.opdbId
          : opdbId // ignore: cast_nullable_to_non_nullable
              as String?,
      machineType: freezed == machineType
          ? _value.machineType
          : machineType // ignore: cast_nullable_to_non_nullable
              as String?,
      displayType: freezed == displayType
          ? _value.displayType
          : displayType // ignore: cast_nullable_to_non_nullable
              as String?,
      playerCount: freezed == playerCount
          ? _value.playerCount
          : playerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<MachineImage>,
      tips: freezed == tips
          ? _value.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as Pintips?,
    ) as $Val);
  }

  /// Create a copy of Machine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PintipsCopyWith<$Res>? get tips {
    if (_value.tips == null) {
      return null;
    }

    return $PintipsCopyWith<$Res>(_value.tips!, (value) {
      return _then(_value.copyWith(tips: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MachineImplCopyWith<$Res> implements $MachineCopyWith<$Res> {
  factory _$$MachineImplCopyWith(
          _$MachineImpl value, $Res Function(_$MachineImpl) then) =
      __$$MachineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? manufacturer,
      int? year,
      @JsonKey(name: 'ipdb_link') String? ipdbLink,
      @JsonKey(name: 'opdb_id') String? opdbId,
      @JsonKey(name: 'machine_type') String? machineType,
      @JsonKey(name: 'display_type') String? displayType,
      @JsonKey(name: 'player_count') int? playerCount,
      List<String> features,
      String? description,
      List<MachineImage> images,
      Pintips? tips});

  @override
  $PintipsCopyWith<$Res>? get tips;
}

/// @nodoc
class __$$MachineImplCopyWithImpl<$Res>
    extends _$MachineCopyWithImpl<$Res, _$MachineImpl>
    implements _$$MachineImplCopyWith<$Res> {
  __$$MachineImplCopyWithImpl(
      _$MachineImpl _value, $Res Function(_$MachineImpl) _then)
      : super(_value, _then);

  /// Create a copy of Machine
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? manufacturer = freezed,
    Object? year = freezed,
    Object? ipdbLink = freezed,
    Object? opdbId = freezed,
    Object? machineType = freezed,
    Object? displayType = freezed,
    Object? playerCount = freezed,
    Object? features = null,
    Object? description = freezed,
    Object? images = null,
    Object? tips = freezed,
  }) {
    return _then(_$MachineImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      ipdbLink: freezed == ipdbLink
          ? _value.ipdbLink
          : ipdbLink // ignore: cast_nullable_to_non_nullable
              as String?,
      opdbId: freezed == opdbId
          ? _value.opdbId
          : opdbId // ignore: cast_nullable_to_non_nullable
              as String?,
      machineType: freezed == machineType
          ? _value.machineType
          : machineType // ignore: cast_nullable_to_non_nullable
              as String?,
      displayType: freezed == displayType
          ? _value.displayType
          : displayType // ignore: cast_nullable_to_non_nullable
              as String?,
      playerCount: freezed == playerCount
          ? _value.playerCount
          : playerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<MachineImage>,
      tips: freezed == tips
          ? _value.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as Pintips?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MachineImpl implements _Machine {
  const _$MachineImpl(
      {required this.id,
      required this.name,
      this.manufacturer,
      this.year,
      @JsonKey(name: 'ipdb_link') this.ipdbLink,
      @JsonKey(name: 'opdb_id') this.opdbId,
      @JsonKey(name: 'machine_type') this.machineType,
      @JsonKey(name: 'display_type') this.displayType,
      @JsonKey(name: 'player_count') this.playerCount,
      final List<String> features = const [],
      this.description,
      final List<MachineImage> images = const [],
      this.tips})
      : _features = features,
        _images = images;

  factory _$MachineImpl.fromJson(Map<String, dynamic> json) =>
      _$$MachineImplFromJson(json);

  /// Unique identifier (e.g., "pm_12345" for Pinball Map sourced machines).
  @override
  final String id;

  /// Machine name.
  @override
  final String name;

  /// Manufacturer (e.g., "Williams", "Stern").
  @override
  final String? manufacturer;

  /// Year of manufacture.
  @override
  final int? year;

  /// IPDB link.
  @override
  @JsonKey(name: 'ipdb_link')
  final String? ipdbLink;

  /// OPDB ID for enrichment lookup.
  @override
  @JsonKey(name: 'opdb_id')
  final String? opdbId;

  /// Machine type (e.g., "Solid State", "Electromechanical").
  @override
  @JsonKey(name: 'machine_type')
  final String? machineType;

  /// Display type (e.g., "DMD", "LCD", "Alphanumeric").
  @override
  @JsonKey(name: 'display_type')
  final String? displayType;

  /// Number of players.
  @override
  @JsonKey(name: 'player_count')
  final int? playerCount;

  /// Features (e.g., "multiball", "video_mode").
  final List<String> _features;

  /// Features (e.g., "multiball", "video_mode").
  @override
  @JsonKey()
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  /// Description from OPDB.
  @override
  final String? description;

  /// Images from OPDB.
  final List<MachineImage> _images;

  /// Images from OPDB.
  @override
  @JsonKey()
  List<MachineImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  /// Strategy tips from Pintips/Pinball Primer.
  @override
  final Pintips? tips;

  @override
  String toString() {
    return 'Machine(id: $id, name: $name, manufacturer: $manufacturer, year: $year, ipdbLink: $ipdbLink, opdbId: $opdbId, machineType: $machineType, displayType: $displayType, playerCount: $playerCount, features: $features, description: $description, images: $images, tips: $tips)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MachineImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.ipdbLink, ipdbLink) ||
                other.ipdbLink == ipdbLink) &&
            (identical(other.opdbId, opdbId) || other.opdbId == opdbId) &&
            (identical(other.machineType, machineType) ||
                other.machineType == machineType) &&
            (identical(other.displayType, displayType) ||
                other.displayType == displayType) &&
            (identical(other.playerCount, playerCount) ||
                other.playerCount == playerCount) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.tips, tips) || other.tips == tips));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      manufacturer,
      year,
      ipdbLink,
      opdbId,
      machineType,
      displayType,
      playerCount,
      const DeepCollectionEquality().hash(_features),
      description,
      const DeepCollectionEquality().hash(_images),
      tips);

  /// Create a copy of Machine
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MachineImplCopyWith<_$MachineImpl> get copyWith =>
      __$$MachineImplCopyWithImpl<_$MachineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MachineImplToJson(
      this,
    );
  }
}

abstract class _Machine implements Machine {
  const factory _Machine(
      {required final String id,
      required final String name,
      final String? manufacturer,
      final int? year,
      @JsonKey(name: 'ipdb_link') final String? ipdbLink,
      @JsonKey(name: 'opdb_id') final String? opdbId,
      @JsonKey(name: 'machine_type') final String? machineType,
      @JsonKey(name: 'display_type') final String? displayType,
      @JsonKey(name: 'player_count') final int? playerCount,
      final List<String> features,
      final String? description,
      final List<MachineImage> images,
      final Pintips? tips}) = _$MachineImpl;

  factory _Machine.fromJson(Map<String, dynamic> json) = _$MachineImpl.fromJson;

  /// Unique identifier (e.g., "pm_12345" for Pinball Map sourced machines).
  @override
  String get id;

  /// Machine name.
  @override
  String get name;

  /// Manufacturer (e.g., "Williams", "Stern").
  @override
  String? get manufacturer;

  /// Year of manufacture.
  @override
  int? get year;

  /// IPDB link.
  @override
  @JsonKey(name: 'ipdb_link')
  String? get ipdbLink;

  /// OPDB ID for enrichment lookup.
  @override
  @JsonKey(name: 'opdb_id')
  String? get opdbId;

  /// Machine type (e.g., "Solid State", "Electromechanical").
  @override
  @JsonKey(name: 'machine_type')
  String? get machineType;

  /// Display type (e.g., "DMD", "LCD", "Alphanumeric").
  @override
  @JsonKey(name: 'display_type')
  String? get displayType;

  /// Number of players.
  @override
  @JsonKey(name: 'player_count')
  int? get playerCount;

  /// Features (e.g., "multiball", "video_mode").
  @override
  List<String> get features;

  /// Description from OPDB.
  @override
  String? get description;

  /// Images from OPDB.
  @override
  List<MachineImage> get images;

  /// Strategy tips from Pintips/Pinball Primer.
  @override
  Pintips? get tips;

  /// Create a copy of Machine
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MachineImplCopyWith<_$MachineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MachineImage _$MachineImageFromJson(Map<String, dynamic> json) {
  return _MachineImage.fromJson(json);
}

/// @nodoc
mixin _$MachineImage {
  String get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'image_type')
  String? get imageType => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;

  /// Serializes this MachineImage to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MachineImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MachineImageCopyWith<MachineImage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachineImageCopyWith<$Res> {
  factory $MachineImageCopyWith(
          MachineImage value, $Res Function(MachineImage) then) =
      _$MachineImageCopyWithImpl<$Res, MachineImage>;
  @useResult
  $Res call(
      {String url,
      @JsonKey(name: 'image_type') String? imageType,
      int? width,
      int? height});
}

/// @nodoc
class _$MachineImageCopyWithImpl<$Res, $Val extends MachineImage>
    implements $MachineImageCopyWith<$Res> {
  _$MachineImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MachineImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? imageType = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      imageType: freezed == imageType
          ? _value.imageType
          : imageType // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MachineImageImplCopyWith<$Res>
    implements $MachineImageCopyWith<$Res> {
  factory _$$MachineImageImplCopyWith(
          _$MachineImageImpl value, $Res Function(_$MachineImageImpl) then) =
      __$$MachineImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String url,
      @JsonKey(name: 'image_type') String? imageType,
      int? width,
      int? height});
}

/// @nodoc
class __$$MachineImageImplCopyWithImpl<$Res>
    extends _$MachineImageCopyWithImpl<$Res, _$MachineImageImpl>
    implements _$$MachineImageImplCopyWith<$Res> {
  __$$MachineImageImplCopyWithImpl(
      _$MachineImageImpl _value, $Res Function(_$MachineImageImpl) _then)
      : super(_value, _then);

  /// Create a copy of MachineImage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? imageType = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_$MachineImageImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      imageType: freezed == imageType
          ? _value.imageType
          : imageType // ignore: cast_nullable_to_non_nullable
              as String?,
      width: freezed == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MachineImageImpl implements _MachineImage {
  const _$MachineImageImpl(
      {required this.url,
      @JsonKey(name: 'image_type') this.imageType,
      this.width,
      this.height});

  factory _$MachineImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MachineImageImplFromJson(json);

  @override
  final String url;
  @override
  @JsonKey(name: 'image_type')
  final String? imageType;
  @override
  final int? width;
  @override
  final int? height;

  @override
  String toString() {
    return 'MachineImage(url: $url, imageType: $imageType, width: $width, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MachineImageImpl &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.imageType, imageType) ||
                other.imageType == imageType) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, url, imageType, width, height);

  /// Create a copy of MachineImage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MachineImageImplCopyWith<_$MachineImageImpl> get copyWith =>
      __$$MachineImageImplCopyWithImpl<_$MachineImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MachineImageImplToJson(
      this,
    );
  }
}

abstract class _MachineImage implements MachineImage {
  const factory _MachineImage(
      {required final String url,
      @JsonKey(name: 'image_type') final String? imageType,
      final int? width,
      final int? height}) = _$MachineImageImpl;

  factory _MachineImage.fromJson(Map<String, dynamic> json) =
      _$MachineImageImpl.fromJson;

  @override
  String get url;
  @override
  @JsonKey(name: 'image_type')
  String? get imageType;
  @override
  int? get width;
  @override
  int? get height;

  /// Create a copy of MachineImage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MachineImageImplCopyWith<_$MachineImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Pintips _$PintipsFromJson(Map<String, dynamic> json) {
  return _Pintips.fromJson(json);
}

/// @nodoc
mixin _$Pintips {
  /// OPDB ID.
  @JsonKey(name: 'opdb_id')
  String get opdbId => throw _privateConstructorUsedError;

  /// Machine name.
  String get name => throw _privateConstructorUsedError;

  /// Sections of tips.
  List<TipsSection> get sections => throw _privateConstructorUsedError;

  /// Serializes this Pintips to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Pintips
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PintipsCopyWith<Pintips> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PintipsCopyWith<$Res> {
  factory $PintipsCopyWith(Pintips value, $Res Function(Pintips) then) =
      _$PintipsCopyWithImpl<$Res, Pintips>;
  @useResult
  $Res call(
      {@JsonKey(name: 'opdb_id') String opdbId,
      String name,
      List<TipsSection> sections});
}

/// @nodoc
class _$PintipsCopyWithImpl<$Res, $Val extends Pintips>
    implements $PintipsCopyWith<$Res> {
  _$PintipsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Pintips
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opdbId = null,
    Object? name = null,
    Object? sections = null,
  }) {
    return _then(_value.copyWith(
      opdbId: null == opdbId
          ? _value.opdbId
          : opdbId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sections: null == sections
          ? _value.sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<TipsSection>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PintipsImplCopyWith<$Res> implements $PintipsCopyWith<$Res> {
  factory _$$PintipsImplCopyWith(
          _$PintipsImpl value, $Res Function(_$PintipsImpl) then) =
      __$$PintipsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'opdb_id') String opdbId,
      String name,
      List<TipsSection> sections});
}

/// @nodoc
class __$$PintipsImplCopyWithImpl<$Res>
    extends _$PintipsCopyWithImpl<$Res, _$PintipsImpl>
    implements _$$PintipsImplCopyWith<$Res> {
  __$$PintipsImplCopyWithImpl(
      _$PintipsImpl _value, $Res Function(_$PintipsImpl) _then)
      : super(_value, _then);

  /// Create a copy of Pintips
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? opdbId = null,
    Object? name = null,
    Object? sections = null,
  }) {
    return _then(_$PintipsImpl(
      opdbId: null == opdbId
          ? _value.opdbId
          : opdbId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      sections: null == sections
          ? _value._sections
          : sections // ignore: cast_nullable_to_non_nullable
              as List<TipsSection>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PintipsImpl implements _Pintips {
  const _$PintipsImpl(
      {@JsonKey(name: 'opdb_id') required this.opdbId,
      required this.name,
      final List<TipsSection> sections = const []})
      : _sections = sections;

  factory _$PintipsImpl.fromJson(Map<String, dynamic> json) =>
      _$$PintipsImplFromJson(json);

  /// OPDB ID.
  @override
  @JsonKey(name: 'opdb_id')
  final String opdbId;

  /// Machine name.
  @override
  final String name;

  /// Sections of tips.
  final List<TipsSection> _sections;

  /// Sections of tips.
  @override
  @JsonKey()
  List<TipsSection> get sections {
    if (_sections is EqualUnmodifiableListView) return _sections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sections);
  }

  @override
  String toString() {
    return 'Pintips(opdbId: $opdbId, name: $name, sections: $sections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PintipsImpl &&
            (identical(other.opdbId, opdbId) || other.opdbId == opdbId) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._sections, _sections));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, opdbId, name,
      const DeepCollectionEquality().hash(_sections));

  /// Create a copy of Pintips
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PintipsImplCopyWith<_$PintipsImpl> get copyWith =>
      __$$PintipsImplCopyWithImpl<_$PintipsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PintipsImplToJson(
      this,
    );
  }
}

abstract class _Pintips implements Pintips {
  const factory _Pintips(
      {@JsonKey(name: 'opdb_id') required final String opdbId,
      required final String name,
      final List<TipsSection> sections}) = _$PintipsImpl;

  factory _Pintips.fromJson(Map<String, dynamic> json) = _$PintipsImpl.fromJson;

  /// OPDB ID.
  @override
  @JsonKey(name: 'opdb_id')
  String get opdbId;

  /// Machine name.
  @override
  String get name;

  /// Sections of tips.
  @override
  List<TipsSection> get sections;

  /// Create a copy of Pintips
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PintipsImplCopyWith<_$PintipsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TipsSection _$TipsSectionFromJson(Map<String, dynamic> json) {
  return _TipsSection.fromJson(json);
}

/// @nodoc
mixin _$TipsSection {
  /// Section title.
  String get title => throw _privateConstructorUsedError;

  /// Content paragraphs or list items.
  List<String> get content => throw _privateConstructorUsedError;

  /// Subsections.
  List<TipsSection> get subsections => throw _privateConstructorUsedError;

  /// Serializes this TipsSection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TipsSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TipsSectionCopyWith<TipsSection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipsSectionCopyWith<$Res> {
  factory $TipsSectionCopyWith(
          TipsSection value, $Res Function(TipsSection) then) =
      _$TipsSectionCopyWithImpl<$Res, TipsSection>;
  @useResult
  $Res call(
      {String title, List<String> content, List<TipsSection> subsections});
}

/// @nodoc
class _$TipsSectionCopyWithImpl<$Res, $Val extends TipsSection>
    implements $TipsSectionCopyWith<$Res> {
  _$TipsSectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TipsSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? subsections = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subsections: null == subsections
          ? _value.subsections
          : subsections // ignore: cast_nullable_to_non_nullable
              as List<TipsSection>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TipsSectionImplCopyWith<$Res>
    implements $TipsSectionCopyWith<$Res> {
  factory _$$TipsSectionImplCopyWith(
          _$TipsSectionImpl value, $Res Function(_$TipsSectionImpl) then) =
      __$$TipsSectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title, List<String> content, List<TipsSection> subsections});
}

/// @nodoc
class __$$TipsSectionImplCopyWithImpl<$Res>
    extends _$TipsSectionCopyWithImpl<$Res, _$TipsSectionImpl>
    implements _$$TipsSectionImplCopyWith<$Res> {
  __$$TipsSectionImplCopyWithImpl(
      _$TipsSectionImpl _value, $Res Function(_$TipsSectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of TipsSection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? content = null,
    Object? subsections = null,
  }) {
    return _then(_$TipsSectionImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value._content
          : content // ignore: cast_nullable_to_non_nullable
              as List<String>,
      subsections: null == subsections
          ? _value._subsections
          : subsections // ignore: cast_nullable_to_non_nullable
              as List<TipsSection>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TipsSectionImpl implements _TipsSection {
  const _$TipsSectionImpl(
      {required this.title,
      final List<String> content = const [],
      final List<TipsSection> subsections = const []})
      : _content = content,
        _subsections = subsections;

  factory _$TipsSectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$TipsSectionImplFromJson(json);

  /// Section title.
  @override
  final String title;

  /// Content paragraphs or list items.
  final List<String> _content;

  /// Content paragraphs or list items.
  @override
  @JsonKey()
  List<String> get content {
    if (_content is EqualUnmodifiableListView) return _content;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_content);
  }

  /// Subsections.
  final List<TipsSection> _subsections;

  /// Subsections.
  @override
  @JsonKey()
  List<TipsSection> get subsections {
    if (_subsections is EqualUnmodifiableListView) return _subsections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_subsections);
  }

  @override
  String toString() {
    return 'TipsSection(title: $title, content: $content, subsections: $subsections)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TipsSectionImpl &&
            (identical(other.title, title) || other.title == title) &&
            const DeepCollectionEquality().equals(other._content, _content) &&
            const DeepCollectionEquality()
                .equals(other._subsections, _subsections));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      title,
      const DeepCollectionEquality().hash(_content),
      const DeepCollectionEquality().hash(_subsections));

  /// Create a copy of TipsSection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TipsSectionImplCopyWith<_$TipsSectionImpl> get copyWith =>
      __$$TipsSectionImplCopyWithImpl<_$TipsSectionImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TipsSectionImplToJson(
      this,
    );
  }
}

abstract class _TipsSection implements TipsSection {
  const factory _TipsSection(
      {required final String title,
      final List<String> content,
      final List<TipsSection> subsections}) = _$TipsSectionImpl;

  factory _TipsSection.fromJson(Map<String, dynamic> json) =
      _$TipsSectionImpl.fromJson;

  /// Section title.
  @override
  String get title;

  /// Content paragraphs or list items.
  @override
  List<String> get content;

  /// Subsections.
  @override
  List<TipsSection> get subsections;

  /// Create a copy of TipsSection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TipsSectionImplCopyWith<_$TipsSectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MachinesResponse _$MachinesResponseFromJson(Map<String, dynamic> json) {
  return _MachinesResponse.fromJson(json);
}

/// @nodoc
mixin _$MachinesResponse {
  List<Machine> get machines => throw _privateConstructorUsedError;
  @JsonKey(name: 'machine_count')
  int get machineCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_synced')
  DateTime? get lastSynced => throw _privateConstructorUsedError;

  /// Serializes this MachinesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MachinesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MachinesResponseCopyWith<MachinesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachinesResponseCopyWith<$Res> {
  factory $MachinesResponseCopyWith(
          MachinesResponse value, $Res Function(MachinesResponse) then) =
      _$MachinesResponseCopyWithImpl<$Res, MachinesResponse>;
  @useResult
  $Res call(
      {List<Machine> machines,
      @JsonKey(name: 'machine_count') int machineCount,
      @JsonKey(name: 'last_synced') DateTime? lastSynced});
}

/// @nodoc
class _$MachinesResponseCopyWithImpl<$Res, $Val extends MachinesResponse>
    implements $MachinesResponseCopyWith<$Res> {
  _$MachinesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MachinesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? machines = null,
    Object? machineCount = null,
    Object? lastSynced = freezed,
  }) {
    return _then(_value.copyWith(
      machines: null == machines
          ? _value.machines
          : machines // ignore: cast_nullable_to_non_nullable
              as List<Machine>,
      machineCount: null == machineCount
          ? _value.machineCount
          : machineCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastSynced: freezed == lastSynced
          ? _value.lastSynced
          : lastSynced // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MachinesResponseImplCopyWith<$Res>
    implements $MachinesResponseCopyWith<$Res> {
  factory _$$MachinesResponseImplCopyWith(_$MachinesResponseImpl value,
          $Res Function(_$MachinesResponseImpl) then) =
      __$$MachinesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Machine> machines,
      @JsonKey(name: 'machine_count') int machineCount,
      @JsonKey(name: 'last_synced') DateTime? lastSynced});
}

/// @nodoc
class __$$MachinesResponseImplCopyWithImpl<$Res>
    extends _$MachinesResponseCopyWithImpl<$Res, _$MachinesResponseImpl>
    implements _$$MachinesResponseImplCopyWith<$Res> {
  __$$MachinesResponseImplCopyWithImpl(_$MachinesResponseImpl _value,
      $Res Function(_$MachinesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MachinesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? machines = null,
    Object? machineCount = null,
    Object? lastSynced = freezed,
  }) {
    return _then(_$MachinesResponseImpl(
      machines: null == machines
          ? _value._machines
          : machines // ignore: cast_nullable_to_non_nullable
              as List<Machine>,
      machineCount: null == machineCount
          ? _value.machineCount
          : machineCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastSynced: freezed == lastSynced
          ? _value.lastSynced
          : lastSynced // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MachinesResponseImpl implements _MachinesResponse {
  const _$MachinesResponseImpl(
      {required final List<Machine> machines,
      @JsonKey(name: 'machine_count') required this.machineCount,
      @JsonKey(name: 'last_synced') this.lastSynced})
      : _machines = machines;

  factory _$MachinesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$MachinesResponseImplFromJson(json);

  final List<Machine> _machines;
  @override
  List<Machine> get machines {
    if (_machines is EqualUnmodifiableListView) return _machines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_machines);
  }

  @override
  @JsonKey(name: 'machine_count')
  final int machineCount;
  @override
  @JsonKey(name: 'last_synced')
  final DateTime? lastSynced;

  @override
  String toString() {
    return 'MachinesResponse(machines: $machines, machineCount: $machineCount, lastSynced: $lastSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MachinesResponseImpl &&
            const DeepCollectionEquality().equals(other._machines, _machines) &&
            (identical(other.machineCount, machineCount) ||
                other.machineCount == machineCount) &&
            (identical(other.lastSynced, lastSynced) ||
                other.lastSynced == lastSynced));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_machines), machineCount, lastSynced);

  /// Create a copy of MachinesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MachinesResponseImplCopyWith<_$MachinesResponseImpl> get copyWith =>
      __$$MachinesResponseImplCopyWithImpl<_$MachinesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MachinesResponseImplToJson(
      this,
    );
  }
}

abstract class _MachinesResponse implements MachinesResponse {
  const factory _MachinesResponse(
          {required final List<Machine> machines,
          @JsonKey(name: 'machine_count') required final int machineCount,
          @JsonKey(name: 'last_synced') final DateTime? lastSynced}) =
      _$MachinesResponseImpl;

  factory _MachinesResponse.fromJson(Map<String, dynamic> json) =
      _$MachinesResponseImpl.fromJson;

  @override
  List<Machine> get machines;
  @override
  @JsonKey(name: 'machine_count')
  int get machineCount;
  @override
  @JsonKey(name: 'last_synced')
  DateTime? get lastSynced;

  /// Create a copy of MachinesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MachinesResponseImplCopyWith<_$MachinesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FavoriteInfo _$FavoriteInfoFromJson(Map<String, dynamic> json) {
  return _FavoriteInfo.fromJson(json);
}

/// @nodoc
mixin _$FavoriteInfo {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'user_name')
  String? get userName => throw _privateConstructorUsedError;

  /// Serializes this FavoriteInfo to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of FavoriteInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FavoriteInfoCopyWith<FavoriteInfo> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FavoriteInfoCopyWith<$Res> {
  factory $FavoriteInfoCopyWith(
          FavoriteInfo value, $Res Function(FavoriteInfo) then) =
      _$FavoriteInfoCopyWithImpl<$Res, FavoriteInfo>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'user_name') String? userName});
}

/// @nodoc
class _$FavoriteInfoCopyWithImpl<$Res, $Val extends FavoriteInfo>
    implements $FavoriteInfoCopyWith<$Res> {
  _$FavoriteInfoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of FavoriteInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FavoriteInfoImplCopyWith<$Res>
    implements $FavoriteInfoCopyWith<$Res> {
  factory _$$FavoriteInfoImplCopyWith(
          _$FavoriteInfoImpl value, $Res Function(_$FavoriteInfoImpl) then) =
      __$$FavoriteInfoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'user_name') String? userName});
}

/// @nodoc
class __$$FavoriteInfoImplCopyWithImpl<$Res>
    extends _$FavoriteInfoCopyWithImpl<$Res, _$FavoriteInfoImpl>
    implements _$$FavoriteInfoImplCopyWith<$Res> {
  __$$FavoriteInfoImplCopyWithImpl(
      _$FavoriteInfoImpl _value, $Res Function(_$FavoriteInfoImpl) _then)
      : super(_value, _then);

  /// Create a copy of FavoriteInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? userName = freezed,
  }) {
    return _then(_$FavoriteInfoImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FavoriteInfoImpl implements _FavoriteInfo {
  const _$FavoriteInfoImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'user_name') this.userName});

  factory _$FavoriteInfoImpl.fromJson(Map<String, dynamic> json) =>
      _$$FavoriteInfoImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'user_name')
  final String? userName;

  @override
  String toString() {
    return 'FavoriteInfo(userId: $userId, userName: $userName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FavoriteInfoImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, userName);

  /// Create a copy of FavoriteInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FavoriteInfoImplCopyWith<_$FavoriteInfoImpl> get copyWith =>
      __$$FavoriteInfoImplCopyWithImpl<_$FavoriteInfoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FavoriteInfoImplToJson(
      this,
    );
  }
}

abstract class _FavoriteInfo implements FavoriteInfo {
  const factory _FavoriteInfo(
      {@JsonKey(name: 'user_id') required final String userId,
      @JsonKey(name: 'user_name') final String? userName}) = _$FavoriteInfoImpl;

  factory _FavoriteInfo.fromJson(Map<String, dynamic> json) =
      _$FavoriteInfoImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'user_name')
  String? get userName;

  /// Create a copy of FavoriteInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FavoriteInfoImplCopyWith<_$FavoriteInfoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MachineWithFavorites _$MachineWithFavoritesFromJson(Map<String, dynamic> json) {
  return _MachineWithFavorites.fromJson(json);
}

/// @nodoc
mixin _$MachineWithFavorites {
  /// Unique identifier (e.g., "pm_12345" for Pinball Map sourced machines).
  String get id => throw _privateConstructorUsedError;

  /// Machine name.
  String get name => throw _privateConstructorUsedError;

  /// Manufacturer (e.g., "Williams", "Stern").
  String? get manufacturer => throw _privateConstructorUsedError;

  /// Year of manufacture.
  int? get year => throw _privateConstructorUsedError;

  /// IPDB link.
  @JsonKey(name: 'ipdb_link')
  String? get ipdbLink => throw _privateConstructorUsedError;

  /// OPDB ID for enrichment lookup.
  @JsonKey(name: 'opdb_id')
  String? get opdbId => throw _privateConstructorUsedError;

  /// Machine type (e.g., "Solid State", "Electromechanical").
  @JsonKey(name: 'machine_type')
  String? get machineType => throw _privateConstructorUsedError;

  /// Display type (e.g., "DMD", "LCD", "Alphanumeric").
  @JsonKey(name: 'display_type')
  String? get displayType => throw _privateConstructorUsedError;

  /// Number of players.
  @JsonKey(name: 'player_count')
  int? get playerCount => throw _privateConstructorUsedError;

  /// Features (e.g., "multiball", "video_mode").
  List<String> get features => throw _privateConstructorUsedError;

  /// Description from OPDB.
  String? get description => throw _privateConstructorUsedError;

  /// Images from OPDB.
  List<MachineImage> get images => throw _privateConstructorUsedError;

  /// Strategy tips from Pintips/Pinball Primer.
  Pintips? get tips => throw _privateConstructorUsedError;

  /// Users who have favorited this machine.
  @JsonKey(name: 'favorited_by')
  List<FavoriteInfo> get favoritedBy => throw _privateConstructorUsedError;

  /// Serializes this MachineWithFavorites to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MachineWithFavorites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MachineWithFavoritesCopyWith<MachineWithFavorites> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachineWithFavoritesCopyWith<$Res> {
  factory $MachineWithFavoritesCopyWith(MachineWithFavorites value,
          $Res Function(MachineWithFavorites) then) =
      _$MachineWithFavoritesCopyWithImpl<$Res, MachineWithFavorites>;
  @useResult
  $Res call(
      {String id,
      String name,
      String? manufacturer,
      int? year,
      @JsonKey(name: 'ipdb_link') String? ipdbLink,
      @JsonKey(name: 'opdb_id') String? opdbId,
      @JsonKey(name: 'machine_type') String? machineType,
      @JsonKey(name: 'display_type') String? displayType,
      @JsonKey(name: 'player_count') int? playerCount,
      List<String> features,
      String? description,
      List<MachineImage> images,
      Pintips? tips,
      @JsonKey(name: 'favorited_by') List<FavoriteInfo> favoritedBy});

  $PintipsCopyWith<$Res>? get tips;
}

/// @nodoc
class _$MachineWithFavoritesCopyWithImpl<$Res,
        $Val extends MachineWithFavorites>
    implements $MachineWithFavoritesCopyWith<$Res> {
  _$MachineWithFavoritesCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MachineWithFavorites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? manufacturer = freezed,
    Object? year = freezed,
    Object? ipdbLink = freezed,
    Object? opdbId = freezed,
    Object? machineType = freezed,
    Object? displayType = freezed,
    Object? playerCount = freezed,
    Object? features = null,
    Object? description = freezed,
    Object? images = null,
    Object? tips = freezed,
    Object? favoritedBy = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      ipdbLink: freezed == ipdbLink
          ? _value.ipdbLink
          : ipdbLink // ignore: cast_nullable_to_non_nullable
              as String?,
      opdbId: freezed == opdbId
          ? _value.opdbId
          : opdbId // ignore: cast_nullable_to_non_nullable
              as String?,
      machineType: freezed == machineType
          ? _value.machineType
          : machineType // ignore: cast_nullable_to_non_nullable
              as String?,
      displayType: freezed == displayType
          ? _value.displayType
          : displayType // ignore: cast_nullable_to_non_nullable
              as String?,
      playerCount: freezed == playerCount
          ? _value.playerCount
          : playerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      features: null == features
          ? _value.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<MachineImage>,
      tips: freezed == tips
          ? _value.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as Pintips?,
      favoritedBy: null == favoritedBy
          ? _value.favoritedBy
          : favoritedBy // ignore: cast_nullable_to_non_nullable
              as List<FavoriteInfo>,
    ) as $Val);
  }

  /// Create a copy of MachineWithFavorites
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PintipsCopyWith<$Res>? get tips {
    if (_value.tips == null) {
      return null;
    }

    return $PintipsCopyWith<$Res>(_value.tips!, (value) {
      return _then(_value.copyWith(tips: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MachineWithFavoritesImplCopyWith<$Res>
    implements $MachineWithFavoritesCopyWith<$Res> {
  factory _$$MachineWithFavoritesImplCopyWith(_$MachineWithFavoritesImpl value,
          $Res Function(_$MachineWithFavoritesImpl) then) =
      __$$MachineWithFavoritesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String? manufacturer,
      int? year,
      @JsonKey(name: 'ipdb_link') String? ipdbLink,
      @JsonKey(name: 'opdb_id') String? opdbId,
      @JsonKey(name: 'machine_type') String? machineType,
      @JsonKey(name: 'display_type') String? displayType,
      @JsonKey(name: 'player_count') int? playerCount,
      List<String> features,
      String? description,
      List<MachineImage> images,
      Pintips? tips,
      @JsonKey(name: 'favorited_by') List<FavoriteInfo> favoritedBy});

  @override
  $PintipsCopyWith<$Res>? get tips;
}

/// @nodoc
class __$$MachineWithFavoritesImplCopyWithImpl<$Res>
    extends _$MachineWithFavoritesCopyWithImpl<$Res, _$MachineWithFavoritesImpl>
    implements _$$MachineWithFavoritesImplCopyWith<$Res> {
  __$$MachineWithFavoritesImplCopyWithImpl(_$MachineWithFavoritesImpl _value,
      $Res Function(_$MachineWithFavoritesImpl) _then)
      : super(_value, _then);

  /// Create a copy of MachineWithFavorites
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? manufacturer = freezed,
    Object? year = freezed,
    Object? ipdbLink = freezed,
    Object? opdbId = freezed,
    Object? machineType = freezed,
    Object? displayType = freezed,
    Object? playerCount = freezed,
    Object? features = null,
    Object? description = freezed,
    Object? images = null,
    Object? tips = freezed,
    Object? favoritedBy = null,
  }) {
    return _then(_$MachineWithFavoritesImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      manufacturer: freezed == manufacturer
          ? _value.manufacturer
          : manufacturer // ignore: cast_nullable_to_non_nullable
              as String?,
      year: freezed == year
          ? _value.year
          : year // ignore: cast_nullable_to_non_nullable
              as int?,
      ipdbLink: freezed == ipdbLink
          ? _value.ipdbLink
          : ipdbLink // ignore: cast_nullable_to_non_nullable
              as String?,
      opdbId: freezed == opdbId
          ? _value.opdbId
          : opdbId // ignore: cast_nullable_to_non_nullable
              as String?,
      machineType: freezed == machineType
          ? _value.machineType
          : machineType // ignore: cast_nullable_to_non_nullable
              as String?,
      displayType: freezed == displayType
          ? _value.displayType
          : displayType // ignore: cast_nullable_to_non_nullable
              as String?,
      playerCount: freezed == playerCount
          ? _value.playerCount
          : playerCount // ignore: cast_nullable_to_non_nullable
              as int?,
      features: null == features
          ? _value._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<MachineImage>,
      tips: freezed == tips
          ? _value.tips
          : tips // ignore: cast_nullable_to_non_nullable
              as Pintips?,
      favoritedBy: null == favoritedBy
          ? _value._favoritedBy
          : favoritedBy // ignore: cast_nullable_to_non_nullable
              as List<FavoriteInfo>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MachineWithFavoritesImpl extends _MachineWithFavorites {
  const _$MachineWithFavoritesImpl(
      {required this.id,
      required this.name,
      this.manufacturer,
      this.year,
      @JsonKey(name: 'ipdb_link') this.ipdbLink,
      @JsonKey(name: 'opdb_id') this.opdbId,
      @JsonKey(name: 'machine_type') this.machineType,
      @JsonKey(name: 'display_type') this.displayType,
      @JsonKey(name: 'player_count') this.playerCount,
      final List<String> features = const [],
      this.description,
      final List<MachineImage> images = const [],
      this.tips,
      @JsonKey(name: 'favorited_by')
      final List<FavoriteInfo> favoritedBy = const []})
      : _features = features,
        _images = images,
        _favoritedBy = favoritedBy,
        super._();

  factory _$MachineWithFavoritesImpl.fromJson(Map<String, dynamic> json) =>
      _$$MachineWithFavoritesImplFromJson(json);

  /// Unique identifier (e.g., "pm_12345" for Pinball Map sourced machines).
  @override
  final String id;

  /// Machine name.
  @override
  final String name;

  /// Manufacturer (e.g., "Williams", "Stern").
  @override
  final String? manufacturer;

  /// Year of manufacture.
  @override
  final int? year;

  /// IPDB link.
  @override
  @JsonKey(name: 'ipdb_link')
  final String? ipdbLink;

  /// OPDB ID for enrichment lookup.
  @override
  @JsonKey(name: 'opdb_id')
  final String? opdbId;

  /// Machine type (e.g., "Solid State", "Electromechanical").
  @override
  @JsonKey(name: 'machine_type')
  final String? machineType;

  /// Display type (e.g., "DMD", "LCD", "Alphanumeric").
  @override
  @JsonKey(name: 'display_type')
  final String? displayType;

  /// Number of players.
  @override
  @JsonKey(name: 'player_count')
  final int? playerCount;

  /// Features (e.g., "multiball", "video_mode").
  final List<String> _features;

  /// Features (e.g., "multiball", "video_mode").
  @override
  @JsonKey()
  List<String> get features {
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_features);
  }

  /// Description from OPDB.
  @override
  final String? description;

  /// Images from OPDB.
  final List<MachineImage> _images;

  /// Images from OPDB.
  @override
  @JsonKey()
  List<MachineImage> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  /// Strategy tips from Pintips/Pinball Primer.
  @override
  final Pintips? tips;

  /// Users who have favorited this machine.
  final List<FavoriteInfo> _favoritedBy;

  /// Users who have favorited this machine.
  @override
  @JsonKey(name: 'favorited_by')
  List<FavoriteInfo> get favoritedBy {
    if (_favoritedBy is EqualUnmodifiableListView) return _favoritedBy;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_favoritedBy);
  }

  @override
  String toString() {
    return 'MachineWithFavorites(id: $id, name: $name, manufacturer: $manufacturer, year: $year, ipdbLink: $ipdbLink, opdbId: $opdbId, machineType: $machineType, displayType: $displayType, playerCount: $playerCount, features: $features, description: $description, images: $images, tips: $tips, favoritedBy: $favoritedBy)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MachineWithFavoritesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.manufacturer, manufacturer) ||
                other.manufacturer == manufacturer) &&
            (identical(other.year, year) || other.year == year) &&
            (identical(other.ipdbLink, ipdbLink) ||
                other.ipdbLink == ipdbLink) &&
            (identical(other.opdbId, opdbId) || other.opdbId == opdbId) &&
            (identical(other.machineType, machineType) ||
                other.machineType == machineType) &&
            (identical(other.displayType, displayType) ||
                other.displayType == displayType) &&
            (identical(other.playerCount, playerCount) ||
                other.playerCount == playerCount) &&
            const DeepCollectionEquality().equals(other._features, _features) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.tips, tips) || other.tips == tips) &&
            const DeepCollectionEquality()
                .equals(other._favoritedBy, _favoritedBy));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      manufacturer,
      year,
      ipdbLink,
      opdbId,
      machineType,
      displayType,
      playerCount,
      const DeepCollectionEquality().hash(_features),
      description,
      const DeepCollectionEquality().hash(_images),
      tips,
      const DeepCollectionEquality().hash(_favoritedBy));

  /// Create a copy of MachineWithFavorites
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MachineWithFavoritesImplCopyWith<_$MachineWithFavoritesImpl>
      get copyWith =>
          __$$MachineWithFavoritesImplCopyWithImpl<_$MachineWithFavoritesImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MachineWithFavoritesImplToJson(
      this,
    );
  }
}

abstract class _MachineWithFavorites extends MachineWithFavorites {
  const factory _MachineWithFavorites(
      {required final String id,
      required final String name,
      final String? manufacturer,
      final int? year,
      @JsonKey(name: 'ipdb_link') final String? ipdbLink,
      @JsonKey(name: 'opdb_id') final String? opdbId,
      @JsonKey(name: 'machine_type') final String? machineType,
      @JsonKey(name: 'display_type') final String? displayType,
      @JsonKey(name: 'player_count') final int? playerCount,
      final List<String> features,
      final String? description,
      final List<MachineImage> images,
      final Pintips? tips,
      @JsonKey(name: 'favorited_by')
      final List<FavoriteInfo> favoritedBy}) = _$MachineWithFavoritesImpl;
  const _MachineWithFavorites._() : super._();

  factory _MachineWithFavorites.fromJson(Map<String, dynamic> json) =
      _$MachineWithFavoritesImpl.fromJson;

  /// Unique identifier (e.g., "pm_12345" for Pinball Map sourced machines).
  @override
  String get id;

  /// Machine name.
  @override
  String get name;

  /// Manufacturer (e.g., "Williams", "Stern").
  @override
  String? get manufacturer;

  /// Year of manufacture.
  @override
  int? get year;

  /// IPDB link.
  @override
  @JsonKey(name: 'ipdb_link')
  String? get ipdbLink;

  /// OPDB ID for enrichment lookup.
  @override
  @JsonKey(name: 'opdb_id')
  String? get opdbId;

  /// Machine type (e.g., "Solid State", "Electromechanical").
  @override
  @JsonKey(name: 'machine_type')
  String? get machineType;

  /// Display type (e.g., "DMD", "LCD", "Alphanumeric").
  @override
  @JsonKey(name: 'display_type')
  String? get displayType;

  /// Number of players.
  @override
  @JsonKey(name: 'player_count')
  int? get playerCount;

  /// Features (e.g., "multiball", "video_mode").
  @override
  List<String> get features;

  /// Description from OPDB.
  @override
  String? get description;

  /// Images from OPDB.
  @override
  List<MachineImage> get images;

  /// Strategy tips from Pintips/Pinball Primer.
  @override
  Pintips? get tips;

  /// Users who have favorited this machine.
  @override
  @JsonKey(name: 'favorited_by')
  List<FavoriteInfo> get favoritedBy;

  /// Create a copy of MachineWithFavorites
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MachineWithFavoritesImplCopyWith<_$MachineWithFavoritesImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MachinesWithFavoritesResponse _$MachinesWithFavoritesResponseFromJson(
    Map<String, dynamic> json) {
  return _MachinesWithFavoritesResponse.fromJson(json);
}

/// @nodoc
mixin _$MachinesWithFavoritesResponse {
  List<MachineWithFavorites> get machines => throw _privateConstructorUsedError;
  @JsonKey(name: 'machine_count')
  int get machineCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_synced')
  DateTime? get lastSynced => throw _privateConstructorUsedError;

  /// Serializes this MachinesWithFavoritesResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MachinesWithFavoritesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MachinesWithFavoritesResponseCopyWith<MachinesWithFavoritesResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MachinesWithFavoritesResponseCopyWith<$Res> {
  factory $MachinesWithFavoritesResponseCopyWith(
          MachinesWithFavoritesResponse value,
          $Res Function(MachinesWithFavoritesResponse) then) =
      _$MachinesWithFavoritesResponseCopyWithImpl<$Res,
          MachinesWithFavoritesResponse>;
  @useResult
  $Res call(
      {List<MachineWithFavorites> machines,
      @JsonKey(name: 'machine_count') int machineCount,
      @JsonKey(name: 'last_synced') DateTime? lastSynced});
}

/// @nodoc
class _$MachinesWithFavoritesResponseCopyWithImpl<$Res,
        $Val extends MachinesWithFavoritesResponse>
    implements $MachinesWithFavoritesResponseCopyWith<$Res> {
  _$MachinesWithFavoritesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MachinesWithFavoritesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? machines = null,
    Object? machineCount = null,
    Object? lastSynced = freezed,
  }) {
    return _then(_value.copyWith(
      machines: null == machines
          ? _value.machines
          : machines // ignore: cast_nullable_to_non_nullable
              as List<MachineWithFavorites>,
      machineCount: null == machineCount
          ? _value.machineCount
          : machineCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastSynced: freezed == lastSynced
          ? _value.lastSynced
          : lastSynced // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MachinesWithFavoritesResponseImplCopyWith<$Res>
    implements $MachinesWithFavoritesResponseCopyWith<$Res> {
  factory _$$MachinesWithFavoritesResponseImplCopyWith(
          _$MachinesWithFavoritesResponseImpl value,
          $Res Function(_$MachinesWithFavoritesResponseImpl) then) =
      __$$MachinesWithFavoritesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<MachineWithFavorites> machines,
      @JsonKey(name: 'machine_count') int machineCount,
      @JsonKey(name: 'last_synced') DateTime? lastSynced});
}

/// @nodoc
class __$$MachinesWithFavoritesResponseImplCopyWithImpl<$Res>
    extends _$MachinesWithFavoritesResponseCopyWithImpl<$Res,
        _$MachinesWithFavoritesResponseImpl>
    implements _$$MachinesWithFavoritesResponseImplCopyWith<$Res> {
  __$$MachinesWithFavoritesResponseImplCopyWithImpl(
      _$MachinesWithFavoritesResponseImpl _value,
      $Res Function(_$MachinesWithFavoritesResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of MachinesWithFavoritesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? machines = null,
    Object? machineCount = null,
    Object? lastSynced = freezed,
  }) {
    return _then(_$MachinesWithFavoritesResponseImpl(
      machines: null == machines
          ? _value._machines
          : machines // ignore: cast_nullable_to_non_nullable
              as List<MachineWithFavorites>,
      machineCount: null == machineCount
          ? _value.machineCount
          : machineCount // ignore: cast_nullable_to_non_nullable
              as int,
      lastSynced: freezed == lastSynced
          ? _value.lastSynced
          : lastSynced // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MachinesWithFavoritesResponseImpl
    implements _MachinesWithFavoritesResponse {
  const _$MachinesWithFavoritesResponseImpl(
      {required final List<MachineWithFavorites> machines,
      @JsonKey(name: 'machine_count') required this.machineCount,
      @JsonKey(name: 'last_synced') this.lastSynced})
      : _machines = machines;

  factory _$MachinesWithFavoritesResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MachinesWithFavoritesResponseImplFromJson(json);

  final List<MachineWithFavorites> _machines;
  @override
  List<MachineWithFavorites> get machines {
    if (_machines is EqualUnmodifiableListView) return _machines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_machines);
  }

  @override
  @JsonKey(name: 'machine_count')
  final int machineCount;
  @override
  @JsonKey(name: 'last_synced')
  final DateTime? lastSynced;

  @override
  String toString() {
    return 'MachinesWithFavoritesResponse(machines: $machines, machineCount: $machineCount, lastSynced: $lastSynced)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MachinesWithFavoritesResponseImpl &&
            const DeepCollectionEquality().equals(other._machines, _machines) &&
            (identical(other.machineCount, machineCount) ||
                other.machineCount == machineCount) &&
            (identical(other.lastSynced, lastSynced) ||
                other.lastSynced == lastSynced));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_machines), machineCount, lastSynced);

  /// Create a copy of MachinesWithFavoritesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MachinesWithFavoritesResponseImplCopyWith<
          _$MachinesWithFavoritesResponseImpl>
      get copyWith => __$$MachinesWithFavoritesResponseImplCopyWithImpl<
          _$MachinesWithFavoritesResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MachinesWithFavoritesResponseImplToJson(
      this,
    );
  }
}

abstract class _MachinesWithFavoritesResponse
    implements MachinesWithFavoritesResponse {
  const factory _MachinesWithFavoritesResponse(
          {required final List<MachineWithFavorites> machines,
          @JsonKey(name: 'machine_count') required final int machineCount,
          @JsonKey(name: 'last_synced') final DateTime? lastSynced}) =
      _$MachinesWithFavoritesResponseImpl;

  factory _MachinesWithFavoritesResponse.fromJson(Map<String, dynamic> json) =
      _$MachinesWithFavoritesResponseImpl.fromJson;

  @override
  List<MachineWithFavorites> get machines;
  @override
  @JsonKey(name: 'machine_count')
  int get machineCount;
  @override
  @JsonKey(name: 'last_synced')
  DateTime? get lastSynced;

  /// Create a copy of MachinesWithFavoritesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MachinesWithFavoritesResponseImplCopyWith<
          _$MachinesWithFavoritesResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
