//
//  Generated code. Do not modify.
//  source: rpc_password.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $19;

class InputPasswordRequest extends $pb.GeneratedMessage {
  factory InputPasswordRequest({
    $core.String? sessionID,
    $core.String? password,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  InputPasswordRequest._() : super();
  factory InputPasswordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InputPasswordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InputPasswordRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..aOS(2, _omitFieldNames ? '' : 'Password', protoName: 'Password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InputPasswordRequest clone() => InputPasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InputPasswordRequest copyWith(void Function(InputPasswordRequest) updates) => super.copyWith((message) => updates(message as InputPasswordRequest)) as InputPasswordRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InputPasswordRequest create() => InputPasswordRequest._();
  InputPasswordRequest createEmptyInstance() => create();
  static $pb.PbList<InputPasswordRequest> createRepeated() => $pb.PbList<InputPasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static InputPasswordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InputPasswordRequest>(create);
  static InputPasswordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class InputPasswordResponse extends $pb.GeneratedMessage {
  factory InputPasswordResponse({
    $core.String? message,
    $19.Timestamp? passwordChangedAt,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    if (passwordChangedAt != null) {
      $result.passwordChangedAt = passwordChangedAt;
    }
    return $result;
  }
  InputPasswordResponse._() : super();
  factory InputPasswordResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory InputPasswordResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'InputPasswordResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..aOM<$19.Timestamp>(3, _omitFieldNames ? '' : 'PasswordChangedAt', protoName: 'PasswordChangedAt', subBuilder: $19.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  InputPasswordResponse clone() => InputPasswordResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  InputPasswordResponse copyWith(void Function(InputPasswordResponse) updates) => super.copyWith((message) => updates(message as InputPasswordResponse)) as InputPasswordResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InputPasswordResponse create() => InputPasswordResponse._();
  InputPasswordResponse createEmptyInstance() => create();
  static $pb.PbList<InputPasswordResponse> createRepeated() => $pb.PbList<InputPasswordResponse>();
  @$core.pragma('dart2js:noInline')
  static InputPasswordResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<InputPasswordResponse>(create);
  static InputPasswordResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(3)
  $19.Timestamp get passwordChangedAt => $_getN(1);
  @$pb.TagNumber(3)
  set passwordChangedAt($19.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPasswordChangedAt() => $_has(1);
  @$pb.TagNumber(3)
  void clearPasswordChangedAt() => clearField(3);
  @$pb.TagNumber(3)
  $19.Timestamp ensurePasswordChangedAt() => $_ensure(1);
}

class ResetPasswordRequest extends $pb.GeneratedMessage {
  factory ResetPasswordRequest({
    $core.String? sessionID,
    $core.String? password,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (password != null) {
      $result.password = password;
    }
    return $result;
  }
  ResetPasswordRequest._() : super();
  factory ResetPasswordRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPasswordRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResetPasswordRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..aOS(2, _omitFieldNames ? '' : 'Password', protoName: 'Password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetPasswordRequest clone() => ResetPasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetPasswordRequest copyWith(void Function(ResetPasswordRequest) updates) => super.copyWith((message) => updates(message as ResetPasswordRequest)) as ResetPasswordRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResetPasswordRequest create() => ResetPasswordRequest._();
  ResetPasswordRequest createEmptyInstance() => create();
  static $pb.PbList<ResetPasswordRequest> createRepeated() => $pb.PbList<ResetPasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static ResetPasswordRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPasswordRequest>(create);
  static ResetPasswordRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => clearField(2);
}

class ResetPasswordResponse extends $pb.GeneratedMessage {
  factory ResetPasswordResponse({
    $core.String? message,
    $19.Timestamp? passwordChangedAt,
  }) {
    final $result = create();
    if (message != null) {
      $result.message = message;
    }
    if (passwordChangedAt != null) {
      $result.passwordChangedAt = passwordChangedAt;
    }
    return $result;
  }
  ResetPasswordResponse._() : super();
  factory ResetPasswordResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPasswordResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResetPasswordResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..aOM<$19.Timestamp>(3, _omitFieldNames ? '' : 'PasswordChangedAt', protoName: 'PasswordChangedAt', subBuilder: $19.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetPasswordResponse clone() => ResetPasswordResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetPasswordResponse copyWith(void Function(ResetPasswordResponse) updates) => super.copyWith((message) => updates(message as ResetPasswordResponse)) as ResetPasswordResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResetPasswordResponse create() => ResetPasswordResponse._();
  ResetPasswordResponse createEmptyInstance() => create();
  static $pb.PbList<ResetPasswordResponse> createRepeated() => $pb.PbList<ResetPasswordResponse>();
  @$core.pragma('dart2js:noInline')
  static ResetPasswordResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPasswordResponse>(create);
  static ResetPasswordResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get message => $_getSZ(0);
  @$pb.TagNumber(1)
  set message($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMessage() => $_has(0);
  @$pb.TagNumber(1)
  void clearMessage() => clearField(1);

  @$pb.TagNumber(3)
  $19.Timestamp get passwordChangedAt => $_getN(1);
  @$pb.TagNumber(3)
  set passwordChangedAt($19.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPasswordChangedAt() => $_has(1);
  @$pb.TagNumber(3)
  void clearPasswordChangedAt() => clearField(3);
  @$pb.TagNumber(3)
  $19.Timestamp ensurePasswordChangedAt() => $_ensure(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
