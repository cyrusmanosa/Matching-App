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

import 'google/protobuf/timestamp.pb.dart' as $12;

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
    $12.Timestamp? createAt,
    $12.Timestamp? accessTokenExpiresAt,
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
    ..aOS(3, _omitFieldNames ? '' : 'Email', protoName: 'Email')
    ..aOM<$12.Timestamp>(4, _omitFieldNames ? '' : 'CreateAt', protoName: 'CreateAt', subBuilder: $12.Timestamp.create)
    ..aOM<$12.Timestamp>(6, _omitFieldNames ? '' : 'AccessTokenExpiresAt', protoName: 'AccessTokenExpiresAt', subBuilder: $12.Timestamp.create)
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

  @$pb.TagNumber(3)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(3)
  set email($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(3)
  void clearEmail() => clearField(3);

  @$pb.TagNumber(4)
  $12.Timestamp get createAt => $_getN(2);
  @$pb.TagNumber(4)
  set createAt($12.Timestamp v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasCreateAt() => $_has(2);
  @$pb.TagNumber(4)
  void clearCreateAt() => clearField(4);
  @$pb.TagNumber(4)
  $12.Timestamp ensureCreateAt() => $_ensure(2);

  @$pb.TagNumber(6)
  $12.Timestamp get accessTokenExpiresAt => $_getN(3);
  @$pb.TagNumber(6)
  set accessTokenExpiresAt($12.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasAccessTokenExpiresAt() => $_has(3);
  @$pb.TagNumber(6)
  void clearAccessTokenExpiresAt() => clearField(6);
  @$pb.TagNumber(6)
  $12.Timestamp ensureAccessTokenExpiresAt() => $_ensure(3);
}

class DelFix extends $pb.GeneratedMessage {
  factory DelFix({
    $core.String? sessionsID,
  }) {
    final $result = create();
    if (sessionsID != null) {
      $result.sessionsID = sessionsID;
    }
    return $result;
  }
  DelFix._() : super();
  factory DelFix.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DelFix.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DelFix', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionsID', protoName: 'SessionsID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DelFix clone() => DelFix()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DelFix copyWith(void Function(DelFix) updates) => super.copyWith((message) => updates(message as DelFix)) as DelFix;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DelFix create() => DelFix._();
  DelFix createEmptyInstance() => create();
  static $pb.PbList<DelFix> createRepeated() => $pb.PbList<DelFix>();
  @$core.pragma('dart2js:noInline')
  static DelFix getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DelFix>(create);
  static DelFix? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionsID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionsID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionsID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionsID() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
