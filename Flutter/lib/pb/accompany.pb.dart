//
//  Generated code. Do not modify.
//  source: accompany.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $14;

class Accompany extends $pb.GeneratedMessage {
  factory Accompany({
    $core.int? userID,
    $core.int? era,
    $core.String? city,
    $core.String? gender,
    $core.String? speaklanguage,
    $core.String? findType,
    $core.String? findTarget,
    $core.String? sociability,
    $core.bool? certification,
    $14.Timestamp? infoChangedAt,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (era != null) {
      $result.era = era;
    }
    if (city != null) {
      $result.city = city;
    }
    if (gender != null) {
      $result.gender = gender;
    }
    if (speaklanguage != null) {
      $result.speaklanguage = speaklanguage;
    }
    if (findType != null) {
      $result.findType = findType;
    }
    if (findTarget != null) {
      $result.findTarget = findTarget;
    }
    if (sociability != null) {
      $result.sociability = sociability;
    }
    if (certification != null) {
      $result.certification = certification;
    }
    if (infoChangedAt != null) {
      $result.infoChangedAt = infoChangedAt;
    }
    return $result;
  }
  Accompany._() : super();
  factory Accompany.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Accompany.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Accompany', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'Era', $pb.PbFieldType.O3, protoName: 'Era')
    ..aOS(3, _omitFieldNames ? '' : 'City', protoName: 'City')
    ..aOS(4, _omitFieldNames ? '' : 'Gender', protoName: 'Gender')
    ..aOS(5, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(6, _omitFieldNames ? '' : 'FindType', protoName: 'FindType')
    ..aOS(7, _omitFieldNames ? '' : 'FindTarget', protoName: 'FindTarget')
    ..aOS(8, _omitFieldNames ? '' : 'Sociability', protoName: 'Sociability')
    ..aOB(9, _omitFieldNames ? '' : 'Certification', protoName: 'Certification')
    ..aOM<$14.Timestamp>(10, _omitFieldNames ? '' : 'InfoChangedAt', protoName: 'InfoChangedAt', subBuilder: $14.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Accompany clone() => Accompany()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Accompany copyWith(void Function(Accompany) updates) => super.copyWith((message) => updates(message as Accompany)) as Accompany;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Accompany create() => Accompany._();
  Accompany createEmptyInstance() => create();
  static $pb.PbList<Accompany> createRepeated() => $pb.PbList<Accompany>();
  @$core.pragma('dart2js:noInline')
  static Accompany getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Accompany>(create);
  static Accompany? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get era => $_getIZ(1);
  @$pb.TagNumber(2)
  set era($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEra() => $_has(1);
  @$pb.TagNumber(2)
  void clearEra() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get city => $_getSZ(2);
  @$pb.TagNumber(3)
  set city($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCity() => $_has(2);
  @$pb.TagNumber(3)
  void clearCity() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get gender => $_getSZ(3);
  @$pb.TagNumber(4)
  set gender($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get speaklanguage => $_getSZ(4);
  @$pb.TagNumber(5)
  set speaklanguage($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSpeaklanguage() => $_has(4);
  @$pb.TagNumber(5)
  void clearSpeaklanguage() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get findType => $_getSZ(5);
  @$pb.TagNumber(6)
  set findType($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFindType() => $_has(5);
  @$pb.TagNumber(6)
  void clearFindType() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get findTarget => $_getSZ(6);
  @$pb.TagNumber(7)
  set findTarget($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasFindTarget() => $_has(6);
  @$pb.TagNumber(7)
  void clearFindTarget() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get sociability => $_getSZ(7);
  @$pb.TagNumber(8)
  set sociability($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasSociability() => $_has(7);
  @$pb.TagNumber(8)
  void clearSociability() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get certification => $_getBF(8);
  @$pb.TagNumber(9)
  set certification($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCertification() => $_has(8);
  @$pb.TagNumber(9)
  void clearCertification() => clearField(9);

  @$pb.TagNumber(10)
  $14.Timestamp get infoChangedAt => $_getN(9);
  @$pb.TagNumber(10)
  set infoChangedAt($14.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasInfoChangedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearInfoChangedAt() => clearField(10);
  @$pb.TagNumber(10)
  $14.Timestamp ensureInfoChangedAt() => $_ensure(9);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
