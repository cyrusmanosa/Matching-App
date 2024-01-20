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

import 'chatRecord.pb.dart' as $21;
import 'chatRecordNoID.pb.dart' as $22;
import 'google/protobuf/timestamp.pb.dart' as $17;

/// Create Chat Table
class CreateChatTableRequest extends $pb.GeneratedMessage {
  factory CreateChatTableRequest({
    $core.int? userID,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    return $result;
  }
  CreateChatTableRequest._() : super();
  factory CreateChatTableRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChatTableRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChatTableRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChatTableRequest clone() => CreateChatTableRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChatTableRequest copyWith(void Function(CreateChatTableRequest) updates) => super.copyWith((message) => updates(message as CreateChatTableRequest)) as CreateChatTableRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChatTableRequest create() => CreateChatTableRequest._();
  CreateChatTableRequest createEmptyInstance() => create();
  static $pb.PbList<CreateChatTableRequest> createRepeated() => $pb.PbList<CreateChatTableRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateChatTableRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChatTableRequest>(create);
  static CreateChatTableRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);
}

/// Create
class CreateChatRecordRequest extends $pb.GeneratedMessage {
  factory CreateChatRecordRequest({
    $core.int? userID,
    $core.int? targetID,
    $core.String? roleType,
    $core.String? mediaType,
    $core.String? media,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (targetID != null) {
      $result.targetID = targetID;
    }
    if (roleType != null) {
      $result.roleType = roleType;
    }
    if (mediaType != null) {
      $result.mediaType = mediaType;
    }
    if (media != null) {
      $result.media = media;
    }
    return $result;
  }
  CreateChatRecordRequest._() : super();
  factory CreateChatRecordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChatRecordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChatRecordRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'TargetID', $pb.PbFieldType.O3, protoName: 'TargetID')
    ..aOS(3, _omitFieldNames ? '' : 'RoleType', protoName: 'RoleType')
    ..aOS(4, _omitFieldNames ? '' : 'MediaType', protoName: 'MediaType')
    ..aOS(6, _omitFieldNames ? '' : 'Media', protoName: 'Media')
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
  $core.String get roleType => $_getSZ(2);
  @$pb.TagNumber(3)
  set roleType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoleType() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoleType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get mediaType => $_getSZ(3);
  @$pb.TagNumber(4)
  set mediaType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMediaType() => $_has(3);
  @$pb.TagNumber(4)
  void clearMediaType() => clearField(4);

