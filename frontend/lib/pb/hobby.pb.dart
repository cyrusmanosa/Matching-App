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

import 'google/protobuf/timestamp.pb.dart' as $17;

class Hobby extends $pb.GeneratedMessage {
  factory Hobby({
    $core.int? userID,
    $core.int? era,
    $core.Iterable<$core.String>? city,
    $core.String? gender,
    $core.Iterable<$core.String>? speaklanguage,
    $core.String? findType,
    $core.int? experience,
    $17.Timestamp? infoChangedAt,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (era != null) {
      $result.era = era;
    }
    if (city != null) {
      $result.city.addAll(city);
    }
    if (gender != null) {
      $result.gender = gender;
    }
    if (speaklanguage != null) {
      $result.speaklanguage.addAll(speaklanguage);
    }
    if (findType != null) {
      $result.findType = findType;
    }
    if (experience != null) {
      $result.experience = experience;
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
    ..pPS(3, _omitFieldNames ? '' : 'City', protoName: 'City')
    ..aOS(4, _omitFieldNames ? '' : 'Gender', protoName: 'Gender')
    ..pPS(5, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(6, _omitFieldNames ? '' : 'FindType', protoName: 'FindType')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'Experience', $pb.PbFieldType.O3, protoName: 'Experience')
    ..aOM<$17.Timestamp>(8, _omitFieldNames ? '' : 'InfoChangedAt', protoName: 'InfoChangedAt', subBuilder: $17.Timestamp.create)
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
  $core.List<$core.String> get city => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get gender => $_getSZ(3);
  @$pb.TagNumber(4)
  set gender($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.String> get speaklanguage => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get findType => $_getSZ(5);
  @$pb.TagNumber(6)
  set findType($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasFindType() => $_has(5);
  @$pb.TagNumber(6)
  void clearFindType() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get experience => $_getIZ(6);
  @$pb.TagNumber(7)
  set experience($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasExperience() => $_has(6);
  @$pb.TagNumber(7)
  void clearExperience() => clearField(7);

  @$pb.TagNumber(8)
  $17.Timestamp get infoChangedAt => $_getN(7);
  @$pb.TagNumber(8)
  set infoChangedAt($17.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasInfoChangedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearInfoChangedAt() => clearField(8);
  @$pb.TagNumber(8)
  $17.Timestamp ensureInfoChangedAt() => $_ensure(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
