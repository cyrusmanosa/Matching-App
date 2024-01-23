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

import 'canChange.pb.dart' as $21;

/// Create
class CreateCanChangeRequest extends $pb.GeneratedMessage {
  factory CreateCanChangeRequest({
    $core.String? sessionID,
    $core.String? nickName,
    $core.String? city,
    $core.String? sexual,
    $core.int? height,
    $core.int? weight,
    $core.Iterable<$core.String>? speaklanguage,
    $core.String? education,
    $core.String? job,
    $core.int? annualSalary,
    $core.String? sociability,
    $core.String? hobbyType,
    $core.int? experience,
    $core.String? accompanyType,
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
      $result.speaklanguage.addAll(speaklanguage);
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
    if (hobbyType != null) {
      $result.hobbyType = hobbyType;
    }
    if (experience != null) {
      $result.experience = experience;
    }
    if (accompanyType != null) {
      $result.accompanyType = accompanyType;
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
    ..pPS(7, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(8, _omitFieldNames ? '' : 'Education', protoName: 'Education')
    ..aOS(9, _omitFieldNames ? '' : 'Job', protoName: 'Job')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'AnnualSalary', $pb.PbFieldType.O3, protoName: 'AnnualSalary')
    ..aOS(11, _omitFieldNames ? '' : 'Sociability', protoName: 'Sociability')
    ..aOS(12, _omitFieldNames ? '' : 'hobbyType', protoName: 'hobbyType')
    ..a<$core.int>(13, _omitFieldNames ? '' : 'Experience', $pb.PbFieldType.O3, protoName: 'Experience')
    ..aOS(14, _omitFieldNames ? '' : 'AccompanyType', protoName: 'AccompanyType')
    ..aOS(15, _omitFieldNames ? '' : 'Religious', protoName: 'Religious')
    ..aOS(16, _omitFieldNames ? '' : 'Introduce', protoName: 'Introduce')
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
  $core.List<$core.String> get speaklanguage => $_getList(6);

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
  $core.String get hobbyType => $_getSZ(11);
  @$pb.TagNumber(12)
  set hobbyType($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasHobbyType() => $_has(11);
  @$pb.TagNumber(12)
  void clearHobbyType() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get experience => $_getIZ(12);
  @$pb.TagNumber(13)
  set experience($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasExperience() => $_has(12);
  @$pb.TagNumber(13)
  void clearExperience() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get accompanyType => $_getSZ(13);
  @$pb.TagNumber(14)
  set accompanyType($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasAccompanyType() => $_has(13);
  @$pb.TagNumber(14)
  void clearAccompanyType() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get religious => $_getSZ(14);
  @$pb.TagNumber(15)
  set religious($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasReligious() => $_has(14);
  @$pb.TagNumber(15)
  void clearReligious() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get introduce => $_getSZ(15);
  @$pb.TagNumber(16)
  set introduce($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasIntroduce() => $_has(15);
  @$pb.TagNumber(16)
  void clearIntroduce() => clearField(16);
}

class CreateCanChangeResponse extends $pb.GeneratedMessage {
  factory CreateCanChangeResponse({
    $21.CanChange? canChangeInfo,
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
    ..aOM<$21.CanChange>(1, _omitFieldNames ? '' : 'CanChangeInfo', protoName: 'CanChangeInfo', subBuilder: $21.CanChange.create)
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
  $21.CanChange get canChangeInfo => $_getN(0);
  @$pb.TagNumber(1)
  set canChangeInfo($21.CanChange v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCanChangeInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanChangeInfo() => clearField(1);
  @$pb.TagNumber(1)
  $21.CanChange ensureCanChangeInfo() => $_ensure(0);
}

/// Get
class GetCanChangeRequest extends $pb.GeneratedMessage {
  factory GetCanChangeRequest({
    $core.String? sessionID,
    $core.int? userID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (userID != null) {
      $result.userID = userID;
    }
    return $result;
  }
  GetCanChangeRequest._() : super();
  factory GetCanChangeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetCanChangeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetCanChangeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
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

  @$pb.TagNumber(2)
  $core.int get userID => $_getIZ(1);
  @$pb.TagNumber(2)
  set userID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserID() => clearField(2);
}

class GetCanChangeResponse extends $pb.GeneratedMessage {
  factory GetCanChangeResponse({
    $21.CanChange? canChangeInfo,
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
    ..aOM<$21.CanChange>(1, _omitFieldNames ? '' : 'CanChangeInfo', protoName: 'CanChangeInfo', subBuilder: $21.CanChange.create)
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
  $21.CanChange get canChangeInfo => $_getN(0);
  @$pb.TagNumber(1)
  set canChangeInfo($21.CanChange v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCanChangeInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanChangeInfo() => clearField(1);
  @$pb.TagNumber(1)
  $21.CanChange ensureCanChangeInfo() => $_ensure(0);
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
    $core.Iterable<$core.String>? speaklanguage,
    $core.String? education,
    $core.String? job,
    $core.int? annualSalary,
    $core.String? sociability,
    $core.String? hobbyType,
    $core.int? experience,
    $core.String? accompanyType,
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
      $result.speaklanguage.addAll(speaklanguage);
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
    if (hobbyType != null) {
      $result.hobbyType = hobbyType;
    }
    if (experience != null) {
      $result.experience = experience;
    }
    if (accompanyType != null) {
      $result.accompanyType = accompanyType;
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
    ..pPS(7, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(8, _omitFieldNames ? '' : 'Education', protoName: 'Education')
    ..aOS(9, _omitFieldNames ? '' : 'Job', protoName: 'Job')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'AnnualSalary', $pb.PbFieldType.O3, protoName: 'AnnualSalary')
    ..aOS(11, _omitFieldNames ? '' : 'Sociability', protoName: 'Sociability')
    ..aOS(12, _omitFieldNames ? '' : 'hobbyType', protoName: 'hobbyType')
    ..a<$core.int>(13, _omitFieldNames ? '' : 'Experience', $pb.PbFieldType.O3, protoName: 'Experience')
    ..aOS(14, _omitFieldNames ? '' : 'AccompanyType', protoName: 'AccompanyType')
    ..aOS(15, _omitFieldNames ? '' : 'Religious', protoName: 'Religious')
    ..aOS(16, _omitFieldNames ? '' : 'Introduce', protoName: 'Introduce')
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
  $core.List<$core.String> get speaklanguage => $_getList(6);

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
  $core.String get hobbyType => $_getSZ(11);
  @$pb.TagNumber(12)
  set hobbyType($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasHobbyType() => $_has(11);
  @$pb.TagNumber(12)
  void clearHobbyType() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get experience => $_getIZ(12);
  @$pb.TagNumber(13)
  set experience($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasExperience() => $_has(12);
  @$pb.TagNumber(13)
  void clearExperience() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get accompanyType => $_getSZ(13);
  @$pb.TagNumber(14)
  set accompanyType($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasAccompanyType() => $_has(13);
  @$pb.TagNumber(14)
  void clearAccompanyType() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get religious => $_getSZ(14);
  @$pb.TagNumber(15)
  set religious($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasReligious() => $_has(14);
  @$pb.TagNumber(15)
  void clearReligious() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get introduce => $_getSZ(15);
  @$pb.TagNumber(16)
  set introduce($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasIntroduce() => $_has(15);
  @$pb.TagNumber(16)
  void clearIntroduce() => clearField(16);
}

class UpdateCanChangeResponse extends $pb.GeneratedMessage {
  factory UpdateCanChangeResponse({
    $21.CanChange? canChangeInfo,
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
    ..aOM<$21.CanChange>(1, _omitFieldNames ? '' : 'CanChangeInfo', protoName: 'CanChangeInfo', subBuilder: $21.CanChange.create)
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
  $21.CanChange get canChangeInfo => $_getN(0);
  @$pb.TagNumber(1)
  set canChangeInfo($21.CanChange v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasCanChangeInfo() => $_has(0);
  @$pb.TagNumber(1)
  void clearCanChangeInfo() => clearField(1);
  @$pb.TagNumber(1)
  $21.CanChange ensureCanChangeInfo() => $_ensure(0);
}

/// Delete
class DeleteCanChangeRequest extends $pb.GeneratedMessage {
  factory DeleteCanChangeRequest({
    $core.String? sessionID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    return $result;
  }
  DeleteCanChangeRequest._() : super();
  factory DeleteCanChangeRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteCanChangeRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteCanChangeRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteCanChangeRequest clone() => DeleteCanChangeRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteCanChangeRequest copyWith(void Function(DeleteCanChangeRequest) updates) => super.copyWith((message) => updates(message as DeleteCanChangeRequest)) as DeleteCanChangeRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteCanChangeRequest create() => DeleteCanChangeRequest._();
  DeleteCanChangeRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteCanChangeRequest> createRepeated() => $pb.PbList<DeleteCanChangeRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteCanChangeRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteCanChangeRequest>(create);
  static DeleteCanChangeRequest? _defaultInstance;

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
