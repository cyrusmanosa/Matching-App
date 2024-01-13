//
//  Generated code. Do not modify.
//  source: lover.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $16;

class Lover extends $pb.GeneratedMessage {
  factory Lover({
    $core.int? userID,
    $core.int? minAge,
    $core.int? maxAge,
    $core.String? city,
    $core.String? gender,
    $core.String? sexual,
    $core.String? speaklanguage,
    $16.Timestamp? infoChangedAt,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (minAge != null) {
      $result.minAge = minAge;
    }
    if (maxAge != null) {
      $result.maxAge = maxAge;
    }
    if (city != null) {
      $result.city = city;
    }
    if (gender != null) {
      $result.gender = gender;
    }
    if (sexual != null) {
      $result.sexual = sexual;
    }
    if (speaklanguage != null) {
      $result.speaklanguage = speaklanguage;
    }
    if (infoChangedAt != null) {
      $result.infoChangedAt = infoChangedAt;
    }
    return $result;
  }
  Lover._() : super();
  factory Lover.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Lover.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Lover', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'MinAge', $pb.PbFieldType.O3, protoName: 'MinAge')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'MaxAge', $pb.PbFieldType.O3, protoName: 'MaxAge')
    ..aOS(4, _omitFieldNames ? '' : 'City', protoName: 'City')
    ..aOS(5, _omitFieldNames ? '' : 'Gender', protoName: 'Gender')
    ..aOS(6, _omitFieldNames ? '' : 'Sexual', protoName: 'Sexual')
    ..aOS(7, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOM<$16.Timestamp>(8, _omitFieldNames ? '' : 'InfoChangedAt', protoName: 'InfoChangedAt', subBuilder: $16.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Lover clone() => Lover()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Lover copyWith(void Function(Lover) updates) => super.copyWith((message) => updates(message as Lover)) as Lover;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Lover create() => Lover._();
  Lover createEmptyInstance() => create();
  static $pb.PbList<Lover> createRepeated() => $pb.PbList<Lover>();
  @$core.pragma('dart2js:noInline')
  static Lover getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Lover>(create);
  static Lover? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get minAge => $_getIZ(1);
  @$pb.TagNumber(2)
  set minAge($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMinAge() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinAge() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get maxAge => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxAge($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMaxAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxAge() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get city => $_getSZ(3);
  @$pb.TagNumber(4)
  set city($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCity() => $_has(3);
  @$pb.TagNumber(4)
  void clearCity() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get gender => $_getSZ(4);
  @$pb.TagNumber(5)
  set gender($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGender() => $_has(4);
  @$pb.TagNumber(5)
  void clearGender() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get sexual => $_getSZ(5);
  @$pb.TagNumber(6)
  set sexual($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasSexual() => $_has(5);
  @$pb.TagNumber(6)
  void clearSexual() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get speaklanguage => $_getSZ(6);
  @$pb.TagNumber(7)
  set speaklanguage($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSpeaklanguage() => $_has(6);
  @$pb.TagNumber(7)
  void clearSpeaklanguage() => clearField(7);

  @$pb.TagNumber(8)
  $16.Timestamp get infoChangedAt => $_getN(7);
  @$pb.TagNumber(8)
  set infoChangedAt($16.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasInfoChangedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearInfoChangedAt() => clearField(8);
  @$pb.TagNumber(8)
  $16.Timestamp ensureInfoChangedAt() => $_ensure(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
