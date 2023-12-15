//
//  Generated code. Do not modify.
//  source: hobby.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $12;

class Hobby extends $pb.GeneratedMessage {
  factory Hobby({
    $core.int? userID,
    $core.int? era,
    $core.String? city,
    $core.String? gender,
    $core.int? height,
    $core.int? weight,
    $core.String? speaklanguage,
    $core.String? findType,
    $core.String? findTarget,
    $core.int? experience,
    $core.String? sociability,
    $core.bool? certification,
    $12.Timestamp? infoChangedAt,
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
    if (height != null) {
      $result.height = height;
    }
    if (weight != null) {
      $result.weight = weight;
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
    if (experience != null) {
      $result.experience = experience;
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
  Hobby._() : super();
  factory Hobby.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Hobby.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Hobby', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'Era', $pb.PbFieldType.O3, protoName: 'Era')
    ..aOS(3, _omitFieldNames ? '' : 'City', protoName: 'City')
    ..aOS(4, _omitFieldNames ? '' : 'Gender', protoName: 'Gender')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'Height', $pb.PbFieldType.O3, protoName: 'Height')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'Weight', $pb.PbFieldType.O3, protoName: 'Weight')
    ..aOS(7, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(8, _omitFieldNames ? '' : 'FindType', protoName: 'FindType')
    ..aOS(9, _omitFieldNames ? '' : 'FindTarget', protoName: 'FindTarget')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'Experience', $pb.PbFieldType.O3, protoName: 'Experience')
    ..aOS(11, _omitFieldNames ? '' : 'Sociability', protoName: 'Sociability')
    ..aOB(12, _omitFieldNames ? '' : 'Certification', protoName: 'Certification')
    ..aOM<$12.Timestamp>(13, _omitFieldNames ? '' : 'InfoChangedAt', protoName: 'InfoChangedAt', subBuilder: $12.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Hobby clone() => Hobby()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Hobby copyWith(void Function(Hobby) updates) => super.copyWith((message) => updates(message as Hobby)) as Hobby;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Hobby create() => Hobby._();
  Hobby createEmptyInstance() => create();
  static $pb.PbList<Hobby> createRepeated() => $pb.PbList<Hobby>();
  @$core.pragma('dart2js:noInline')
  static Hobby getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Hobby>(create);
  static Hobby? _defaultInstance;

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
  $core.int get height => $_getIZ(4);
  @$pb.TagNumber(5)
  set height($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeight() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get weight => $_getIZ(5);
  @$pb.TagNumber(6)
  set weight($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasWeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearWeight() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get speaklanguage => $_getSZ(6);
  @$pb.TagNumber(7)
  set speaklanguage($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSpeaklanguage() => $_has(6);
  @$pb.TagNumber(7)
  void clearSpeaklanguage() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get findType => $_getSZ(7);
  @$pb.TagNumber(8)
  set findType($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFindType() => $_has(7);
  @$pb.TagNumber(8)
  void clearFindType() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get findTarget => $_getSZ(8);
  @$pb.TagNumber(9)
  set findTarget($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasFindTarget() => $_has(8);
  @$pb.TagNumber(9)
  void clearFindTarget() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get experience => $_getIZ(9);
  @$pb.TagNumber(10)
  set experience($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasExperience() => $_has(9);
  @$pb.TagNumber(10)
  void clearExperience() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get sociability => $_getSZ(10);
  @$pb.TagNumber(11)
  set sociability($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSociability() => $_has(10);
  @$pb.TagNumber(11)
  void clearSociability() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get certification => $_getBF(11);
  @$pb.TagNumber(12)
  set certification($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasCertification() => $_has(11);
  @$pb.TagNumber(12)
  void clearCertification() => clearField(12);

  @$pb.TagNumber(13)
  $12.Timestamp get infoChangedAt => $_getN(12);
  @$pb.TagNumber(13)
  set infoChangedAt($12.Timestamp v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasInfoChangedAt() => $_has(12);
  @$pb.TagNumber(13)
  void clearInfoChangedAt() => clearField(13);
  @$pb.TagNumber(13)
  $12.Timestamp ensureInfoChangedAt() => $_ensure(12);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
