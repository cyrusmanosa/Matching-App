//
//  Generated code. Do not modify.
//  source: changeTarget.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $18;

class ChangeTarget extends $pb.GeneratedMessage {
  factory ChangeTarget({
    $core.int? userID,
    $core.int? changeUserID,
    $core.String? reason,
    $core.int? frequency,
    $18.Timestamp? changeTime,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (changeUserID != null) {
      $result.changeUserID = changeUserID;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    if (frequency != null) {
      $result.frequency = frequency;
    }
    if (changeTime != null) {
      $result.changeTime = changeTime;
    }
    return $result;
  }
  ChangeTarget._() : super();
  factory ChangeTarget.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChangeTarget.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChangeTarget', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'ChangeUserID', $pb.PbFieldType.O3, protoName: 'ChangeUserID')
    ..aOS(3, _omitFieldNames ? '' : 'Reason', protoName: 'Reason')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'Frequency', $pb.PbFieldType.O3, protoName: 'Frequency')
    ..aOM<$18.Timestamp>(5, _omitFieldNames ? '' : 'ChangeTime', protoName: 'ChangeTime', subBuilder: $18.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChangeTarget clone() => ChangeTarget()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChangeTarget copyWith(void Function(ChangeTarget) updates) => super.copyWith((message) => updates(message as ChangeTarget)) as ChangeTarget;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangeTarget create() => ChangeTarget._();
  ChangeTarget createEmptyInstance() => create();
  static $pb.PbList<ChangeTarget> createRepeated() => $pb.PbList<ChangeTarget>();
  @$core.pragma('dart2js:noInline')
  static ChangeTarget getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChangeTarget>(create);
  static ChangeTarget? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get changeUserID => $_getIZ(1);
  @$pb.TagNumber(2)
  set changeUserID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasChangeUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearChangeUserID() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get reason => $_getSZ(2);
  @$pb.TagNumber(3)
  set reason($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get frequency => $_getIZ(3);
  @$pb.TagNumber(4)
  set frequency($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFrequency() => $_has(3);
  @$pb.TagNumber(4)
  void clearFrequency() => clearField(4);

  @$pb.TagNumber(5)
  $18.Timestamp get changeTime => $_getN(4);
  @$pb.TagNumber(5)
  set changeTime($18.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasChangeTime() => $_has(4);
  @$pb.TagNumber(5)
  void clearChangeTime() => clearField(5);
  @$pb.TagNumber(5)
  $18.Timestamp ensureChangeTime() => $_ensure(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
