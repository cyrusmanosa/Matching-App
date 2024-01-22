//
//  Generated code. Do not modify.
//  source: rpc_fix.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'fix.pb.dart' as $25;
import 'google/protobuf/timestamp.pb.dart' as $18;

/// Create
class CreateFixRequest extends $pb.GeneratedMessage {
  factory CreateFixRequest({
    $core.String? firstName,
    $core.String? lastName,
    $core.String? birth,
    $core.String? country,
    $core.String? gender,
    $core.String? blood,
  }) {
    final $result = create();
    if (firstName != null) {
      $result.firstName = firstName;
    }
    if (lastName != null) {
      $result.lastName = lastName;
    }
    if (birth != null) {
      $result.birth = birth;
    }
    if (country != null) {
      $result.country = country;
    }
    if (gender != null) {
      $result.gender = gender;
    }
    if (blood != null) {
      $result.blood = blood;
    }
    return $result;
  }
  CreateFixRequest._() : super();
  factory CreateFixRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFixRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateFixRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'FirstName', protoName: 'FirstName')
    ..aOS(2, _omitFieldNames ? '' : 'LastName', protoName: 'LastName')
    ..aOS(3, _omitFieldNames ? '' : 'Birth', protoName: 'Birth')
    ..aOS(4, _omitFieldNames ? '' : 'Country', protoName: 'Country')
    ..aOS(5, _omitFieldNames ? '' : 'Gender', protoName: 'Gender')
    ..aOS(6, _omitFieldNames ? '' : 'Blood', protoName: 'Blood')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateFixRequest clone() => CreateFixRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateFixRequest copyWith(void Function(CreateFixRequest) updates) => super.copyWith((message) => updates(message as CreateFixRequest)) as CreateFixRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFixRequest create() => CreateFixRequest._();
  CreateFixRequest createEmptyInstance() => create();
  static $pb.PbList<CreateFixRequest> createRepeated() => $pb.PbList<CreateFixRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateFixRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFixRequest>(create);
  static CreateFixRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firstName => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lastName => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get birth => $_getSZ(2);
  @$pb.TagNumber(3)
  set birth($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBirth() => $_has(2);
  @$pb.TagNumber(3)
  void clearBirth() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get country => $_getSZ(3);
  @$pb.TagNumber(4)
  set country($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCountry() => $_has(3);
  @$pb.TagNumber(4)
  void clearCountry() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get gender => $_getSZ(4);
  @$pb.TagNumber(5)
  set gender($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGender() => $_has(4);
  @$pb.TagNumber(5)
  void clearGender() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get blood => $_getSZ(5);
  @$pb.TagNumber(6)
  set blood($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBlood() => $_has(5);
  @$pb.TagNumber(6)
  void clearBlood() => clearField(6);
}

class CreateFixResponse extends $pb.GeneratedMessage {
  factory CreateFixResponse({
    $core.String? sessionsID,
    $core.String? email,
    $18.Timestamp? createAt,
    $18.Timestamp? accessTokenExpiresAt,
  }) {
    final $result = create();
    if (sessionsID != null) {
      $result.sessionsID = sessionsID;
    }
    if (email != null) {
      $result.email = email;
    }
    if (createAt != null) {
      $result.createAt = createAt;
    }
    if (accessTokenExpiresAt != null) {
      $result.accessTokenExpiresAt = accessTokenExpiresAt;
    }
    return $result;
  }
  CreateFixResponse._() : super();
  factory CreateFixResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateFixResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateFixResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionsID', protoName: 'SessionsID')
    ..aOS(2, _omitFieldNames ? '' : 'Email', protoName: 'Email')
    ..aOM<$18.Timestamp>(3, _omitFieldNames ? '' : 'CreateAt', protoName: 'CreateAt', subBuilder: $18.Timestamp.create)
    ..aOM<$18.Timestamp>(4, _omitFieldNames ? '' : 'AccessTokenExpiresAt', protoName: 'AccessTokenExpiresAt', subBuilder: $18.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateFixResponse clone() => CreateFixResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateFixResponse copyWith(void Function(CreateFixResponse) updates) => super.copyWith((message) => updates(message as CreateFixResponse)) as CreateFixResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateFixResponse create() => CreateFixResponse._();
  CreateFixResponse createEmptyInstance() => create();
  static $pb.PbList<CreateFixResponse> createRepeated() => $pb.PbList<CreateFixResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateFixResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateFixResponse>(create);
  static CreateFixResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionsID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionsID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionsID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionsID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => clearField(2);

  @$pb.TagNumber(3)
  $18.Timestamp get createAt => $_getN(2);
  @$pb.TagNumber(3)
  set createAt($18.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCreateAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreateAt() => clearField(3);
  @$pb.TagNumber(3)
  $18.Timestamp ensureCreateAt() => $_ensure(2);

  @$pb.TagNumber(4)
  $18.Timestamp get accessTokenExpiresAt => $_getN(3);
  @$pb.TagNumber(4)
  set accessTokenExpiresAt($18.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasAccessTokenExpiresAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearAccessTokenExpiresAt() => clearField(4);
  @$pb.TagNumber(4)
  $18.Timestamp ensureAccessTokenExpiresAt() => $_ensure(3);
}

/// Get
class GetFixRequest extends $pb.GeneratedMessage {
  factory GetFixRequest({
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
  GetFixRequest._() : super();
  factory GetFixRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFixRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFixRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFixRequest clone() => GetFixRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFixRequest copyWith(void Function(GetFixRequest) updates) => super.copyWith((message) => updates(message as GetFixRequest)) as GetFixRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFixRequest create() => GetFixRequest._();
  GetFixRequest createEmptyInstance() => create();
  static $pb.PbList<GetFixRequest> createRepeated() => $pb.PbList<GetFixRequest>();
  @$core.pragma('dart2js:noInline')
  static GetFixRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFixRequest>(create);
  static GetFixRequest? _defaultInstance;

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

class GetFixResponse extends $pb.GeneratedMessage {
  factory GetFixResponse({
    $25.Fix? fix,
  }) {
    final $result = create();
    if (fix != null) {
      $result.fix = fix;
    }
    return $result;
  }
  GetFixResponse._() : super();
  factory GetFixResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetFixResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetFixResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$25.Fix>(1, _omitFieldNames ? '' : 'fix', subBuilder: $25.Fix.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetFixResponse clone() => GetFixResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetFixResponse copyWith(void Function(GetFixResponse) updates) => super.copyWith((message) => updates(message as GetFixResponse)) as GetFixResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetFixResponse create() => GetFixResponse._();
  GetFixResponse createEmptyInstance() => create();
  static $pb.PbList<GetFixResponse> createRepeated() => $pb.PbList<GetFixResponse>();
  @$core.pragma('dart2js:noInline')
  static GetFixResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetFixResponse>(create);
  static GetFixResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $25.Fix get fix => $_getN(0);
  @$pb.TagNumber(1)
  set fix($25.Fix v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFix() => $_has(0);
  @$pb.TagNumber(1)
  void clearFix() => clearField(1);
  @$pb.TagNumber(1)
  $25.Fix ensureFix() => $_ensure(0);
}

/// Delete
class DeleteFixRequest extends $pb.GeneratedMessage {
  factory DeleteFixRequest({
    $core.String? sessionID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    return $result;
  }
  DeleteFixRequest._() : super();
  factory DeleteFixRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteFixRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteFixRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteFixRequest clone() => DeleteFixRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteFixRequest copyWith(void Function(DeleteFixRequest) updates) => super.copyWith((message) => updates(message as DeleteFixRequest)) as DeleteFixRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteFixRequest create() => DeleteFixRequest._();
  DeleteFixRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteFixRequest> createRepeated() => $pb.PbList<DeleteFixRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteFixRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteFixRequest>(create);
  static DeleteFixRequest? _defaultInstance;

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
