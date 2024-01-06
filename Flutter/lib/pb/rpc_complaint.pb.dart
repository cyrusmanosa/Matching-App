//
//  Generated code. Do not modify.
//  source: rpc_complaint.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'complaint.pb.dart' as $22;

/// Create
class CreateComplaintRequest extends $pb.GeneratedMessage {
  factory CreateComplaintRequest({
    $core.String? sessionID,
    $core.int? cpTargetID,
    $core.String? cpType,
    $core.String? cpMessage,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
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
    return $result;
  }
  CreateComplaintRequest._() : super();
  factory CreateComplaintRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateComplaintRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateComplaintRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'CpTargetID', $pb.PbFieldType.O3, protoName: 'CpTargetID')
    ..aOS(3, _omitFieldNames ? '' : 'CpType', protoName: 'CpType')
    ..aOS(4, _omitFieldNames ? '' : 'CpMessage', protoName: 'CpMessage')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateComplaintRequest clone() => CreateComplaintRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateComplaintRequest copyWith(void Function(CreateComplaintRequest) updates) => super.copyWith((message) => updates(message as CreateComplaintRequest)) as CreateComplaintRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateComplaintRequest create() => CreateComplaintRequest._();
  CreateComplaintRequest createEmptyInstance() => create();
  static $pb.PbList<CreateComplaintRequest> createRepeated() => $pb.PbList<CreateComplaintRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateComplaintRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateComplaintRequest>(create);
  static CreateComplaintRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get cpTargetID => $_getIZ(1);
  @$pb.TagNumber(2)
  set cpTargetID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCpTargetID() => $_has(1);
  @$pb.TagNumber(2)
  void clearCpTargetID() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get cpType => $_getSZ(2);
  @$pb.TagNumber(3)
  set cpType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCpType() => $_has(2);
  @$pb.TagNumber(3)
  void clearCpType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get cpMessage => $_getSZ(3);
  @$pb.TagNumber(4)
  set cpMessage($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCpMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearCpMessage() => clearField(4);
}

class CreateComplaintResponse extends $pb.GeneratedMessage {
  factory CreateComplaintResponse({
    $22.Complaint? cp,
  }) {
    final $result = create();
    if (cp != null) {
      $result.cp = cp;
    }
    return $result;
  }
  CreateComplaintResponse._() : super();
  factory CreateComplaintResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateComplaintResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateComplaintResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$22.Complaint>(1, _omitFieldNames ? '' : 'cp', subBuilder: $22.Complaint.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateComplaintResponse clone() => CreateComplaintResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateComplaintResponse copyWith(void Function(CreateComplaintResponse) updates) => super.copyWith((message) => updates(message as CreateComplaintResponse)) as CreateComplaintResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateComplaintResponse create() => CreateComplaintResponse._();
  CreateComplaintResponse createEmptyInstance() => create();
  static $pb.PbList<CreateComplaintResponse> createRepeated() => $pb.PbList<CreateComplaintResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateComplaintResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateComplaintResponse>(create);
  static CreateComplaintResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $22.Complaint get cp => $_getN(0);
  @$pb.TagNumber(1)
  set cp($22.Complaint v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCp() => $_has(0);
  @$pb.TagNumber(1)
  void clearCp() => clearField(1);
  @$pb.TagNumber(1)
  $22.Complaint ensureCp() => $_ensure(0);
}

/// Get
class GetComplaintRequest extends $pb.GeneratedMessage {
  factory GetComplaintRequest({
    $core.String? sessionID,
    $core.int? cpID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (cpID != null) {
      $result.cpID = cpID;
    }
    return $result;
  }
  GetComplaintRequest._() : super();
  factory GetComplaintRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetComplaintRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetComplaintRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'CpID', $pb.PbFieldType.O3, protoName: 'CpID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetComplaintRequest clone() => GetComplaintRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetComplaintRequest copyWith(void Function(GetComplaintRequest) updates) => super.copyWith((message) => updates(message as GetComplaintRequest)) as GetComplaintRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetComplaintRequest create() => GetComplaintRequest._();
  GetComplaintRequest createEmptyInstance() => create();
  static $pb.PbList<GetComplaintRequest> createRepeated() => $pb.PbList<GetComplaintRequest>();
  @$core.pragma('dart2js:noInline')
  static GetComplaintRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetComplaintRequest>(create);
  static GetComplaintRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get cpID => $_getIZ(1);
  @$pb.TagNumber(2)
  set cpID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCpID() => $_has(1);
  @$pb.TagNumber(2)
  void clearCpID() => clearField(2);
}

class GetComplaintResponse extends $pb.GeneratedMessage {
  factory GetComplaintResponse({
    $22.Complaint? cp,
  }) {
    final $result = create();
    if (cp != null) {
      $result.cp = cp;
    }
    return $result;
  }
  GetComplaintResponse._() : super();
  factory GetComplaintResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetComplaintResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetComplaintResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$22.Complaint>(1, _omitFieldNames ? '' : 'cp', subBuilder: $22.Complaint.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetComplaintResponse clone() => GetComplaintResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetComplaintResponse copyWith(void Function(GetComplaintResponse) updates) => super.copyWith((message) => updates(message as GetComplaintResponse)) as GetComplaintResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetComplaintResponse create() => GetComplaintResponse._();
  GetComplaintResponse createEmptyInstance() => create();
  static $pb.PbList<GetComplaintResponse> createRepeated() => $pb.PbList<GetComplaintResponse>();
  @$core.pragma('dart2js:noInline')
  static GetComplaintResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetComplaintResponse>(create);
  static GetComplaintResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $22.Complaint get cp => $_getN(0);
  @$pb.TagNumber(1)
  set cp($22.Complaint v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCp() => $_has(0);
  @$pb.TagNumber(1)
  void clearCp() => clearField(1);
  @$pb.TagNumber(1)
  $22.Complaint ensureCp() => $_ensure(0);
}

/// Update
class UpdateComplaintRequest extends $pb.GeneratedMessage {
  factory UpdateComplaintRequest({
    $core.String? sessionID,
    $core.int? cpID,
    $core.String? status,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (cpID != null) {
      $result.cpID = cpID;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  UpdateComplaintRequest._() : super();
  factory UpdateComplaintRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateComplaintRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateComplaintRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'CpID', $pb.PbFieldType.O3, protoName: 'CpID')
    ..aOS(3, _omitFieldNames ? '' : 'Status', protoName: 'Status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateComplaintRequest clone() => UpdateComplaintRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateComplaintRequest copyWith(void Function(UpdateComplaintRequest) updates) => super.copyWith((message) => updates(message as UpdateComplaintRequest)) as UpdateComplaintRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateComplaintRequest create() => UpdateComplaintRequest._();
  UpdateComplaintRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateComplaintRequest> createRepeated() => $pb.PbList<UpdateComplaintRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateComplaintRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateComplaintRequest>(create);
  static UpdateComplaintRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get cpID => $_getIZ(1);
  @$pb.TagNumber(2)
  set cpID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasCpID() => $_has(1);
  @$pb.TagNumber(2)
  void clearCpID() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get status => $_getSZ(2);
  @$pb.TagNumber(3)
  set status($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => clearField(3);
}

class UpdateComplaintResponse extends $pb.GeneratedMessage {
  factory UpdateComplaintResponse({
    $22.Complaint? cp,
  }) {
    final $result = create();
    if (cp != null) {
      $result.cp = cp;
    }
    return $result;
  }
  UpdateComplaintResponse._() : super();
  factory UpdateComplaintResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateComplaintResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateComplaintResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$22.Complaint>(1, _omitFieldNames ? '' : 'cp', subBuilder: $22.Complaint.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateComplaintResponse clone() => UpdateComplaintResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateComplaintResponse copyWith(void Function(UpdateComplaintResponse) updates) => super.copyWith((message) => updates(message as UpdateComplaintResponse)) as UpdateComplaintResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateComplaintResponse create() => UpdateComplaintResponse._();
  UpdateComplaintResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateComplaintResponse> createRepeated() => $pb.PbList<UpdateComplaintResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateComplaintResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateComplaintResponse>(create);
  static UpdateComplaintResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $22.Complaint get cp => $_getN(0);
  @$pb.TagNumber(1)
  set cp($22.Complaint v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCp() => $_has(0);
  @$pb.TagNumber(1)
  void clearCp() => clearField(1);
  @$pb.TagNumber(1)
  $22.Complaint ensureCp() => $_ensure(0);
}

/// Delete
class DeleteComplaintRequest extends $pb.GeneratedMessage {
  factory DeleteComplaintRequest({
    $core.String? sessionID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    return $result;
  }
  DeleteComplaintRequest._() : super();
  factory DeleteComplaintRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteComplaintRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteComplaintRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteComplaintRequest clone() => DeleteComplaintRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteComplaintRequest copyWith(void Function(DeleteComplaintRequest) updates) => super.copyWith((message) => updates(message as DeleteComplaintRequest)) as DeleteComplaintRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteComplaintRequest create() => DeleteComplaintRequest._();
  DeleteComplaintRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteComplaintRequest> createRepeated() => $pb.PbList<DeleteComplaintRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteComplaintRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteComplaintRequest>(create);
  static DeleteComplaintRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
