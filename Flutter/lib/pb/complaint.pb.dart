//
//  Generated code. Do not modify.
//  source: complaint.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $16;

class Complaint extends $pb.GeneratedMessage {
  factory Complaint({
    $core.int? cpID,
    $core.int? userID,
    $core.int? cpTargetID,
    $core.String? cpType,
    $core.String? cpMessage,
    $core.String? status,
    $16.Timestamp? complaintTime,
  }) {
    final $result = create();
    if (cpID != null) {
      $result.cpID = cpID;
    }
    if (userID != null) {
      $result.userID = userID;
    }
    if (cpTargetID != null) {
      $result.cpTargetID = cpTargetID;
    }
    if (cpType != null) {
      $result.cpType = cpType;
    }
    if (cpMessage != null) {
      $result.cpMessage = cpMessage;
    }
    if (status != null) {
      $result.status = status;
    }
    if (complaintTime != null) {
      $result.complaintTime = complaintTime;
    }
    return $result;
  }
  Complaint._() : super();
  factory Complaint.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Complaint.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Complaint', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'CpID', $pb.PbFieldType.O3, protoName: 'CpID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'CpTargetID', $pb.PbFieldType.O3, protoName: 'CpTargetID')
    ..aOS(4, _omitFieldNames ? '' : 'CpType', protoName: 'CpType')
    ..aOS(5, _omitFieldNames ? '' : 'CpMessage', protoName: 'CpMessage')
    ..aOS(6, _omitFieldNames ? '' : 'Status', protoName: 'Status')
    ..aOM<$16.Timestamp>(7, _omitFieldNames ? '' : 'ComplaintTime', protoName: 'ComplaintTime', subBuilder: $16.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Complaint clone() => Complaint()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Complaint copyWith(void Function(Complaint) updates) => super.copyWith((message) => updates(message as Complaint)) as Complaint;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Complaint create() => Complaint._();
  Complaint createEmptyInstance() => create();
  static $pb.PbList<Complaint> createRepeated() => $pb.PbList<Complaint>();
  @$core.pragma('dart2js:noInline')
  static Complaint getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Complaint>(create);
  static Complaint? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get cpID => $_getIZ(0);
  @$pb.TagNumber(1)
  set cpID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasCpID() => $_has(0);
  @$pb.TagNumber(1)
  void clearCpID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userID => $_getIZ(1);
  @$pb.TagNumber(2)
  set userID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserID() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get cpTargetID => $_getIZ(2);
  @$pb.TagNumber(3)
  set cpTargetID($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCpTargetID() => $_has(2);
  @$pb.TagNumber(3)
  void clearCpTargetID() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get cpType => $_getSZ(3);
  @$pb.TagNumber(4)
  set cpType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCpType() => $_has(3);
  @$pb.TagNumber(4)
  void clearCpType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get cpMessage => $_getSZ(4);
  @$pb.TagNumber(5)
  set cpMessage($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCpMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearCpMessage() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get status => $_getSZ(5);
  @$pb.TagNumber(6)
  set status($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => clearField(6);

  @$pb.TagNumber(7)
  $16.Timestamp get complaintTime => $_getN(6);
  @$pb.TagNumber(7)
  set complaintTime($16.Timestamp v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasComplaintTime() => $_has(6);
  @$pb.TagNumber(7)
  void clearComplaintTime() => clearField(7);
  @$pb.TagNumber(7)
  $16.Timestamp ensureComplaintTime() => $_ensure(6);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
