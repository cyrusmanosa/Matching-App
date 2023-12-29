//
//  Generated code. Do not modify.
//  source: chatRecord.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $14;

class ChatRecord extends $pb.GeneratedMessage {
  factory ChatRecord({
    $core.int? targetID,
    $core.String? msgType,
    $core.String? message,
    $core.String? images,
    $14.Timestamp? createdAt,
  }) {
    final $result = create();
    if (targetID != null) {
      $result.targetID = targetID;
    }
    if (msgType != null) {
      $result.msgType = msgType;
    }
    if (message != null) {
      $result.message = message;
    }
    if (images != null) {
      $result.images = images;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  ChatRecord._() : super();
  factory ChatRecord.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatRecord.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatRecord', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'TargetID', $pb.PbFieldType.O3, protoName: 'TargetID')
    ..aOS(2, _omitFieldNames ? '' : 'MsgType', protoName: 'MsgType')
    ..aOS(3, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..aOS(4, _omitFieldNames ? '' : 'Images', protoName: 'Images')
    ..aOM<$14.Timestamp>(5, _omitFieldNames ? '' : 'CreatedAt', protoName: 'CreatedAt', subBuilder: $14.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatRecord clone() => ChatRecord()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatRecord copyWith(void Function(ChatRecord) updates) => super.copyWith((message) => updates(message as ChatRecord)) as ChatRecord;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatRecord create() => ChatRecord._();
  ChatRecord createEmptyInstance() => create();
  static $pb.PbList<ChatRecord> createRepeated() => $pb.PbList<ChatRecord>();
  @$core.pragma('dart2js:noInline')
  static ChatRecord getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatRecord>(create);
  static ChatRecord? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get targetID => $_getIZ(0);
  @$pb.TagNumber(1)
  set targetID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTargetID() => $_has(0);
  @$pb.TagNumber(1)
  void clearTargetID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get msgType => $_getSZ(1);
  @$pb.TagNumber(2)
  set msgType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMsgType() => $_has(1);
  @$pb.TagNumber(2)
  void clearMsgType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get images => $_getSZ(3);
  @$pb.TagNumber(4)
  set images($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasImages() => $_has(3);
  @$pb.TagNumber(4)
  void clearImages() => clearField(4);

  @$pb.TagNumber(5)
  $14.Timestamp get createdAt => $_getN(4);
  @$pb.TagNumber(5)
  set createdAt($14.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);
  @$pb.TagNumber(5)
  $14.Timestamp ensureCreatedAt() => $_ensure(4);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
