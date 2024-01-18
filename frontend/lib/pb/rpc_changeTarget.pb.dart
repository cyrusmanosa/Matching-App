//
//  Generated code. Do not modify.
//  source: rpc_changeTarget.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'changeTarget.pb.dart' as $20;

/// Create
class CreateChangeTargetRequest extends $pb.GeneratedMessage {
  factory CreateChangeTargetRequest({
    $core.String? sessionID,
    $core.int? changeUserID,
    $core.String? reason,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (changeUserID != null) {
      $result.changeUserID = changeUserID;
    }
    if (reason != null) {
      $result.reason = reason;
    }
    return $result;
  }
  CreateChangeTargetRequest._() : super();
  factory CreateChangeTargetRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChangeTargetRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChangeTargetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'ChangeUserID', $pb.PbFieldType.O3, protoName: 'ChangeUserID')
    ..aOS(3, _omitFieldNames ? '' : 'Reason', protoName: 'Reason')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChangeTargetRequest clone() => CreateChangeTargetRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChangeTargetRequest copyWith(void Function(CreateChangeTargetRequest) updates) => super.copyWith((message) => updates(message as CreateChangeTargetRequest)) as CreateChangeTargetRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChangeTargetRequest create() => CreateChangeTargetRequest._();
  CreateChangeTargetRequest createEmptyInstance() => create();
  static $pb.PbList<CreateChangeTargetRequest> createRepeated() => $pb.PbList<CreateChangeTargetRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateChangeTargetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChangeTargetRequest>(create);
  static CreateChangeTargetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

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
}

class CreateChangeTargetResponse extends $pb.GeneratedMessage {
  factory CreateChangeTargetResponse({
    $20.ChangeTarget? ct,
  }) {
    final $result = create();
    if (ct != null) {
      $result.ct = ct;
    }
    return $result;
  }
  CreateChangeTargetResponse._() : super();
  factory CreateChangeTargetResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateChangeTargetResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateChangeTargetResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$20.ChangeTarget>(1, _omitFieldNames ? '' : 'ct', subBuilder: $20.ChangeTarget.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateChangeTargetResponse clone() => CreateChangeTargetResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateChangeTargetResponse copyWith(void Function(CreateChangeTargetResponse) updates) => super.copyWith((message) => updates(message as CreateChangeTargetResponse)) as CreateChangeTargetResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateChangeTargetResponse create() => CreateChangeTargetResponse._();
  CreateChangeTargetResponse createEmptyInstance() => create();
  static $pb.PbList<CreateChangeTargetResponse> createRepeated() => $pb.PbList<CreateChangeTargetResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateChangeTargetResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateChangeTargetResponse>(create);
  static CreateChangeTargetResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $20.ChangeTarget get ct => $_getN(0);
  @$pb.TagNumber(1)
  set ct($20.ChangeTarget v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCt() => $_has(0);
  @$pb.TagNumber(1)
  void clearCt() => clearField(1);
  @$pb.TagNumber(1)
  $20.ChangeTarget ensureCt() => $_ensure(0);
}

/// Get
class GetChangeTargetRequest extends $pb.GeneratedMessage {
  factory GetChangeTargetRequest({
    $core.String? sessionID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    return $result;
  }
  GetChangeTargetRequest._() : super();
  factory GetChangeTargetRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChangeTargetRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChangeTargetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChangeTargetRequest clone() => GetChangeTargetRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChangeTargetRequest copyWith(void Function(GetChangeTargetRequest) updates) => super.copyWith((message) => updates(message as GetChangeTargetRequest)) as GetChangeTargetRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChangeTargetRequest create() => GetChangeTargetRequest._();
  GetChangeTargetRequest createEmptyInstance() => create();
  static $pb.PbList<GetChangeTargetRequest> createRepeated() => $pb.PbList<GetChangeTargetRequest>();
  @$core.pragma('dart2js:noInline')
  static GetChangeTargetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChangeTargetRequest>(create);
  static GetChangeTargetRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);
}

class GetChangeTargetResponse extends $pb.GeneratedMessage {
  factory GetChangeTargetResponse({
    $20.ChangeTarget? ct,
  }) {
    final $result = create();
    if (ct != null) {
      $result.ct = ct;
    }
    return $result;
  }
  GetChangeTargetResponse._() : super();
  factory GetChangeTargetResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetChangeTargetResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetChangeTargetResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$20.ChangeTarget>(1, _omitFieldNames ? '' : 'ct', subBuilder: $20.ChangeTarget.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetChangeTargetResponse clone() => GetChangeTargetResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetChangeTargetResponse copyWith(void Function(GetChangeTargetResponse) updates) => super.copyWith((message) => updates(message as GetChangeTargetResponse)) as GetChangeTargetResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetChangeTargetResponse create() => GetChangeTargetResponse._();
  GetChangeTargetResponse createEmptyInstance() => create();
  static $pb.PbList<GetChangeTargetResponse> createRepeated() => $pb.PbList<GetChangeTargetResponse>();
  @$core.pragma('dart2js:noInline')
  static GetChangeTargetResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetChangeTargetResponse>(create);
  static GetChangeTargetResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $20.ChangeTarget get ct => $_getN(0);
  @$pb.TagNumber(1)
  set ct($20.ChangeTarget v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCt() => $_has(0);
  @$pb.TagNumber(1)
  void clearCt() => clearField(1);
  @$pb.TagNumber(1)
  $20.ChangeTarget ensureCt() => $_ensure(0);
}

/// Delete
class DeleteChangeTargetRequest extends $pb.GeneratedMessage {
  factory DeleteChangeTargetRequest({
    $core.String? sessionID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    return $result;
  }
  DeleteChangeTargetRequest._() : super();
  factory DeleteChangeTargetRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteChangeTargetRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteChangeTargetRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteChangeTargetRequest clone() => DeleteChangeTargetRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteChangeTargetRequest copyWith(void Function(DeleteChangeTargetRequest) updates) => super.copyWith((message) => updates(message as DeleteChangeTargetRequest)) as DeleteChangeTargetRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteChangeTargetRequest create() => DeleteChangeTargetRequest._();
  DeleteChangeTargetRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteChangeTargetRequest> createRepeated() => $pb.PbList<DeleteChangeTargetRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteChangeTargetRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteChangeTargetRequest>(create);
  static DeleteChangeTargetRequest? _defaultInstance;

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