  @$pb.TagNumber(6)
  $core.String get media => $_getSZ(4);
  @$pb.TagNumber(6)
  set media($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasMedia() => $_has(4);
  @$pb.TagNumber(6)
  void clearMedia() => clearField(6);
}

class CreateChatRecordResponse extends $pb.GeneratedMessage {
  factory CreateChatRecordResponse({
    $21.ChatRecord? chatRecord,
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
    ..aOM<$21.ChatRecord>(1, _omitFieldNames ? '' : 'ChatRecord', protoName: 'ChatRecord', subBuilder: $21.ChatRecord.create)
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
  $21.ChatRecord get chatRecord => $_getN(0);
  @$pb.TagNumber(1)
  set chatRecord($21.ChatRecord v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRecord() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRecord() => clearField(1);
  @$pb.TagNumber(1)
  $21.ChatRecord ensureChatRecord() => $_ensure(0);
}

/// GetRecord
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
    $core.Iterable<$22.ChatRecordNoID>? chatRecordNoID,
  }) {
    final $result = create();
    if (chatRecordNoID != null) {
      $result.chatRecordNoID.addAll(chatRecordNoID);
    }
    return $result;
  }
  GetChatRecordResponse._() : super();
  factory GetChatRecordResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatRecordResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChatRecordResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..pc<$22.ChatRecordNoID>(1, _omitFieldNames ? '' : 'ChatRecordNoID', $pb.PbFieldType.PM, protoName: 'ChatRecordNoID', subBuilder: $22.ChatRecordNoID.create)
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
  $core.List<$22.ChatRecordNoID> get chatRecordNoID => $_getList(0);
}

/// GetTargetID
class GetTargetIDRequest extends $pb.GeneratedMessage {
  factory GetTargetIDRequest({
    $core.int? userID,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    return $result;
  }
  GetTargetIDRequest._() : super();
  factory GetTargetIDRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTargetIDRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTargetIDRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTargetIDRequest clone() => GetTargetIDRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTargetIDRequest copyWith(void Function(GetTargetIDRequest) updates) => super.copyWith((message) => updates(message as GetTargetIDRequest)) as GetTargetIDRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTargetIDRequest create() => GetTargetIDRequest._();
  GetTargetIDRequest createEmptyInstance() => create();
  static $pb.PbList<GetTargetIDRequest> createRepeated() => $pb.PbList<GetTargetIDRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTargetIDRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTargetIDRequest>(create);
  static GetTargetIDRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);
}

class GetTargetIDResponse extends $pb.GeneratedMessage {
  factory GetTargetIDResponse({
    $core.Iterable<$core.int>? targetID,
  }) {
    final $result = create();
    if (targetID != null) {
      $result.targetID.addAll(targetID);
    }
    return $result;
  }
  GetTargetIDResponse._() : super();
  factory GetTargetIDResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTargetIDResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTargetIDResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'TargetID', $pb.PbFieldType.K3, protoName: 'TargetID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTargetIDResponse clone() => GetTargetIDResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTargetIDResponse copyWith(void Function(GetTargetIDResponse) updates) => super.copyWith((message) => updates(message as GetTargetIDResponse)) as GetTargetIDResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTargetIDResponse create() => GetTargetIDResponse._();
  GetTargetIDResponse createEmptyInstance() => create();
  static $pb.PbList<GetTargetIDResponse> createRepeated() => $pb.PbList<GetTargetIDResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTargetIDResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTargetIDResponse>(create);
  static GetTargetIDResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get targetID => $_getList(0);
}

/// GetLastMsg
class GetLastMsgRequest extends $pb.GeneratedMessage {
  factory GetLastMsgRequest({
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
  GetLastMsgRequest._() : super();
  factory GetLastMsgRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLastMsgRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLastMsgRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'TargetID', $pb.PbFieldType.O3, protoName: 'TargetID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLastMsgRequest clone() => GetLastMsgRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLastMsgRequest copyWith(void Function(GetLastMsgRequest) updates) => super.copyWith((message) => updates(message as GetLastMsgRequest)) as GetLastMsgRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLastMsgRequest create() => GetLastMsgRequest._();
  GetLastMsgRequest createEmptyInstance() => create();
  static $pb.PbList<GetLastMsgRequest> createRepeated() => $pb.PbList<GetLastMsgRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLastMsgRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLastMsgRequest>(create);
  static GetLastMsgRequest? _defaultInstance;

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

class GetLastMsgResponse extends $pb.GeneratedMessage {
  factory GetLastMsgResponse({
    $core.String? mediaType,
    $core.String? media,
    $core.bool? isRead,
  }) {
    final $result = create();
    if (mediaType != null) {
      $result.mediaType = mediaType;
    }
    if (media != null) {
      $result.media = media;
    }
    if (isRead != null) {
      $result.isRead = isRead;
    }
    return $result;
  }
  GetLastMsgResponse._() : super();
  factory GetLastMsgResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLastMsgResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLastMsgResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'MediaType', protoName: 'MediaType')
    ..aOS(2, _omitFieldNames ? '' : 'Media', protoName: 'Media')
    ..aOB(3, _omitFieldNames ? '' : 'IsRead', protoName: 'IsRead')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLastMsgResponse clone() => GetLastMsgResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLastMsgResponse copyWith(void Function(GetLastMsgResponse) updates) => super.copyWith((message) => updates(message as GetLastMsgResponse)) as GetLastMsgResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLastMsgResponse create() => GetLastMsgResponse._();
  GetLastMsgResponse createEmptyInstance() => create();
  static $pb.PbList<GetLastMsgResponse> createRepeated() => $pb.PbList<GetLastMsgResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLastMsgResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLastMsgResponse>(create);
  static GetLastMsgResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get mediaType => $_getSZ(0);
  @$pb.TagNumber(1)
  set mediaType($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMediaType() => $_has(0);
  @$pb.TagNumber(1)
  void clearMediaType() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get media => $_getSZ(1);
  @$pb.TagNumber(2)
  set media($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMedia() => $_has(1);
  @$pb.TagNumber(2)
  void clearMedia() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get isRead => $_getBF(2);
  @$pb.TagNumber(3)
  set isRead($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIsRead() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsRead() => clearField(3);
}

class GetChatRowRequest extends $pb.GeneratedMessage {
  factory GetChatRowRequest({
    $core.int? userID,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    return $result;
  }
  GetChatRowRequest._() : super();
  factory GetChatRowRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatRowRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChatRowRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChatRowRequest clone() => GetChatRowRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChatRowRequest copyWith(void Function(GetChatRowRequest) updates) => super.copyWith((message) => updates(message as GetChatRowRequest)) as GetChatRowRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChatRowRequest create() => GetChatRowRequest._();
  GetChatRowRequest createEmptyInstance() => create();
  static $pb.PbList<GetChatRowRequest> createRepeated() => $pb.PbList<GetChatRowRequest>();
  @$core.pragma('dart2js:noInline')
  static GetChatRowRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatRowRequest>(create);
  static GetChatRowRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);
}

class GetChatRowResponse extends $pb.GeneratedMessage {
  factory GetChatRowResponse({
    $core.int? row,
  }) {
    final $result = create();
    if (row != null) {
      $result.row = row;
    }
    return $result;
  }
  GetChatRowResponse._() : super();
  factory GetChatRowResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChatRowResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChatRowResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'Row', $pb.PbFieldType.O3, protoName: 'Row')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChatRowResponse clone() => GetChatRowResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChatRowResponse copyWith(void Function(GetChatRowResponse) updates) => super.copyWith((message) => updates(message as GetChatRowResponse)) as GetChatRowResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChatRowResponse create() => GetChatRowResponse._();
  GetChatRowResponse createEmptyInstance() => create();
  static $pb.PbList<GetChatRowResponse> createRepeated() => $pb.PbList<GetChatRowResponse>();
  @$core.pragma('dart2js:noInline')
  static GetChatRowResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChatRowResponse>(create);
  static GetChatRowResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get row => $_getIZ(0);
  @$pb.TagNumber(1)
  set row($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRow() => $_has(0);
  @$pb.TagNumber(1)
  void clearRow() => clearField(1);
}

/// Update
class UpdateChatRecordRequest extends $pb.GeneratedMessage {
  factory UpdateChatRecordRequest({
    $core.int? userID,
    $core.int? targetID,
    $core.String? roleType,
    $core.String? mediaType,
    $core.String? media,
    $17.Timestamp? createAt,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (targetID != null) {
      $result.targetID = targetID;
    }
    if (roleType != null) {
      $result.roleType = roleType;
    }
    if (mediaType != null) {
      $result.mediaType = mediaType;
    }
    if (media != null) {
      $result.media = media;
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
    ..aOS(3, _omitFieldNames ? '' : 'RoleType', protoName: 'RoleType')
    ..aOS(4, _omitFieldNames ? '' : 'MediaType', protoName: 'MediaType')
    ..aOS(5, _omitFieldNames ? '' : 'Media', protoName: 'Media')
    ..aOM<$17.Timestamp>(6, _omitFieldNames ? '' : 'CreateAt', protoName: 'CreateAt', subBuilder: $17.Timestamp.create)
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
  $core.String get roleType => $_getSZ(2);
  @$pb.TagNumber(3)
  set roleType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasRoleType() => $_has(2);
  @$pb.TagNumber(3)
  void clearRoleType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get mediaType => $_getSZ(3);
  @$pb.TagNumber(4)
  set mediaType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMediaType() => $_has(3);
  @$pb.TagNumber(4)
  void clearMediaType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get media => $_getSZ(4);
  @$pb.TagNumber(5)
  set media($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasMedia() => $_has(4);
  @$pb.TagNumber(5)
  void clearMedia() => clearField(5);

  @$pb.TagNumber(6)
  $17.Timestamp get createAt => $_getN(5);
  @$pb.TagNumber(6)
  set createAt($17.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasCreateAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreateAt() => clearField(6);
  @$pb.TagNumber(6)
  $17.Timestamp ensureCreateAt() => $_ensure(5);
}

class UpdateChatRecordResponse extends $pb.GeneratedMessage {
  factory UpdateChatRecordResponse({
    $21.ChatRecord? chatRecord,
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
    ..aOM<$21.ChatRecord>(1, _omitFieldNames ? '' : 'ChatRecord', protoName: 'ChatRecord', subBuilder: $21.ChatRecord.create)
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
  $21.ChatRecord get chatRecord => $_getN(0);
  @$pb.TagNumber(1)
  set chatRecord($21.ChatRecord v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasChatRecord() => $_has(0);
  @$pb.TagNumber(1)
  void clearChatRecord() => clearField(1);
  @$pb.TagNumber(1)
  $21.ChatRecord ensureChatRecord() => $_ensure(0);
}

class UpdateReadRequest extends $pb.GeneratedMessage {
  factory UpdateReadRequest({
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
  UpdateReadRequest._() : super();
  factory UpdateReadRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateReadRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateReadRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'TargetID', $pb.PbFieldType.O3, protoName: 'TargetID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateReadRequest clone() => UpdateReadRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateReadRequest copyWith(void Function(UpdateReadRequest) updates) => super.copyWith((message) => updates(message as UpdateReadRequest)) as UpdateReadRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateReadRequest create() => UpdateReadRequest._();
  UpdateReadRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateReadRequest> createRepeated() => $pb.PbList<UpdateReadRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateReadRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateReadRequest>(create);
  static UpdateReadRequest? _defaultInstance;

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

/// Delete
class DeleteChatTableRequest extends $pb.GeneratedMessage {
  factory DeleteChatTableRequest({
    $core.int? userID,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    return $result;
  }
  DeleteChatTableRequest._() : super();
  factory DeleteChatTableRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteChatTableRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteChatTableRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteChatTableRequest clone() => DeleteChatTableRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteChatTableRequest copyWith(void Function(DeleteChatTableRequest) updates) => super.copyWith((message) => updates(message as DeleteChatTableRequest)) as DeleteChatTableRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteChatTableRequest create() => DeleteChatTableRequest._();
  DeleteChatTableRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteChatTableRequest> createRepeated() => $pb.PbList<DeleteChatTableRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteChatTableRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteChatTableRequest>(create);
  static DeleteChatTableRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
