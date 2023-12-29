//
//  Generated code. Do not modify.
//  source: rpc_targetList.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'targetList.pb.dart' as $20;

class CreateTargetListRequest extends $pb.GeneratedMessage {
  factory CreateTargetListRequest({
    $core.int? userID,
    $core.int? target1ID,
    $core.int? target2ID,
    $core.int? target3ID,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (target1ID != null) {
      $result.target1ID = target1ID;
    }
    if (target2ID != null) {
      $result.target2ID = target2ID;
    }
    if (target3ID != null) {
      $result.target3ID = target3ID;
    }
    return $result;
  }
  CreateTargetListRequest._() : super();
  factory CreateTargetListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTargetListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTargetListRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'Target1ID', $pb.PbFieldType.O3, protoName: 'Target1ID')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'Target2ID', $pb.PbFieldType.O3, protoName: 'Target2ID')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'Target3ID', $pb.PbFieldType.O3, protoName: 'Target3ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTargetListRequest clone() => CreateTargetListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTargetListRequest copyWith(void Function(CreateTargetListRequest) updates) => super.copyWith((message) => updates(message as CreateTargetListRequest)) as CreateTargetListRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTargetListRequest create() => CreateTargetListRequest._();
  CreateTargetListRequest createEmptyInstance() => create();
  static $pb.PbList<CreateTargetListRequest> createRepeated() => $pb.PbList<CreateTargetListRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateTargetListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTargetListRequest>(create);
  static CreateTargetListRequest? _defaultInstance;

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
  $core.int get target2ID => $_getIZ(2);
  @$pb.TagNumber(3)
  set target2ID($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTarget2ID() => $_has(2);
  @$pb.TagNumber(3)
  void clearTarget2ID() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get target3ID => $_getIZ(3);
  @$pb.TagNumber(4)
  set target3ID($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTarget3ID() => $_has(3);
  @$pb.TagNumber(4)
  void clearTarget3ID() => clearField(4);
}

class CreateTargetListResponse extends $pb.GeneratedMessage {
  factory CreateTargetListResponse({
    $20.Targetlist? tl,
  }) {
    final $result = create();
    if (tl != null) {
      $result.tl = tl;
    }
    return $result;
  }
  CreateTargetListResponse._() : super();
  factory CreateTargetListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateTargetListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateTargetListResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$20.Targetlist>(1, _omitFieldNames ? '' : 'tl', subBuilder: $20.Targetlist.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateTargetListResponse clone() => CreateTargetListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateTargetListResponse copyWith(void Function(CreateTargetListResponse) updates) => super.copyWith((message) => updates(message as CreateTargetListResponse)) as CreateTargetListResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateTargetListResponse create() => CreateTargetListResponse._();
  CreateTargetListResponse createEmptyInstance() => create();
  static $pb.PbList<CreateTargetListResponse> createRepeated() => $pb.PbList<CreateTargetListResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateTargetListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateTargetListResponse>(create);
  static CreateTargetListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $20.Targetlist get tl => $_getN(0);
  @$pb.TagNumber(1)
  set tl($20.Targetlist v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTl() => $_has(0);
  @$pb.TagNumber(1)
  void clearTl() => clearField(1);
  @$pb.TagNumber(1)
  $20.Targetlist ensureTl() => $_ensure(0);
}

class GetTargetListRequest extends $pb.GeneratedMessage {
  factory GetTargetListRequest({
    $core.int? userID,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    return $result;
  }
  GetTargetListRequest._() : super();
  factory GetTargetListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTargetListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTargetListRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTargetListRequest clone() => GetTargetListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTargetListRequest copyWith(void Function(GetTargetListRequest) updates) => super.copyWith((message) => updates(message as GetTargetListRequest)) as GetTargetListRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTargetListRequest create() => GetTargetListRequest._();
  GetTargetListRequest createEmptyInstance() => create();
  static $pb.PbList<GetTargetListRequest> createRepeated() => $pb.PbList<GetTargetListRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTargetListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTargetListRequest>(create);
  static GetTargetListRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);
}

class GetTargetListResponse extends $pb.GeneratedMessage {
  factory GetTargetListResponse({
    $20.Targetlist? tl,
  }) {
    final $result = create();
    if (tl != null) {
      $result.tl = tl;
    }
    return $result;
  }
  GetTargetListResponse._() : super();
  factory GetTargetListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetTargetListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetTargetListResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$20.Targetlist>(1, _omitFieldNames ? '' : 'tl', subBuilder: $20.Targetlist.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetTargetListResponse clone() => GetTargetListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetTargetListResponse copyWith(void Function(GetTargetListResponse) updates) => super.copyWith((message) => updates(message as GetTargetListResponse)) as GetTargetListResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTargetListResponse create() => GetTargetListResponse._();
  GetTargetListResponse createEmptyInstance() => create();
  static $pb.PbList<GetTargetListResponse> createRepeated() => $pb.PbList<GetTargetListResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTargetListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetTargetListResponse>(create);
  static GetTargetListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $20.Targetlist get tl => $_getN(0);
  @$pb.TagNumber(1)
  set tl($20.Targetlist v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTl() => $_has(0);
  @$pb.TagNumber(1)
  void clearTl() => clearField(1);
  @$pb.TagNumber(1)
  $20.Targetlist ensureTl() => $_ensure(0);
}

class UpdateTargetListRequest extends $pb.GeneratedMessage {
  factory UpdateTargetListRequest({
    $core.int? userID,
    $core.int? target1ID,
    $core.int? target2ID,
    $core.int? target3ID,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (target1ID != null) {
      $result.target1ID = target1ID;
    }
    if (target2ID != null) {
      $result.target2ID = target2ID;
    }
    if (target3ID != null) {
      $result.target3ID = target3ID;
    }
    return $result;
  }
  UpdateTargetListRequest._() : super();
  factory UpdateTargetListRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTargetListRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTargetListRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'Target1ID', $pb.PbFieldType.O3, protoName: 'Target1ID')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'Target2ID', $pb.PbFieldType.O3, protoName: 'Target2ID')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'Target3ID', $pb.PbFieldType.O3, protoName: 'Target3ID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTargetListRequest clone() => UpdateTargetListRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTargetListRequest copyWith(void Function(UpdateTargetListRequest) updates) => super.copyWith((message) => updates(message as UpdateTargetListRequest)) as UpdateTargetListRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTargetListRequest create() => UpdateTargetListRequest._();
  UpdateTargetListRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateTargetListRequest> createRepeated() => $pb.PbList<UpdateTargetListRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateTargetListRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTargetListRequest>(create);
  static UpdateTargetListRequest? _defaultInstance;

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
  $core.int get target2ID => $_getIZ(2);
  @$pb.TagNumber(3)
  set target2ID($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTarget2ID() => $_has(2);
  @$pb.TagNumber(3)
  void clearTarget2ID() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get target3ID => $_getIZ(3);
  @$pb.TagNumber(4)
  set target3ID($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTarget3ID() => $_has(3);
  @$pb.TagNumber(4)
  void clearTarget3ID() => clearField(4);
}

class UpdateTargetListResponse extends $pb.GeneratedMessage {
  factory UpdateTargetListResponse({
    $20.Targetlist? tl,
  }) {
    final $result = create();
    if (tl != null) {
      $result.tl = tl;
    }
    return $result;
  }
  UpdateTargetListResponse._() : super();
  factory UpdateTargetListResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateTargetListResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateTargetListResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$20.Targetlist>(1, _omitFieldNames ? '' : 'tl', subBuilder: $20.Targetlist.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateTargetListResponse clone() => UpdateTargetListResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateTargetListResponse copyWith(void Function(UpdateTargetListResponse) updates) => super.copyWith((message) => updates(message as UpdateTargetListResponse)) as UpdateTargetListResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTargetListResponse create() => UpdateTargetListResponse._();
  UpdateTargetListResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateTargetListResponse> createRepeated() => $pb.PbList<UpdateTargetListResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateTargetListResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateTargetListResponse>(create);
  static UpdateTargetListResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $20.Targetlist get tl => $_getN(0);
  @$pb.TagNumber(1)
  set tl($20.Targetlist v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasTl() => $_has(0);
  @$pb.TagNumber(1)
  void clearTl() => clearField(1);
  @$pb.TagNumber(1)
  $20.Targetlist ensureTl() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');