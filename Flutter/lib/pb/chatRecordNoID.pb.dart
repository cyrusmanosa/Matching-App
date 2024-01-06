//
//  Generated code. Do not modify.
//  source: chatRecordNoID.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $16;

class ChatRecordNoID extends $pb.GeneratedMessage {
  factory ChatRecordNoID({
    $core.String? roleType,
    $core.String? mediaType,
    $core.String? message,
    $core.String? media,
    $core.bool? isread,
    $16.Timestamp? createdAt,
  }) {
    final $result = create();
    if (roleType != null) {
      $result.roleType = roleType;
    }
    if (mediaType != null) {
      $result.mediaType = mediaType;
    }
    if (message != null) {
      $result.message = message;
    }
    if (media != null) {
      $result.media = media;
    }
    if (isread != null) {
      $result.isread = isread;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    return $result;
  }
  ChatRecordNoID._() : super();
  factory ChatRecordNoID.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ChatRecordNoID.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ChatRecordNoID', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'RoleType', protoName: 'RoleType')
    ..aOS(2, _omitFieldNames ? '' : 'MediaType', protoName: 'MediaType')
    ..aOS(3, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..aOS(4, _omitFieldNames ? '' : 'Media', protoName: 'Media')
    ..aOB(5, _omitFieldNames ? '' : 'Isread', protoName: 'Isread')
    ..aOM<$16.Timestamp>(6, _omitFieldNames ? '' : 'CreatedAt', protoName: 'CreatedAt', subBuilder: $16.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ChatRecordNoID clone() => ChatRecordNoID()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ChatRecordNoID copyWith(void Function(ChatRecordNoID) updates) => super.copyWith((message) => updates(message as ChatRecordNoID)) as ChatRecordNoID;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChatRecordNoID create() => ChatRecordNoID._();
  ChatRecordNoID createEmptyInstance() => create();
  static $pb.PbList<ChatRecordNoID> createRepeated() => $pb.PbList<ChatRecordNoID>();
  @$core.pragma('dart2js:noInline')
  static ChatRecordNoID getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ChatRecordNoID>(create);
  static ChatRecordNoID? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get roleType => $_getSZ(0);
  @$pb.TagNumber(1)
  set roleType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRoleType() => $_has(0);
  @$pb.TagNumber(1)
  void clearRoleType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get mediaType => $_getSZ(1);
  @$pb.TagNumber(2)
  set mediaType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMediaType() => $_has(1);
  @$pb.TagNumber(2)
  void clearMediaType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get media => $_getSZ(3);
  @$pb.TagNumber(4)
  set media($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMedia() => $_has(3);
  @$pb.TagNumber(4)
  void clearMedia() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get isread => $_getBF(4);
  @$pb.TagNumber(5)
  set isread($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIsread() => $_has(4);
  @$pb.TagNumber(5)
  void clearIsread() => clearField(5);

  @$pb.TagNumber(6)
  $16.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($16.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => clearField(6);
  @$pb.TagNumber(6)
  $16.Timestamp ensureCreatedAt() => $_ensure(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
