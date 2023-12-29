//
//  Generated code. Do not modify.
//  source: rpc_chatRecord.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'chatRecord.pb.dart' as $18;
import 'google/protobuf/timestamp.pb.dart' as $14;

/// Create
class CreateChatRecordRequest extends $pb.GeneratedMessage {
  factory CreateChatRecordRequest({
    $core.int? userID,
    $core.int? targetID,
    $core.String? msgType,
    $core.String? message,
    $core.String? images,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
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
    return $result;
  }
  CreateChatRecordRequest._() : super();
  factory CreateChatRecordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChatRecordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChatRecordRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'TargetID', $pb.PbFieldType.O3, protoName: 'TargetID')
    ..aOS(3, _omitFieldNames ? '' : 'MsgType', protoName: 'MsgType')
    ..aOS(4, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..aOS(5, _omitFieldNames ? '' : 'Images', protoName: 'Images')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChatRecordRequest clone() => CreateChatRecordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChatRecordRequest copyWith(void Function(CreateChatRecordRequest) updates) => super.copyWith((message) => updates(message as CreateChatRecordRequest)) as CreateChatRecordRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChatRecordRequest create() => CreateChatRecordRequest._();
  CreateChatRecordRequest createEmptyInstance() => create();
  static $pb.PbList<CreateChatRecordRequest> createRepeated() => $pb.PbList<CreateChatRecordRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateChatRecordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChatRecordRequest>(create);
  static CreateChatRecordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get targetID => $_getIZ(1);
  @$pb.TagNumber(2)
  set targetID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetID() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetID() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get msgType => $_getSZ(2);
  @$pb.TagNumber(3)
  set msgType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsgType() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsgType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get images => $_getSZ(4);
  @$pb.TagNumber(5)
  set images($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasImages() => $_has(4);
  @$pb.TagNumber(5)
  void clearImages() => clearField(5);
}

class CreateChatRecordResponse extends $pb.GeneratedMessage {
  factory CreateChatRecordResponse({
    $18.ChatRecord? chatRecord,
  }) {
    final $result = create();
    if (chatRecord != null) {
      $result.chatRecord = chatRecord;
    }
    return $result;
  }
  CreateChatRecordResponse._() : super();
  factory CreateChatRecordResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChatRecordResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChatRecordResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$18.ChatRecord>(1, _omitFieldNames ? '' : 'ChatRecord', protoName: 'ChatRecord', subBuilder: $18.ChatRecord.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChatRecordResponse clone() => CreateChatRecordResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChatRecordResponse copyWith(void Function(CreateChatRecordResponse) updates) => super.copyWith((message) => updates(message as CreateChatRecordResponse)) as CreateChatRecordResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChatRecordResponse create() => CreateChatRecordResponse._();
  CreateChatRecordResponse createEmptyInstance() => create();
  static $pb.PbList<CreateChatRecordResponse> createRepeated() => $pb.PbList<CreateChatRecordResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateChatRecordResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChatRecordResponse>(create);
  static CreateChatRecordResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $18.ChatRecord get chatRecord => $_getN(0);
  @$pb.TagNumber(1)
  set chatRecord($18.ChatRecord v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRecord() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRecord() => clearField(1);
  @$pb.TagNumber(1)
  $18.ChatRecord ensureChatRecord() => $_ensure(0);
}

/// Get
class GetChatRecordRequest extends $pb.GeneratedMessage {
  factory GetChatRecordRequest({
    $core.int? userID,
    $core.int? targetID,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (targetID != null) {
      $result.targetID = targetID;
    }
    return $result;
  }
  GetChatRecordRequest._() : super();
  factory GetChatRecordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatRecordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChatRecordRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'TargetID', $pb.PbFieldType.O3, protoName: 'TargetID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChatRecordRequest clone() => GetChatRecordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChatRecordRequest copyWith(void Function(GetChatRecordRequest) updates) => super.copyWith((message) => updates(message as GetChatRecordRequest)) as GetChatRecordRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChatRecordRequest create() => GetChatRecordRequest._();
  GetChatRecordRequest createEmptyInstance() => create();
  static $pb.PbList<GetChatRecordRequest> createRepeated() => $pb.PbList<GetChatRecordRequest>();
  @$core.pragma('dart2js:noInline')
  static GetChatRecordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatRecordRequest>(create);
  static GetChatRecordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get targetID => $_getIZ(1);
  @$pb.TagNumber(2)
  set targetID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetID() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetID() => clearField(2);
}

class GetChatRecordResponse extends $pb.GeneratedMessage {
  factory GetChatRecordResponse({
    $core.Iterable<$18.ChatRecord>? chatRecord,
  }) {
    final $result = create();
    if (chatRecord != null) {
      $result.chatRecord.addAll(chatRecord);
    }
    return $result;
  }
  GetChatRecordResponse._() : super();
  factory GetChatRecordResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatRecordResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChatRecordResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<$18.ChatRecord>(1, _omitFieldNames ? '' : 'ChatRecord', $pb.PbFieldType.PM, protoName: 'ChatRecord', subBuilder: $18.ChatRecord.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChatRecordResponse clone() => GetChatRecordResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChatRecordResponse copyWith(void Function(GetChatRecordResponse) updates) => super.copyWith((message) => updates(message as GetChatRecordResponse)) as GetChatRecordResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChatRecordResponse create() => GetChatRecordResponse._();
  GetChatRecordResponse createEmptyInstance() => create();
  static $pb.PbList<GetChatRecordResponse> createRepeated() => $pb.PbList<GetChatRecordResponse>();
  @$core.pragma('dart2js:noInline')
  static GetChatRecordResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatRecordResponse>(create);
  static GetChatRecordResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$18.ChatRecord> get chatRecord => $_getList(0);
}

/// Update
class UpdateChatRecordRequest extends $pb.GeneratedMessage {
  factory UpdateChatRecordRequest({
    $core.int? userID,
    $core.int? targetID,
    $core.String? msgType,
    $core.String? message,
    $14.Timestamp? createAt,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (targetID != null) {
      $result.targetID = targetID;
    }
    if (msgType != null) {
      $result.msgType = msgType;
    }
    if (message != null) {
      $result.message = message;
    }
    if (createAt != null) {
      $result.createAt = createAt;
    }
    return $result;
  }
  UpdateChatRecordRequest._() : super();
  factory UpdateChatRecordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateChatRecordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateChatRecordRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'TargetID', $pb.PbFieldType.O3, protoName: 'TargetID')
    ..aOS(3, _omitFieldNames ? '' : 'MsgType', protoName: 'MsgType')
    ..aOS(4, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..aOM<$14.Timestamp>(5, _omitFieldNames ? '' : 'CreateAt', protoName: 'CreateAt', subBuilder: $14.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateChatRecordRequest clone() => UpdateChatRecordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateChatRecordRequest copyWith(void Function(UpdateChatRecordRequest) updates) => super.copyWith((message) => updates(message as UpdateChatRecordRequest)) as UpdateChatRecordRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateChatRecordRequest create() => UpdateChatRecordRequest._();
  UpdateChatRecordRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateChatRecordRequest> createRepeated() => $pb.PbList<UpdateChatRecordRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateChatRecordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateChatRecordRequest>(create);
  static UpdateChatRecordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get targetID => $_getIZ(1);
  @$pb.TagNumber(2)
  set targetID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetID() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetID() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get msgType => $_getSZ(2);
  @$pb.TagNumber(3)
  set msgType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMsgType() => $_has(2);
  @$pb.TagNumber(3)
  void clearMsgType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);

  @$pb.TagNumber(5)
  $14.Timestamp get createAt => $_getN(4);
  @$pb.TagNumber(5)
  set createAt($14.Timestamp v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreateAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreateAt() => clearField(5);
  @$pb.TagNumber(5)
  $14.Timestamp ensureCreateAt() => $_ensure(4);
}

class UpdateChatRecordResponse extends $pb.GeneratedMessage {
  factory UpdateChatRecordResponse({
    $18.ChatRecord? chatRecord,
  }) {
    final $result = create();
    if (chatRecord != null) {
      $result.chatRecord = chatRecord;
    }
    return $result;
  }
  UpdateChatRecordResponse._() : super();
  factory UpdateChatRecordResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateChatRecordResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateChatRecordResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$18.ChatRecord>(1, _omitFieldNames ? '' : 'ChatRecord', protoName: 'ChatRecord', subBuilder: $18.ChatRecord.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateChatRecordResponse clone() => UpdateChatRecordResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateChatRecordResponse copyWith(void Function(UpdateChatRecordResponse) updates) => super.copyWith((message) => updates(message as UpdateChatRecordResponse)) as UpdateChatRecordResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateChatRecordResponse create() => UpdateChatRecordResponse._();
  UpdateChatRecordResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateChatRecordResponse> createRepeated() => $pb.PbList<UpdateChatRecordResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateChatRecordResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateChatRecordResponse>(create);
  static UpdateChatRecordResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $18.ChatRecord get chatRecord => $_getN(0);
  @$pb.TagNumber(1)
  set chatRecord($18.ChatRecord v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRecord() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRecord() => clearField(1);
  @$pb.TagNumber(1)
  $18.ChatRecord ensureChatRecord() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
