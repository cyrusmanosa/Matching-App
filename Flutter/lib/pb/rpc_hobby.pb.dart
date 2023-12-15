//
//  Generated code. Do not modify.
//  source: rpc_hobby.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'hobby.pb.dart' as $17;

/// Create
class CreateHobbyRequest extends $pb.GeneratedMessage {
  factory CreateHobbyRequest({
    $core.String? sessionID,
    $core.int? era,
    $core.String? city,
    $core.String? gender,
    $core.int? height,
    $core.int? weight,
    $core.String? speaklanguage,
    $core.String? findType,
    $core.String? findTarget,
    $core.int? experience,
    $core.String? sociability,
    $core.bool? certification,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (era != null) {
      $result.era = era;
    }
    if (city != null) {
      $result.city = city;
    }
    if (gender != null) {
      $result.gender = gender;
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
    if (findType != null) {
      $result.findType = findType;
    }
    if (findTarget != null) {
      $result.findTarget = findTarget;
    }
    if (experience != null) {
      $result.experience = experience;
    }
    if (sociability != null) {
      $result.sociability = sociability;
    }
    if (certification != null) {
      $result.certification = certification;
    }
    return $result;
  }
  CreateHobbyRequest._() : super();
  factory CreateHobbyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateHobbyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateHobbyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'Era', $pb.PbFieldType.O3, protoName: 'Era')
    ..aOS(3, _omitFieldNames ? '' : 'City', protoName: 'City')
    ..aOS(4, _omitFieldNames ? '' : 'Gender', protoName: 'Gender')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'Height', $pb.PbFieldType.O3, protoName: 'Height')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'Weight', $pb.PbFieldType.O3, protoName: 'Weight')
    ..aOS(7, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(8, _omitFieldNames ? '' : 'FindType', protoName: 'FindType')
    ..aOS(9, _omitFieldNames ? '' : 'FindTarget', protoName: 'FindTarget')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'Experience', $pb.PbFieldType.O3, protoName: 'Experience')
    ..aOS(11, _omitFieldNames ? '' : 'Sociability', protoName: 'Sociability')
    ..aOB(12, _omitFieldNames ? '' : 'Certification', protoName: 'Certification')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateHobbyRequest clone() => CreateHobbyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateHobbyRequest copyWith(void Function(CreateHobbyRequest) updates) => super.copyWith((message) => updates(message as CreateHobbyRequest)) as CreateHobbyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateHobbyRequest create() => CreateHobbyRequest._();
  CreateHobbyRequest createEmptyInstance() => create();
  static $pb.PbList<CreateHobbyRequest> createRepeated() => $pb.PbList<CreateHobbyRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateHobbyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateHobbyRequest>(create);
  static CreateHobbyRequest? _defaultInstance;

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
  $core.String get city => $_getSZ(2);
  @$pb.TagNumber(3)
  set city($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCity() => $_has(2);
  @$pb.TagNumber(3)
  void clearCity() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get gender => $_getSZ(3);
  @$pb.TagNumber(4)
  set gender($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => clearField(4);

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
  $core.String get findType => $_getSZ(7);
  @$pb.TagNumber(8)
  set findType($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFindType() => $_has(7);
  @$pb.TagNumber(8)
  void clearFindType() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get findTarget => $_getSZ(8);
  @$pb.TagNumber(9)
  set findTarget($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasFindTarget() => $_has(8);
  @$pb.TagNumber(9)
  void clearFindTarget() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get experience => $_getIZ(9);
  @$pb.TagNumber(10)
  set experience($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasExperience() => $_has(9);
  @$pb.TagNumber(10)
  void clearExperience() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get sociability => $_getSZ(10);
  @$pb.TagNumber(11)
  set sociability($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSociability() => $_has(10);
  @$pb.TagNumber(11)
  void clearSociability() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get certification => $_getBF(11);
  @$pb.TagNumber(12)
  set certification($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasCertification() => $_has(11);
  @$pb.TagNumber(12)
  void clearCertification() => clearField(12);
}

class CreateHobbyResponse extends $pb.GeneratedMessage {
  factory CreateHobbyResponse({
    $17.Hobby? h,
  }) {
    final $result = create();
    if (h != null) {
      $result.h = h;
    }
    return $result;
  }
  CreateHobbyResponse._() : super();
  factory CreateHobbyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateHobbyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateHobbyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$17.Hobby>(1, _omitFieldNames ? '' : 'h', subBuilder: $17.Hobby.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateHobbyResponse clone() => CreateHobbyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateHobbyResponse copyWith(void Function(CreateHobbyResponse) updates) => super.copyWith((message) => updates(message as CreateHobbyResponse)) as CreateHobbyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateHobbyResponse create() => CreateHobbyResponse._();
  CreateHobbyResponse createEmptyInstance() => create();
  static $pb.PbList<CreateHobbyResponse> createRepeated() => $pb.PbList<CreateHobbyResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateHobbyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateHobbyResponse>(create);
  static CreateHobbyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $17.Hobby get h => $_getN(0);
  @$pb.TagNumber(1)
  set h($17.Hobby v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasH() => $_has(0);
  @$pb.TagNumber(1)
  void clearH() => clearField(1);
  @$pb.TagNumber(1)
  $17.Hobby ensureH() => $_ensure(0);
}

/// Get
class GetHobbyRequest extends $pb.GeneratedMessage {
  factory GetHobbyRequest({
    $core.String? sessionID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    return $result;
  }
  GetHobbyRequest._() : super();
  factory GetHobbyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetHobbyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetHobbyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetHobbyRequest clone() => GetHobbyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetHobbyRequest copyWith(void Function(GetHobbyRequest) updates) => super.copyWith((message) => updates(message as GetHobbyRequest)) as GetHobbyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetHobbyRequest create() => GetHobbyRequest._();
  GetHobbyRequest createEmptyInstance() => create();
  static $pb.PbList<GetHobbyRequest> createRepeated() => $pb.PbList<GetHobbyRequest>();
  @$core.pragma('dart2js:noInline')
  static GetHobbyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetHobbyRequest>(create);
  static GetHobbyRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);
}

class GetHobbyResponse extends $pb.GeneratedMessage {
  factory GetHobbyResponse({
    $17.Hobby? h,
  }) {
    final $result = create();
    if (h != null) {
      $result.h = h;
    }
    return $result;
  }
  GetHobbyResponse._() : super();
  factory GetHobbyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetHobbyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetHobbyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$17.Hobby>(1, _omitFieldNames ? '' : 'h', subBuilder: $17.Hobby.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetHobbyResponse clone() => GetHobbyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetHobbyResponse copyWith(void Function(GetHobbyResponse) updates) => super.copyWith((message) => updates(message as GetHobbyResponse)) as GetHobbyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetHobbyResponse create() => GetHobbyResponse._();
  GetHobbyResponse createEmptyInstance() => create();
  static $pb.PbList<GetHobbyResponse> createRepeated() => $pb.PbList<GetHobbyResponse>();
  @$core.pragma('dart2js:noInline')
  static GetHobbyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetHobbyResponse>(create);
  static GetHobbyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $17.Hobby get h => $_getN(0);
  @$pb.TagNumber(1)
  set h($17.Hobby v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasH() => $_has(0);
  @$pb.TagNumber(1)
  void clearH() => clearField(1);
  @$pb.TagNumber(1)
  $17.Hobby ensureH() => $_ensure(0);
}

/// Update
class UpdateHobbyRequest extends $pb.GeneratedMessage {
  factory UpdateHobbyRequest({
    $core.String? sessionID,
    $core.int? era,
    $core.String? city,
    $core.String? gender,
    $core.int? height,
    $core.int? weight,
    $core.String? speaklanguage,
    $core.String? findType,
    $core.String? findTarget,
    $core.int? experience,
    $core.String? sociability,
    $core.bool? certification,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (era != null) {
      $result.era = era;
    }
    if (city != null) {
      $result.city = city;
    }
    if (gender != null) {
      $result.gender = gender;
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
    if (findType != null) {
      $result.findType = findType;
    }
    if (findTarget != null) {
      $result.findTarget = findTarget;
    }
    if (experience != null) {
      $result.experience = experience;
    }
    if (sociability != null) {
      $result.sociability = sociability;
    }
    if (certification != null) {
      $result.certification = certification;
    }
    return $result;
  }
  UpdateHobbyRequest._() : super();
  factory UpdateHobbyRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateHobbyRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateHobbyRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'Era', $pb.PbFieldType.O3, protoName: 'Era')
    ..aOS(3, _omitFieldNames ? '' : 'City', protoName: 'City')
    ..aOS(4, _omitFieldNames ? '' : 'Gender', protoName: 'Gender')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'Height', $pb.PbFieldType.O3, protoName: 'Height')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'Weight', $pb.PbFieldType.O3, protoName: 'Weight')
    ..aOS(7, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(8, _omitFieldNames ? '' : 'FindType', protoName: 'FindType')
    ..aOS(9, _omitFieldNames ? '' : 'FindTarget', protoName: 'FindTarget')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'Experience', $pb.PbFieldType.O3, protoName: 'Experience')
    ..aOS(11, _omitFieldNames ? '' : 'Sociability', protoName: 'Sociability')
    ..aOB(12, _omitFieldNames ? '' : 'Certification', protoName: 'Certification')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateHobbyRequest clone() => UpdateHobbyRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateHobbyRequest copyWith(void Function(UpdateHobbyRequest) updates) => super.copyWith((message) => updates(message as UpdateHobbyRequest)) as UpdateHobbyRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateHobbyRequest create() => UpdateHobbyRequest._();
  UpdateHobbyRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateHobbyRequest> createRepeated() => $pb.PbList<UpdateHobbyRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateHobbyRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateHobbyRequest>(create);
  static UpdateHobbyRequest? _defaultInstance;

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
  $core.String get city => $_getSZ(2);
  @$pb.TagNumber(3)
  set city($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCity() => $_has(2);
  @$pb.TagNumber(3)
  void clearCity() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get gender => $_getSZ(3);
  @$pb.TagNumber(4)
  set gender($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasGender() => $_has(3);
  @$pb.TagNumber(4)
  void clearGender() => clearField(4);

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
  $core.String get findType => $_getSZ(7);
  @$pb.TagNumber(8)
  set findType($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasFindType() => $_has(7);
  @$pb.TagNumber(8)
  void clearFindType() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get findTarget => $_getSZ(8);
  @$pb.TagNumber(9)
  set findTarget($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasFindTarget() => $_has(8);
  @$pb.TagNumber(9)
  void clearFindTarget() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get experience => $_getIZ(9);
  @$pb.TagNumber(10)
  set experience($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasExperience() => $_has(9);
  @$pb.TagNumber(10)
  void clearExperience() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get sociability => $_getSZ(10);
  @$pb.TagNumber(11)
  set sociability($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSociability() => $_has(10);
  @$pb.TagNumber(11)
  void clearSociability() => clearField(11);

  @$pb.TagNumber(12)
  $core.bool get certification => $_getBF(11);
  @$pb.TagNumber(12)
  set certification($core.bool v) { $_setBool(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasCertification() => $_has(11);
  @$pb.TagNumber(12)
  void clearCertification() => clearField(12);
}

class UpdateHobbyResponse extends $pb.GeneratedMessage {
  factory UpdateHobbyResponse({
    $17.Hobby? h,
  }) {
    final $result = create();
    if (h != null) {
      $result.h = h;
    }
    return $result;
  }
  UpdateHobbyResponse._() : super();
  factory UpdateHobbyResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateHobbyResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateHobbyResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$17.Hobby>(1, _omitFieldNames ? '' : 'h', subBuilder: $17.Hobby.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateHobbyResponse clone() => UpdateHobbyResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateHobbyResponse copyWith(void Function(UpdateHobbyResponse) updates) => super.copyWith((message) => updates(message as UpdateHobbyResponse)) as UpdateHobbyResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateHobbyResponse create() => UpdateHobbyResponse._();
  UpdateHobbyResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateHobbyResponse> createRepeated() => $pb.PbList<UpdateHobbyResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateHobbyResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateHobbyResponse>(create);
  static UpdateHobbyResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $17.Hobby get h => $_getN(0);
  @$pb.TagNumber(1)
  set h($17.Hobby v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasH() => $_has(0);
  @$pb.TagNumber(1)
  void clearH() => clearField(1);
  @$pb.TagNumber(1)
  $17.Hobby ensureH() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
