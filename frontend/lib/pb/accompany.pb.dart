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

import 'google/protobuf/timestamp.pb.dart' as $16;

class Accompany extends $pb.GeneratedMessage {
  factory Accompany({
    $core.int? userID,
    $core.int? era,
    $core.String? speaklanguage,
    $core.String? findType,
    $core.String? sociability,
    $16.Timestamp? infoChangedAt,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (era != null) {
      $result.era = era;
    }
    if (speaklanguage != null) {
      $result.speaklanguage = speaklanguage;
    }
    if (findType != null) {
      $result.findType = findType;
    }
    if (sociability != null) {
      $result.sociability = sociability;
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
    ..aOS(3, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(4, _omitFieldNames ? '' : 'FindType', protoName: 'FindType')
    ..aOS(5, _omitFieldNames ? '' : 'Sociability', protoName: 'Sociability')
    ..aOM<$16.Timestamp>(6, _omitFieldNames ? '' : 'InfoChangedAt', protoName: 'InfoChangedAt', subBuilder: $16.Timestamp.create)
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
  $core.String get speaklanguage => $_getSZ(2);
  @$pb.TagNumber(3)
  set speaklanguage($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasSpeaklanguage() => $_has(2);
  @$pb.TagNumber(3)
  void clearSpeaklanguage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get findType => $_getSZ(3);
  @$pb.TagNumber(4)
  set findType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFindType() => $_has(3);
  @$pb.TagNumber(4)
  void clearFindType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get sociability => $_getSZ(4);
  @$pb.TagNumber(5)
  set sociability($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSociability() => $_has(4);
  @$pb.TagNumber(5)
  void clearSociability() => clearField(5);

  @$pb.TagNumber(6)
  $16.Timestamp get infoChangedAt => $_getN(5);
  @$pb.TagNumber(6)
  set infoChangedAt($16.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasInfoChangedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearInfoChangedAt() => clearField(6);
  @$pb.TagNumber(6)
  $16.Timestamp ensureInfoChangedAt() => $_ensure(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
