//
//  Generated code. Do not modify.
//  source: targetList.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $18;

class Targetlist extends $pb.GeneratedMessage {
  factory Targetlist({
    $core.int? userID,
    $core.int? target1ID,
    $core.String? t1Type,
    $core.int? target2ID,
    $core.String? t2Type,
    $core.int? target3ID,
    $core.String? t3Type,
    $18.Timestamp? updatedAt,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (target1ID != null) {
      $result.target1ID = target1ID;
    }
    if (t1Type != null) {
      $result.t1Type = t1Type;
    }
    if (target2ID != null) {
      $result.target2ID = target2ID;
    }
    if (t2Type != null) {
      $result.t2Type = t2Type;
    }
    if (target3ID != null) {
      $result.target3ID = target3ID;
    }
    if (t3Type != null) {
      $result.t3Type = t3Type;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  Targetlist._() : super();
  factory Targetlist.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Targetlist.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Targetlist', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'Target1ID', $pb.PbFieldType.O3, protoName: 'Target1ID')
    ..aOS(3, _omitFieldNames ? '' : 'T1Type', protoName: 'T1Type')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'Target2ID', $pb.PbFieldType.O3, protoName: 'Target2ID')
    ..aOS(5, _omitFieldNames ? '' : 'T2Type', protoName: 'T2Type')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'Target3ID', $pb.PbFieldType.O3, protoName: 'Target3ID')
    ..aOS(7, _omitFieldNames ? '' : 'T3Type', protoName: 'T3Type')
    ..aOM<$18.Timestamp>(8, _omitFieldNames ? '' : 'UpdatedAt', protoName: 'UpdatedAt', subBuilder: $18.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Targetlist clone() => Targetlist()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Targetlist copyWith(void Function(Targetlist) updates) => super.copyWith((message) => updates(message as Targetlist)) as Targetlist;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Targetlist create() => Targetlist._();
  Targetlist createEmptyInstance() => create();
  static $pb.PbList<Targetlist> createRepeated() => $pb.PbList<Targetlist>();
  @$core.pragma('dart2js:noInline')
  static Targetlist getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Targetlist>(create);
  static Targetlist? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get target1ID => $_getIZ(1);
  @$pb.TagNumber(2)
  set target1ID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTarget1ID() => $_has(1);
  @$pb.TagNumber(2)
  void clearTarget1ID() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get t1Type => $_getSZ(2);
  @$pb.TagNumber(3)
  set t1Type($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasT1Type() => $_has(2);
  @$pb.TagNumber(3)
  void clearT1Type() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get target2ID => $_getIZ(3);
  @$pb.TagNumber(4)
  set target2ID($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTarget2ID() => $_has(3);
  @$pb.TagNumber(4)
  void clearTarget2ID() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get t2Type => $_getSZ(4);
  @$pb.TagNumber(5)
  set t2Type($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasT2Type() => $_has(4);
  @$pb.TagNumber(5)
  void clearT2Type() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get target3ID => $_getIZ(5);
  @$pb.TagNumber(6)
  set target3ID($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTarget3ID() => $_has(5);
  @$pb.TagNumber(6)
  void clearTarget3ID() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get t3Type => $_getSZ(6);
  @$pb.TagNumber(7)
  set t3Type($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasT3Type() => $_has(6);
  @$pb.TagNumber(7)
  void clearT3Type() => clearField(7);

  @$pb.TagNumber(8)
  $18.Timestamp get updatedAt => $_getN(7);
  @$pb.TagNumber(8)
  set updatedAt($18.Timestamp v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasUpdatedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearUpdatedAt() => clearField(8);
  @$pb.TagNumber(8)
  $18.Timestamp ensureUpdatedAt() => $_ensure(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
