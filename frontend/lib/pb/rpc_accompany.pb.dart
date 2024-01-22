//
//  Generated code. Do not modify.
//  source: rpc_accompany.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'accompany.pb.dart' as $19;

/// Create
class CreateAccompanyRequest extends $pb.GeneratedMessage {
  factory CreateAccompanyRequest({
    $core.String? sessionID,
    $core.int? era,
    $core.Iterable<$core.String>? speaklanguage,
    $core.String? findType,
    $core.String? sociability,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (era != null) {
      $result.era = era;
    }
    if (speaklanguage != null) {
      $result.speaklanguage.addAll(speaklanguage);
    }
    if (findType != null) {
      $result.findType = findType;
    }
    if (sociability != null) {
      $result.sociability = sociability;
    }
    return $result;
  }
  CreateAccompanyRequest._() : super();
  factory CreateAccompanyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAccompanyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAccompanyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'Era', $pb.PbFieldType.O3, protoName: 'Era')
    ..pPS(3, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(4, _omitFieldNames ? '' : 'FindType', protoName: 'FindType')
    ..aOS(5, _omitFieldNames ? '' : 'Sociability', protoName: 'Sociability')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAccompanyRequest clone() => CreateAccompanyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAccompanyRequest copyWith(void Function(CreateAccompanyRequest) updates) => super.copyWith((message) => updates(message as CreateAccompanyRequest)) as CreateAccompanyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAccompanyRequest create() => CreateAccompanyRequest._();
  CreateAccompanyRequest createEmptyInstance() => create();
  static $pb.PbList<CreateAccompanyRequest> createRepeated() => $pb.PbList<CreateAccompanyRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateAccompanyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAccompanyRequest>(create);
  static CreateAccompanyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get era => $_getIZ(1);
  @$pb.TagNumber(2)
  set era($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEra() => $_has(1);
  @$pb.TagNumber(2)
  void clearEra() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get speaklanguage => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get findType => $_getSZ(3);
  @$pb.TagNumber(4)
  set findType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFindType() => $_has(3);
  @$pb.TagNumber(4)
  void clearFindType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get sociability => $_getSZ(4);
  @$pb.TagNumber(5)
  set sociability($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSociability() => $_has(4);
  @$pb.TagNumber(5)
  void clearSociability() => clearField(5);
}

class CreateAccompanyResponse extends $pb.GeneratedMessage {
  factory CreateAccompanyResponse({
    $19.Accompany? ac,
  }) {
    final $result = create();
    if (ac != null) {
      $result.ac = ac;
    }
    return $result;
  }
  CreateAccompanyResponse._() : super();
  factory CreateAccompanyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateAccompanyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateAccompanyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$19.Accompany>(1, _omitFieldNames ? '' : 'ac', subBuilder: $19.Accompany.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateAccompanyResponse clone() => CreateAccompanyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateAccompanyResponse copyWith(void Function(CreateAccompanyResponse) updates) => super.copyWith((message) => updates(message as CreateAccompanyResponse)) as CreateAccompanyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateAccompanyResponse create() => CreateAccompanyResponse._();
  CreateAccompanyResponse createEmptyInstance() => create();
  static $pb.PbList<CreateAccompanyResponse> createRepeated() => $pb.PbList<CreateAccompanyResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateAccompanyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateAccompanyResponse>(create);
  static CreateAccompanyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $19.Accompany get ac => $_getN(0);
  @$pb.TagNumber(1)
  set ac($19.Accompany v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAc() => $_has(0);
  @$pb.TagNumber(1)
  void clearAc() => clearField(1);
  @$pb.TagNumber(1)
  $19.Accompany ensureAc() => $_ensure(0);
}

/// Get
class GetAccompanyRequest extends $pb.GeneratedMessage {
  factory GetAccompanyRequest({
    $core.String? sessionID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    return $result;
  }
  GetAccompanyRequest._() : super();
  factory GetAccompanyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccompanyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAccompanyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAccompanyRequest clone() => GetAccompanyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAccompanyRequest copyWith(void Function(GetAccompanyRequest) updates) => super.copyWith((message) => updates(message as GetAccompanyRequest)) as GetAccompanyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAccompanyRequest create() => GetAccompanyRequest._();
  GetAccompanyRequest createEmptyInstance() => create();
  static $pb.PbList<GetAccompanyRequest> createRepeated() => $pb.PbList<GetAccompanyRequest>();
  @$core.pragma('dart2js:noInline')
  static GetAccompanyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccompanyRequest>(create);
  static GetAccompanyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);
}

class GetAccompanyResponse extends $pb.GeneratedMessage {
  factory GetAccompanyResponse({
    $19.Accompany? ac,
  }) {
    final $result = create();
    if (ac != null) {
      $result.ac = ac;
    }
    return $result;
  }
  GetAccompanyResponse._() : super();
  factory GetAccompanyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetAccompanyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetAccompanyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$19.Accompany>(1, _omitFieldNames ? '' : 'ac', subBuilder: $19.Accompany.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetAccompanyResponse clone() => GetAccompanyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetAccompanyResponse copyWith(void Function(GetAccompanyResponse) updates) => super.copyWith((message) => updates(message as GetAccompanyResponse)) as GetAccompanyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetAccompanyResponse create() => GetAccompanyResponse._();
  GetAccompanyResponse createEmptyInstance() => create();
  static $pb.PbList<GetAccompanyResponse> createRepeated() => $pb.PbList<GetAccompanyResponse>();
  @$core.pragma('dart2js:noInline')
  static GetAccompanyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetAccompanyResponse>(create);
  static GetAccompanyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $19.Accompany get ac => $_getN(0);
  @$pb.TagNumber(1)
  set ac($19.Accompany v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAc() => $_has(0);
  @$pb.TagNumber(1)
  void clearAc() => clearField(1);
  @$pb.TagNumber(1)
  $19.Accompany ensureAc() => $_ensure(0);
}

/// Update
class UpdateAccompanyRequest extends $pb.GeneratedMessage {
  factory UpdateAccompanyRequest({
    $core.String? sessionID,
    $core.int? era,
    $core.Iterable<$core.String>? speaklanguage,
    $core.String? findType,
    $core.String? sociability,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (era != null) {
      $result.era = era;
    }
    if (speaklanguage != null) {
      $result.speaklanguage.addAll(speaklanguage);
    }
    if (findType != null) {
      $result.findType = findType;
    }
    if (sociability != null) {
      $result.sociability = sociability;
    }
    return $result;
  }
  UpdateAccompanyRequest._() : super();
  factory UpdateAccompanyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAccompanyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAccompanyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'Era', $pb.PbFieldType.O3, protoName: 'Era')
    ..pPS(3, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(4, _omitFieldNames ? '' : 'FindType', protoName: 'FindType')
    ..aOS(5, _omitFieldNames ? '' : 'Sociability', protoName: 'Sociability')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAccompanyRequest clone() => UpdateAccompanyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAccompanyRequest copyWith(void Function(UpdateAccompanyRequest) updates) => super.copyWith((message) => updates(message as UpdateAccompanyRequest)) as UpdateAccompanyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAccompanyRequest create() => UpdateAccompanyRequest._();
  UpdateAccompanyRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateAccompanyRequest> createRepeated() => $pb.PbList<UpdateAccompanyRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateAccompanyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAccompanyRequest>(create);
  static UpdateAccompanyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get era => $_getIZ(1);
  @$pb.TagNumber(2)
  set era($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEra() => $_has(1);
  @$pb.TagNumber(2)
  void clearEra() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.String> get speaklanguage => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get findType => $_getSZ(3);
  @$pb.TagNumber(4)
  set findType($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasFindType() => $_has(3);
  @$pb.TagNumber(4)
  void clearFindType() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get sociability => $_getSZ(4);
  @$pb.TagNumber(5)
  set sociability($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasSociability() => $_has(4);
  @$pb.TagNumber(5)
  void clearSociability() => clearField(5);
}

class UpdateAccompanyResponse extends $pb.GeneratedMessage {
  factory UpdateAccompanyResponse({
    $19.Accompany? ac,
  }) {
    final $result = create();
    if (ac != null) {
      $result.ac = ac;
    }
    return $result;
  }
  UpdateAccompanyResponse._() : super();
  factory UpdateAccompanyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateAccompanyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateAccompanyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$19.Accompany>(1, _omitFieldNames ? '' : 'ac', subBuilder: $19.Accompany.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateAccompanyResponse clone() => UpdateAccompanyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateAccompanyResponse copyWith(void Function(UpdateAccompanyResponse) updates) => super.copyWith((message) => updates(message as UpdateAccompanyResponse)) as UpdateAccompanyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateAccompanyResponse create() => UpdateAccompanyResponse._();
  UpdateAccompanyResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateAccompanyResponse> createRepeated() => $pb.PbList<UpdateAccompanyResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateAccompanyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateAccompanyResponse>(create);
  static UpdateAccompanyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $19.Accompany get ac => $_getN(0);
  @$pb.TagNumber(1)
  set ac($19.Accompany v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAc() => $_has(0);
  @$pb.TagNumber(1)
  void clearAc() => clearField(1);
  @$pb.TagNumber(1)
  $19.Accompany ensureAc() => $_ensure(0);
}

/// Delete
class DeleteAccompanyRequest extends $pb.GeneratedMessage {
  factory DeleteAccompanyRequest({
    $core.String? sessionID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    return $result;
  }
  DeleteAccompanyRequest._() : super();
  factory DeleteAccompanyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteAccompanyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteAccompanyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteAccompanyRequest clone() => DeleteAccompanyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteAccompanyRequest copyWith(void Function(DeleteAccompanyRequest) updates) => super.copyWith((message) => updates(message as DeleteAccompanyRequest)) as DeleteAccompanyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteAccompanyRequest create() => DeleteAccompanyRequest._();
  DeleteAccompanyRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteAccompanyRequest> createRepeated() => $pb.PbList<DeleteAccompanyRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteAccompanyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteAccompanyRequest>(create);
  static DeleteAccompanyRequest? _defaultInstance;

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
