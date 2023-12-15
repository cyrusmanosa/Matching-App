//
//  Generated code. Do not modify.
//  source: rpc_lover.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'lover.pb.dart' as $19;

/// Create
class CreateLoverRequest extends $pb.GeneratedMessage {
  factory CreateLoverRequest({
    $core.String? sessionID,
    $core.int? minAge,
    $core.int? maxAge,
    $core.String? city,
    $core.String? gender,
    $core.String? constellation,
    $core.String? sexual,
    $core.int? height,
    $core.int? weight,
    $core.String? speaklanguage,
    $core.String? job,
    $core.int? annualSalary,
    $core.String? sociability,
    $core.String? religious,
    $core.bool? certification,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (minAge != null) {
      $result.minAge = minAge;
    }
    if (maxAge != null) {
      $result.maxAge = maxAge;
    }
    if (city != null) {
      $result.city = city;
    }
    if (gender != null) {
      $result.gender = gender;
    }
    if (constellation != null) {
      $result.constellation = constellation;
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
    if (certification != null) {
      $result.certification = certification;
    }
    return $result;
  }
  CreateLoverRequest._() : super();
  factory CreateLoverRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateLoverRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateLoverRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'MinAge', $pb.PbFieldType.O3, protoName: 'MinAge')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'MaxAge', $pb.PbFieldType.O3, protoName: 'MaxAge')
    ..aOS(4, _omitFieldNames ? '' : 'City', protoName: 'City')
    ..aOS(5, _omitFieldNames ? '' : 'Gender', protoName: 'Gender')
    ..aOS(6, _omitFieldNames ? '' : 'Constellation', protoName: 'Constellation')
    ..aOS(7, _omitFieldNames ? '' : 'Sexual', protoName: 'Sexual')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'Height', $pb.PbFieldType.O3, protoName: 'Height')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'Weight', $pb.PbFieldType.O3, protoName: 'Weight')
    ..aOS(10, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(11, _omitFieldNames ? '' : 'Job', protoName: 'Job')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'AnnualSalary', $pb.PbFieldType.O3, protoName: 'AnnualSalary')
    ..aOS(13, _omitFieldNames ? '' : 'Sociability', protoName: 'Sociability')
    ..aOS(14, _omitFieldNames ? '' : 'Religious', protoName: 'Religious')
    ..aOB(15, _omitFieldNames ? '' : 'Certification', protoName: 'Certification')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateLoverRequest clone() => CreateLoverRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateLoverRequest copyWith(void Function(CreateLoverRequest) updates) => super.copyWith((message) => updates(message as CreateLoverRequest)) as CreateLoverRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateLoverRequest create() => CreateLoverRequest._();
  CreateLoverRequest createEmptyInstance() => create();
  static $pb.PbList<CreateLoverRequest> createRepeated() => $pb.PbList<CreateLoverRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateLoverRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateLoverRequest>(create);
  static CreateLoverRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get minAge => $_getIZ(1);
  @$pb.TagNumber(2)
  set minAge($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMinAge() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinAge() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get maxAge => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxAge($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMaxAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxAge() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get city => $_getSZ(3);
  @$pb.TagNumber(4)
  set city($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCity() => $_has(3);
  @$pb.TagNumber(4)
  void clearCity() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get gender => $_getSZ(4);
  @$pb.TagNumber(5)
  set gender($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGender() => $_has(4);
  @$pb.TagNumber(5)
  void clearGender() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get constellation => $_getSZ(5);
  @$pb.TagNumber(6)
  set constellation($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasConstellation() => $_has(5);
  @$pb.TagNumber(6)
  void clearConstellation() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get sexual => $_getSZ(6);
  @$pb.TagNumber(7)
  set sexual($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSexual() => $_has(6);
  @$pb.TagNumber(7)
  void clearSexual() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get height => $_getIZ(7);
  @$pb.TagNumber(8)
  set height($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearHeight() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get weight => $_getIZ(8);
  @$pb.TagNumber(9)
  set weight($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasWeight() => $_has(8);
  @$pb.TagNumber(9)
  void clearWeight() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get speaklanguage => $_getSZ(9);
  @$pb.TagNumber(10)
  set speaklanguage($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSpeaklanguage() => $_has(9);
  @$pb.TagNumber(10)
  void clearSpeaklanguage() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get job => $_getSZ(10);
  @$pb.TagNumber(11)
  set job($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasJob() => $_has(10);
  @$pb.TagNumber(11)
  void clearJob() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get annualSalary => $_getIZ(11);
  @$pb.TagNumber(12)
  set annualSalary($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasAnnualSalary() => $_has(11);
  @$pb.TagNumber(12)
  void clearAnnualSalary() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get sociability => $_getSZ(12);
  @$pb.TagNumber(13)
  set sociability($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasSociability() => $_has(12);
  @$pb.TagNumber(13)
  void clearSociability() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get religious => $_getSZ(13);
  @$pb.TagNumber(14)
  set religious($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasReligious() => $_has(13);
  @$pb.TagNumber(14)
  void clearReligious() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get certification => $_getBF(14);
  @$pb.TagNumber(15)
  set certification($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasCertification() => $_has(14);
  @$pb.TagNumber(15)
  void clearCertification() => clearField(15);
}

class CreateLoverResponse extends $pb.GeneratedMessage {
  factory CreateLoverResponse({
    $19.Lover? l,
  }) {
    final $result = create();
    if (l != null) {
      $result.l = l;
    }
    return $result;
  }
  CreateLoverResponse._() : super();
  factory CreateLoverResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateLoverResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateLoverResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$19.Lover>(1, _omitFieldNames ? '' : 'l', subBuilder: $19.Lover.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateLoverResponse clone() => CreateLoverResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateLoverResponse copyWith(void Function(CreateLoverResponse) updates) => super.copyWith((message) => updates(message as CreateLoverResponse)) as CreateLoverResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateLoverResponse create() => CreateLoverResponse._();
  CreateLoverResponse createEmptyInstance() => create();
  static $pb.PbList<CreateLoverResponse> createRepeated() => $pb.PbList<CreateLoverResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateLoverResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateLoverResponse>(create);
  static CreateLoverResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $19.Lover get l => $_getN(0);
  @$pb.TagNumber(1)
  set l($19.Lover v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasL() => $_has(0);
  @$pb.TagNumber(1)
  void clearL() => clearField(1);
  @$pb.TagNumber(1)
  $19.Lover ensureL() => $_ensure(0);
}

/// Get
class GetLoverRequest extends $pb.GeneratedMessage {
  factory GetLoverRequest({
    $core.String? sessionID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    return $result;
  }
  GetLoverRequest._() : super();
  factory GetLoverRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLoverRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLoverRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLoverRequest clone() => GetLoverRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLoverRequest copyWith(void Function(GetLoverRequest) updates) => super.copyWith((message) => updates(message as GetLoverRequest)) as GetLoverRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLoverRequest create() => GetLoverRequest._();
  GetLoverRequest createEmptyInstance() => create();
  static $pb.PbList<GetLoverRequest> createRepeated() => $pb.PbList<GetLoverRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLoverRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLoverRequest>(create);
  static GetLoverRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);
}

class GetLoverResponse extends $pb.GeneratedMessage {
  factory GetLoverResponse({
    $19.Lover? l,
  }) {
    final $result = create();
    if (l != null) {
      $result.l = l;
    }
    return $result;
  }
  GetLoverResponse._() : super();
  factory GetLoverResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetLoverResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetLoverResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$19.Lover>(1, _omitFieldNames ? '' : 'l', subBuilder: $19.Lover.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetLoverResponse clone() => GetLoverResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetLoverResponse copyWith(void Function(GetLoverResponse) updates) => super.copyWith((message) => updates(message as GetLoverResponse)) as GetLoverResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLoverResponse create() => GetLoverResponse._();
  GetLoverResponse createEmptyInstance() => create();
  static $pb.PbList<GetLoverResponse> createRepeated() => $pb.PbList<GetLoverResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLoverResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetLoverResponse>(create);
  static GetLoverResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $19.Lover get l => $_getN(0);
  @$pb.TagNumber(1)
  set l($19.Lover v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasL() => $_has(0);
  @$pb.TagNumber(1)
  void clearL() => clearField(1);
  @$pb.TagNumber(1)
  $19.Lover ensureL() => $_ensure(0);
}

/// Update
class UpdateLoverRequest extends $pb.GeneratedMessage {
  factory UpdateLoverRequest({
    $core.String? sessionID,
    $core.int? minAge,
    $core.int? maxAge,
    $core.String? city,
    $core.String? gender,
    $core.String? constellation,
    $core.String? sexual,
    $core.int? height,
    $core.int? weight,
    $core.String? speaklanguage,
    $core.String? job,
    $core.int? annualSalary,
    $core.String? sociability,
    $core.String? religious,
    $core.bool? certification,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (minAge != null) {
      $result.minAge = minAge;
    }
    if (maxAge != null) {
      $result.maxAge = maxAge;
    }
    if (city != null) {
      $result.city = city;
    }
    if (gender != null) {
      $result.gender = gender;
    }
    if (constellation != null) {
      $result.constellation = constellation;
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
    if (certification != null) {
      $result.certification = certification;
    }
    return $result;
  }
  UpdateLoverRequest._() : super();
  factory UpdateLoverRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLoverRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateLoverRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'MinAge', $pb.PbFieldType.O3, protoName: 'MinAge')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'MaxAge', $pb.PbFieldType.O3, protoName: 'MaxAge')
    ..aOS(4, _omitFieldNames ? '' : 'City', protoName: 'City')
    ..aOS(5, _omitFieldNames ? '' : 'Gender', protoName: 'Gender')
    ..aOS(6, _omitFieldNames ? '' : 'Constellation', protoName: 'Constellation')
    ..aOS(7, _omitFieldNames ? '' : 'Sexual', protoName: 'Sexual')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'Height', $pb.PbFieldType.O3, protoName: 'Height')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'Weight', $pb.PbFieldType.O3, protoName: 'Weight')
    ..aOS(10, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(11, _omitFieldNames ? '' : 'Job', protoName: 'Job')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'AnnualSalary', $pb.PbFieldType.O3, protoName: 'AnnualSalary')
    ..aOS(13, _omitFieldNames ? '' : 'Sociability', protoName: 'Sociability')
    ..aOS(14, _omitFieldNames ? '' : 'Religious', protoName: 'Religious')
    ..aOB(15, _omitFieldNames ? '' : 'Certification', protoName: 'Certification')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLoverRequest clone() => UpdateLoverRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLoverRequest copyWith(void Function(UpdateLoverRequest) updates) => super.copyWith((message) => updates(message as UpdateLoverRequest)) as UpdateLoverRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateLoverRequest create() => UpdateLoverRequest._();
  UpdateLoverRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateLoverRequest> createRepeated() => $pb.PbList<UpdateLoverRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateLoverRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLoverRequest>(create);
  static UpdateLoverRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get minAge => $_getIZ(1);
  @$pb.TagNumber(2)
  set minAge($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMinAge() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinAge() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get maxAge => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxAge($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMaxAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxAge() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get city => $_getSZ(3);
  @$pb.TagNumber(4)
  set city($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCity() => $_has(3);
  @$pb.TagNumber(4)
  void clearCity() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get gender => $_getSZ(4);
  @$pb.TagNumber(5)
  set gender($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGender() => $_has(4);
  @$pb.TagNumber(5)
  void clearGender() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get constellation => $_getSZ(5);
  @$pb.TagNumber(6)
  set constellation($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasConstellation() => $_has(5);
  @$pb.TagNumber(6)
  void clearConstellation() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get sexual => $_getSZ(6);
  @$pb.TagNumber(7)
  set sexual($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSexual() => $_has(6);
  @$pb.TagNumber(7)
  void clearSexual() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get height => $_getIZ(7);
  @$pb.TagNumber(8)
  set height($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearHeight() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get weight => $_getIZ(8);
  @$pb.TagNumber(9)
  set weight($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasWeight() => $_has(8);
  @$pb.TagNumber(9)
  void clearWeight() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get speaklanguage => $_getSZ(9);
  @$pb.TagNumber(10)
  set speaklanguage($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSpeaklanguage() => $_has(9);
  @$pb.TagNumber(10)
  void clearSpeaklanguage() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get job => $_getSZ(10);
  @$pb.TagNumber(11)
  set job($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasJob() => $_has(10);
  @$pb.TagNumber(11)
  void clearJob() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get annualSalary => $_getIZ(11);
  @$pb.TagNumber(12)
  set annualSalary($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasAnnualSalary() => $_has(11);
  @$pb.TagNumber(12)
  void clearAnnualSalary() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get sociability => $_getSZ(12);
  @$pb.TagNumber(13)
  set sociability($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasSociability() => $_has(12);
  @$pb.TagNumber(13)
  void clearSociability() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get religious => $_getSZ(13);
  @$pb.TagNumber(14)
  set religious($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasReligious() => $_has(13);
  @$pb.TagNumber(14)
  void clearReligious() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get certification => $_getBF(14);
  @$pb.TagNumber(15)
  set certification($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasCertification() => $_has(14);
  @$pb.TagNumber(15)
  void clearCertification() => clearField(15);
}

class UpdateLoverResponse extends $pb.GeneratedMessage {
  factory UpdateLoverResponse({
    $19.Lover? l,
  }) {
    final $result = create();
    if (l != null) {
      $result.l = l;
    }
    return $result;
  }
  UpdateLoverResponse._() : super();
  factory UpdateLoverResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateLoverResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateLoverResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$19.Lover>(1, _omitFieldNames ? '' : 'l', subBuilder: $19.Lover.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateLoverResponse clone() => UpdateLoverResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateLoverResponse copyWith(void Function(UpdateLoverResponse) updates) => super.copyWith((message) => updates(message as UpdateLoverResponse)) as UpdateLoverResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateLoverResponse create() => UpdateLoverResponse._();
  UpdateLoverResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateLoverResponse> createRepeated() => $pb.PbList<UpdateLoverResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateLoverResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateLoverResponse>(create);
  static UpdateLoverResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $19.Lover get l => $_getN(0);
  @$pb.TagNumber(1)
  set l($19.Lover v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasL() => $_has(0);
  @$pb.TagNumber(1)
  void clearL() => clearField(1);
  @$pb.TagNumber(1)
  $19.Lover ensureL() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
