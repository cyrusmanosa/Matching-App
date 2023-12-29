//
//  Generated code. Do not modify.
//  source: rpc_canChange.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'canChange.pb.dart' as $16;

/// Create
class CreateCanChangeRequest extends $pb.GeneratedMessage {
  factory CreateCanChangeRequest({
    $core.String? sessionID,
    $core.String? nickName,
    $core.String? city,
    $core.String? sexual,
    $core.int? height,
    $core.int? weight,
    $core.String? speaklanguage,
    $core.String? education,
    $core.String? job,
    $core.int? annualSalary,
    $core.String? sociability,
    $core.String? religious,
    $core.String? introduce,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (nickName != null) {
      $result.nickName = nickName;
    }
    if (city != null) {
      $result.city = city;
    }
    if (sexual != null) {
      $result.sexual = sexual;
    }
    if (height != null) {
      $result.height = height;
    }
    if (weight != null) {
      $result.weight = weight;
    }
    if (speaklanguage != null) {
      $result.speaklanguage = speaklanguage;
    }
    if (education != null) {
      $result.education = education;
    }
    if (job != null) {
      $result.job = job;
    }
    if (annualSalary != null) {
      $result.annualSalary = annualSalary;
    }
    if (sociability != null) {
      $result.sociability = sociability;
    }
    if (religious != null) {
      $result.religious = religious;
    }
    if (introduce != null) {
      $result.introduce = introduce;
    }
    return $result;
  }
  CreateCanChangeRequest._() : super();
  factory CreateCanChangeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCanChangeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCanChangeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..aOS(2, _omitFieldNames ? '' : 'NickName', protoName: 'NickName')
    ..aOS(3, _omitFieldNames ? '' : 'City', protoName: 'City')
    ..aOS(4, _omitFieldNames ? '' : 'Sexual', protoName: 'Sexual')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'Height', $pb.PbFieldType.O3, protoName: 'Height')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'Weight', $pb.PbFieldType.O3, protoName: 'Weight')
    ..aOS(7, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(8, _omitFieldNames ? '' : 'Education', protoName: 'Education')
    ..aOS(9, _omitFieldNames ? '' : 'Job', protoName: 'Job')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'AnnualSalary', $pb.PbFieldType.O3, protoName: 'AnnualSalary')
    ..aOS(11, _omitFieldNames ? '' : 'Sociability', protoName: 'Sociability')
    ..aOS(12, _omitFieldNames ? '' : 'Religious', protoName: 'Religious')
    ..aOS(13, _omitFieldNames ? '' : 'Introduce', protoName: 'Introduce')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateCanChangeRequest clone() => CreateCanChangeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCanChangeRequest copyWith(void Function(CreateCanChangeRequest) updates) => super.copyWith((message) => updates(message as CreateCanChangeRequest)) as CreateCanChangeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCanChangeRequest create() => CreateCanChangeRequest._();
  CreateCanChangeRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCanChangeRequest> createRepeated() => $pb.PbList<CreateCanChangeRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCanChangeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCanChangeRequest>(create);
  static CreateCanChangeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get city => $_getSZ(2);
  @$pb.TagNumber(3)
  set city($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCity() => $_has(2);
  @$pb.TagNumber(3)
  void clearCity() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sexual => $_getSZ(3);
  @$pb.TagNumber(4)
  set sexual($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSexual() => $_has(3);
  @$pb.TagNumber(4)
  void clearSexual() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get height => $_getIZ(4);
  @$pb.TagNumber(5)
  set height($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeight() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get weight => $_getIZ(5);
  @$pb.TagNumber(6)
  set weight($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasWeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearWeight() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get speaklanguage => $_getSZ(6);
  @$pb.TagNumber(7)
  set speaklanguage($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSpeaklanguage() => $_has(6);
  @$pb.TagNumber(7)
  void clearSpeaklanguage() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get education => $_getSZ(7);
  @$pb.TagNumber(8)
  set education($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEducation() => $_has(7);
  @$pb.TagNumber(8)
  void clearEducation() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get job => $_getSZ(8);
  @$pb.TagNumber(9)
  set job($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasJob() => $_has(8);
  @$pb.TagNumber(9)
  void clearJob() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get annualSalary => $_getIZ(9);
  @$pb.TagNumber(10)
  set annualSalary($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAnnualSalary() => $_has(9);
  @$pb.TagNumber(10)
  void clearAnnualSalary() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get sociability => $_getSZ(10);
  @$pb.TagNumber(11)
  set sociability($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSociability() => $_has(10);
  @$pb.TagNumber(11)
  void clearSociability() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get religious => $_getSZ(11);
  @$pb.TagNumber(12)
  set religious($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasReligious() => $_has(11);
  @$pb.TagNumber(12)
  void clearReligious() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get introduce => $_getSZ(12);
  @$pb.TagNumber(13)
  set introduce($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasIntroduce() => $_has(12);
  @$pb.TagNumber(13)
  void clearIntroduce() => clearField(13);
}

class CreateCanChangeResponse extends $pb.GeneratedMessage {
  factory CreateCanChangeResponse({
    $16.CanChange? canChangeInfo,
  }) {
    final $result = create();
    if (canChangeInfo != null) {
      $result.canChangeInfo = canChangeInfo;
    }
    return $result;
  }
  CreateCanChangeResponse._() : super();
  factory CreateCanChangeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateCanChangeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateCanChangeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$16.CanChange>(1, _omitFieldNames ? '' : 'CanChangeInfo', protoName: 'CanChangeInfo', subBuilder: $16.CanChange.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateCanChangeResponse clone() => CreateCanChangeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateCanChangeResponse copyWith(void Function(CreateCanChangeResponse) updates) => super.copyWith((message) => updates(message as CreateCanChangeResponse)) as CreateCanChangeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCanChangeResponse create() => CreateCanChangeResponse._();
  CreateCanChangeResponse createEmptyInstance() => create();
  static $pb.PbList<CreateCanChangeResponse> createRepeated() => $pb.PbList<CreateCanChangeResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateCanChangeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateCanChangeResponse>(create);
  static CreateCanChangeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $16.CanChange get canChangeInfo => $_getN(0);
  @$pb.TagNumber(1)
  set canChangeInfo($16.CanChange v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCanChangeInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanChangeInfo() => clearField(1);
  @$pb.TagNumber(1)
  $16.CanChange ensureCanChangeInfo() => $_ensure(0);
}

/// Get
class GetCanChangeRequest extends $pb.GeneratedMessage {
  factory GetCanChangeRequest({
    $core.String? sessionID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    return $result;
  }
  GetCanChangeRequest._() : super();
  factory GetCanChangeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCanChangeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCanChangeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCanChangeRequest clone() => GetCanChangeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCanChangeRequest copyWith(void Function(GetCanChangeRequest) updates) => super.copyWith((message) => updates(message as GetCanChangeRequest)) as GetCanChangeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCanChangeRequest create() => GetCanChangeRequest._();
  GetCanChangeRequest createEmptyInstance() => create();
  static $pb.PbList<GetCanChangeRequest> createRepeated() => $pb.PbList<GetCanChangeRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCanChangeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCanChangeRequest>(create);
  static GetCanChangeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);
}

class GetCanChangeResponse extends $pb.GeneratedMessage {
  factory GetCanChangeResponse({
    $16.CanChange? canChangeInfo,
  }) {
    final $result = create();
    if (canChangeInfo != null) {
      $result.canChangeInfo = canChangeInfo;
    }
    return $result;
  }
  GetCanChangeResponse._() : super();
  factory GetCanChangeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCanChangeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCanChangeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$16.CanChange>(1, _omitFieldNames ? '' : 'CanChangeInfo', protoName: 'CanChangeInfo', subBuilder: $16.CanChange.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetCanChangeResponse clone() => GetCanChangeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetCanChangeResponse copyWith(void Function(GetCanChangeResponse) updates) => super.copyWith((message) => updates(message as GetCanChangeResponse)) as GetCanChangeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCanChangeResponse create() => GetCanChangeResponse._();
  GetCanChangeResponse createEmptyInstance() => create();
  static $pb.PbList<GetCanChangeResponse> createRepeated() => $pb.PbList<GetCanChangeResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCanChangeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetCanChangeResponse>(create);
  static GetCanChangeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $16.CanChange get canChangeInfo => $_getN(0);
  @$pb.TagNumber(1)
  set canChangeInfo($16.CanChange v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCanChangeInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanChangeInfo() => clearField(1);
  @$pb.TagNumber(1)
  $16.CanChange ensureCanChangeInfo() => $_ensure(0);
}

/// Update
class UpdateCanChangeRequest extends $pb.GeneratedMessage {
  factory UpdateCanChangeRequest({
    $core.String? sessionID,
    $core.String? nickName,
    $core.String? city,
    $core.String? sexual,
    $core.int? height,
    $core.int? weight,
    $core.String? speaklanguage,
    $core.String? education,
    $core.String? job,
    $core.int? annualSalary,
    $core.String? sociability,
    $core.String? religious,
    $core.String? introduce,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (nickName != null) {
      $result.nickName = nickName;
    }
    if (city != null) {
      $result.city = city;
    }
    if (sexual != null) {
      $result.sexual = sexual;
    }
    if (height != null) {
      $result.height = height;
    }
    if (weight != null) {
      $result.weight = weight;
    }
    if (speaklanguage != null) {
      $result.speaklanguage = speaklanguage;
    }
    if (education != null) {
      $result.education = education;
    }
    if (job != null) {
      $result.job = job;
    }
    if (annualSalary != null) {
      $result.annualSalary = annualSalary;
    }
    if (sociability != null) {
      $result.sociability = sociability;
    }
    if (religious != null) {
      $result.religious = religious;
    }
    if (introduce != null) {
      $result.introduce = introduce;
    }
    return $result;
  }
  UpdateCanChangeRequest._() : super();
  factory UpdateCanChangeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCanChangeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCanChangeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..aOS(2, _omitFieldNames ? '' : 'NickName', protoName: 'NickName')
    ..aOS(3, _omitFieldNames ? '' : 'City', protoName: 'City')
    ..aOS(4, _omitFieldNames ? '' : 'Sexual', protoName: 'Sexual')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'Height', $pb.PbFieldType.O3, protoName: 'Height')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'Weight', $pb.PbFieldType.O3, protoName: 'Weight')
    ..aOS(7, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(8, _omitFieldNames ? '' : 'Education', protoName: 'Education')
    ..aOS(9, _omitFieldNames ? '' : 'Job', protoName: 'Job')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'AnnualSalary', $pb.PbFieldType.O3, protoName: 'AnnualSalary')
    ..aOS(11, _omitFieldNames ? '' : 'Sociability', protoName: 'Sociability')
    ..aOS(12, _omitFieldNames ? '' : 'Religious', protoName: 'Religious')
    ..aOS(13, _omitFieldNames ? '' : 'Introduce', protoName: 'Introduce')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCanChangeRequest clone() => UpdateCanChangeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCanChangeRequest copyWith(void Function(UpdateCanChangeRequest) updates) => super.copyWith((message) => updates(message as UpdateCanChangeRequest)) as UpdateCanChangeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCanChangeRequest create() => UpdateCanChangeRequest._();
  UpdateCanChangeRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateCanChangeRequest> createRepeated() => $pb.PbList<UpdateCanChangeRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateCanChangeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCanChangeRequest>(create);
  static UpdateCanChangeRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get city => $_getSZ(2);
  @$pb.TagNumber(3)
  set city($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCity() => $_has(2);
  @$pb.TagNumber(3)
  void clearCity() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sexual => $_getSZ(3);
  @$pb.TagNumber(4)
  set sexual($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSexual() => $_has(3);
  @$pb.TagNumber(4)
  void clearSexual() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get height => $_getIZ(4);
  @$pb.TagNumber(5)
  set height($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeight() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get weight => $_getIZ(5);
  @$pb.TagNumber(6)
  set weight($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasWeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearWeight() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get speaklanguage => $_getSZ(6);
  @$pb.TagNumber(7)
  set speaklanguage($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSpeaklanguage() => $_has(6);
  @$pb.TagNumber(7)
  void clearSpeaklanguage() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get education => $_getSZ(7);
  @$pb.TagNumber(8)
  set education($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEducation() => $_has(7);
  @$pb.TagNumber(8)
  void clearEducation() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get job => $_getSZ(8);
  @$pb.TagNumber(9)
  set job($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasJob() => $_has(8);
  @$pb.TagNumber(9)
  void clearJob() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get annualSalary => $_getIZ(9);
  @$pb.TagNumber(10)
  set annualSalary($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAnnualSalary() => $_has(9);
  @$pb.TagNumber(10)
  void clearAnnualSalary() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get sociability => $_getSZ(10);
  @$pb.TagNumber(11)
  set sociability($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSociability() => $_has(10);
  @$pb.TagNumber(11)
  void clearSociability() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get religious => $_getSZ(11);
  @$pb.TagNumber(12)
  set religious($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasReligious() => $_has(11);
  @$pb.TagNumber(12)
  void clearReligious() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get introduce => $_getSZ(12);
  @$pb.TagNumber(13)
  set introduce($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasIntroduce() => $_has(12);
  @$pb.TagNumber(13)
  void clearIntroduce() => clearField(13);
}

class UpdateCanChangeResponse extends $pb.GeneratedMessage {
  factory UpdateCanChangeResponse({
    $16.CanChange? canChangeInfo,
  }) {
    final $result = create();
    if (canChangeInfo != null) {
      $result.canChangeInfo = canChangeInfo;
    }
    return $result;
  }
  UpdateCanChangeResponse._() : super();
  factory UpdateCanChangeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateCanChangeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateCanChangeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$16.CanChange>(1, _omitFieldNames ? '' : 'CanChangeInfo', protoName: 'CanChangeInfo', subBuilder: $16.CanChange.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateCanChangeResponse clone() => UpdateCanChangeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateCanChangeResponse copyWith(void Function(UpdateCanChangeResponse) updates) => super.copyWith((message) => updates(message as UpdateCanChangeResponse)) as UpdateCanChangeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateCanChangeResponse create() => UpdateCanChangeResponse._();
  UpdateCanChangeResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateCanChangeResponse> createRepeated() => $pb.PbList<UpdateCanChangeResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateCanChangeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateCanChangeResponse>(create);
  static UpdateCanChangeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $16.CanChange get canChangeInfo => $_getN(0);
  @$pb.TagNumber(1)
  set canChangeInfo($16.CanChange v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCanChangeInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanChangeInfo() => clearField(1);
  @$pb.TagNumber(1)
  $16.CanChange ensureCanChangeInfo() => $_ensure(0);
}

/// List
class ListCanChangeResponse extends $pb.GeneratedMessage {
  factory ListCanChangeResponse({
    $16.CanChange? canChangeInfo,
  }) {
    final $result = create();
    if (canChangeInfo != null) {
      $result.canChangeInfo = canChangeInfo;
    }
    return $result;
  }
  ListCanChangeResponse._() : super();
  factory ListCanChangeResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ListCanChangeResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ListCanChangeResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$16.CanChange>(1, _omitFieldNames ? '' : 'CanChangeInfo', protoName: 'CanChangeInfo', subBuilder: $16.CanChange.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ListCanChangeResponse clone() => ListCanChangeResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ListCanChangeResponse copyWith(void Function(ListCanChangeResponse) updates) => super.copyWith((message) => updates(message as ListCanChangeResponse)) as ListCanChangeResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListCanChangeResponse create() => ListCanChangeResponse._();
  ListCanChangeResponse createEmptyInstance() => create();
  static $pb.PbList<ListCanChangeResponse> createRepeated() => $pb.PbList<ListCanChangeResponse>();
  @$core.pragma('dart2js:noInline')
  static ListCanChangeResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ListCanChangeResponse>(create);
  static ListCanChangeResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $16.CanChange get canChangeInfo => $_getN(0);
  @$pb.TagNumber(1)
  set canChangeInfo($16.CanChange v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCanChangeInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanChangeInfo() => clearField(1);
  @$pb.TagNumber(1)
  $16.CanChange ensureCanChangeInfo() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
