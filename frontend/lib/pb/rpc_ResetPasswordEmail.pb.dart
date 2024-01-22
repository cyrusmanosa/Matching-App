//
//  Generated code. Do not modify.
//  source: rpc_ResetPasswordEmail.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResetPwEmailRequest extends $pb.GeneratedMessage {
  factory ResetPwEmailRequest({
    $core.String? email,
  }) {
    final $result = create();
    if (email != null) {
      $result.email = email;
    }
    return $result;
  }
  ResetPwEmailRequest._() : super();
  factory ResetPwEmailRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPwEmailRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResetPwEmailRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetPwEmailRequest clone() => ResetPwEmailRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetPwEmailRequest copyWith(void Function(ResetPwEmailRequest) updates) => super.copyWith((message) => updates(message as ResetPwEmailRequest)) as ResetPwEmailRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResetPwEmailRequest create() => ResetPwEmailRequest._();
  ResetPwEmailRequest createEmptyInstance() => create();
  static $pb.PbList<ResetPwEmailRequest> createRepeated() => $pb.PbList<ResetPwEmailRequest>();
  @$core.pragma('dart2js:noInline')
  static ResetPwEmailRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPwEmailRequest>(create);
  static ResetPwEmailRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => clearField(1);
}

class ResetPwEmailResponse extends $pb.GeneratedMessage {
  factory ResetPwEmailResponse({
    $core.String? link,
    $core.String? status,
  }) {
    final $result = create();
    if (link != null) {
      $result.link = link;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  ResetPwEmailResponse._() : super();
  factory ResetPwEmailResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPwEmailResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResetPwEmailResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'link')
    ..aOS(2, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetPwEmailResponse clone() => ResetPwEmailResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetPwEmailResponse copyWith(void Function(ResetPwEmailResponse) updates) => super.copyWith((message) => updates(message as ResetPwEmailResponse)) as ResetPwEmailResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResetPwEmailResponse create() => ResetPwEmailResponse._();
  ResetPwEmailResponse createEmptyInstance() => create();
  static $pb.PbList<ResetPwEmailResponse> createRepeated() => $pb.PbList<ResetPwEmailResponse>();
  @$core.pragma('dart2js:noInline')
  static ResetPwEmailResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPwEmailResponse>(create);
  static ResetPwEmailResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get link => $_getSZ(0);
  @$pb.TagNumber(1)
  set link($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLink() => $_has(0);
  @$pb.TagNumber(1)
  void clearLink() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get status => $_getSZ(1);
  @$pb.TagNumber(2)
  set status($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => clearField(2);
}

class ResetPwEmailConfirmRequest extends $pb.GeneratedMessage {
  factory ResetPwEmailConfirmRequest({
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
  ResetPwEmailConfirmRequest._() : super();
  factory ResetPwEmailConfirmRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResetPwEmailConfirmRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResetPwEmailConfirmRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResetPwEmailConfirmRequest clone() => ResetPwEmailConfirmRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResetPwEmailConfirmRequest copyWith(void Function(ResetPwEmailConfirmRequest) updates) => super.copyWith((message) => updates(message as ResetPwEmailConfirmRequest)) as ResetPwEmailConfirmRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResetPwEmailConfirmRequest create() => ResetPwEmailConfirmRequest._();
  ResetPwEmailConfirmRequest createEmptyInstance() => create();
  static $pb.PbList<ResetPwEmailConfirmRequest> createRepeated() => $pb.PbList<ResetPwEmailConfirmRequest>();
  @$core.pragma('dart2js:noInline')
  static ResetPwEmailConfirmRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResetPwEmailConfirmRequest>(create);
  static ResetPwEmailConfirmRequest? _defaultInstance;

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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
