//
//  Generated code. Do not modify.
//  source: rpc_login.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $19;

class LoginUserRequest extends $pb.GeneratedMessage {
  factory LoginUserRequest({
    $core.String? email,
    $core.String? password,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  LoginUserRequest._() : super();
  factory LoginUserRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginUserRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoginUserRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Email', protoName: 'Email')
    ..aOS(2, _omitFieldNames ? '' : 'Password', protoName: 'Password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginUserRequest clone() => LoginUserRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginUserRequest copyWith(void Function(LoginUserRequest) updates) => super.copyWith((message) => updates(message as LoginUserRequest)) as LoginUserRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginUserRequest create() => LoginUserRequest._();
  LoginUserRequest createEmptyInstance() => create();
  static $pb.PbList<LoginUserRequest> createRepeated() => $pb.PbList<LoginUserRequest>();
  @$core.pragma('dart2js:noInline')
  static LoginUserRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginUserRequest>(create);
  static LoginUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class LoginUserResponse extends $pb.GeneratedMessage {
  factory LoginUserResponse({
    $core.String? sessionsID,
    $core.String? email,
    $19.Timestamp? accessTokenExpiresAt,
  }) {
    final $result = create();
    if (sessionsID != null) {
      $result.sessionsID = sessionsID;
    }
    if (email != null) {
      $result.email = email;
    }
    if (accessTokenExpiresAt != null) {
      $result.accessTokenExpiresAt = accessTokenExpiresAt;
    }
    return $result;
  }
  LoginUserResponse._() : super();
  factory LoginUserResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory LoginUserResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'LoginUserResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionsID', protoName: 'SessionsID')
    ..aOS(3, _omitFieldNames ? '' : 'Email', protoName: 'Email')
    ..aOM<$19.Timestamp>(6, _omitFieldNames ? '' : 'AccessTokenExpiresAt', protoName: 'AccessTokenExpiresAt', subBuilder: $19.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  LoginUserResponse clone() => LoginUserResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  LoginUserResponse copyWith(void Function(LoginUserResponse) updates) => super.copyWith((message) => updates(message as LoginUserResponse)) as LoginUserResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static LoginUserResponse create() => LoginUserResponse._();
  LoginUserResponse createEmptyInstance() => create();
  static $pb.PbList<LoginUserResponse> createRepeated() => $pb.PbList<LoginUserResponse>();
  @$core.pragma('dart2js:noInline')
  static LoginUserResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<LoginUserResponse>(create);
  static LoginUserResponse? _defaultInstance;

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

  @$pb.TagNumber(6)
  $19.Timestamp get accessTokenExpiresAt => $_getN(2);
  @$pb.TagNumber(6)
  set accessTokenExpiresAt($19.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasAccessTokenExpiresAt() => $_has(2);
  @$pb.TagNumber(6)
  void clearAccessTokenExpiresAt() => clearField(6);
  @$pb.TagNumber(6)
  $19.Timestamp ensureAccessTokenExpiresAt() => $_ensure(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
