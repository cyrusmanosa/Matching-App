//
//  Generated code. Do not modify.
//  source: rpc_socialmedia.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'socialmedia.pb.dart' as $32;

class CreateSocialMediaRequest extends $pb.GeneratedMessage {
  factory CreateSocialMediaRequest({
    $core.int? userID,
    $core.int? targetID,
    $core.bool? image,
    $core.bool? contact,
    $core.bool? location,
    $core.bool? appointment,
    $core.bool? sns,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (targetID != null) {
      $result.targetID = targetID;
    }
    if (image != null) {
      $result.image = image;
    }
    if (contact != null) {
      $result.contact = contact;
    }
    if (location != null) {
      $result.location = location;
    }
    if (appointment != null) {
      $result.appointment = appointment;
    }
    if (sns != null) {
      $result.sns = sns;
    }
    return $result;
  }
  CreateSocialMediaRequest._() : super();
  factory CreateSocialMediaRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSocialMediaRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSocialMediaRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'TargetID', $pb.PbFieldType.O3, protoName: 'TargetID')
    ..aOB(3, _omitFieldNames ? '' : 'Image', protoName: 'Image')
    ..aOB(4, _omitFieldNames ? '' : 'Contact', protoName: 'Contact')
    ..aOB(5, _omitFieldNames ? '' : 'Location', protoName: 'Location')
    ..aOB(6, _omitFieldNames ? '' : 'Appointment', protoName: 'Appointment')
    ..aOB(7, _omitFieldNames ? '' : 'Sns', protoName: 'Sns')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSocialMediaRequest clone() => CreateSocialMediaRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSocialMediaRequest copyWith(void Function(CreateSocialMediaRequest) updates) => super.copyWith((message) => updates(message as CreateSocialMediaRequest)) as CreateSocialMediaRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSocialMediaRequest create() => CreateSocialMediaRequest._();
  CreateSocialMediaRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSocialMediaRequest> createRepeated() => $pb.PbList<CreateSocialMediaRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSocialMediaRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSocialMediaRequest>(create);
  static CreateSocialMediaRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get targetID => $_getIZ(1);
  @$pb.TagNumber(2)
  set targetID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetID() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetID() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get image => $_getBF(2);
  @$pb.TagNumber(3)
  set image($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get contact => $_getBF(3);
  @$pb.TagNumber(4)
  set contact($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContact() => $_has(3);
  @$pb.TagNumber(4)
  void clearContact() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get location => $_getBF(4);
  @$pb.TagNumber(5)
  set location($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLocation() => $_has(4);
  @$pb.TagNumber(5)
  void clearLocation() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get appointment => $_getBF(5);
  @$pb.TagNumber(6)
  set appointment($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAppointment() => $_has(5);
  @$pb.TagNumber(6)
  void clearAppointment() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get sns => $_getBF(6);
  @$pb.TagNumber(7)
  set sns($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSns() => $_has(6);
  @$pb.TagNumber(7)
  void clearSns() => clearField(7);
}

class CreateSocialMediaResponse extends $pb.GeneratedMessage {
  factory CreateSocialMediaResponse({
    $32.SocialMedia? sm,
  }) {
    final $result = create();
    if (sm != null) {
      $result.sm = sm;
    }
    return $result;
  }
  CreateSocialMediaResponse._() : super();
  factory CreateSocialMediaResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSocialMediaResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSocialMediaResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$32.SocialMedia>(1, _omitFieldNames ? '' : 'sm', subBuilder: $32.SocialMedia.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSocialMediaResponse clone() => CreateSocialMediaResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSocialMediaResponse copyWith(void Function(CreateSocialMediaResponse) updates) => super.copyWith((message) => updates(message as CreateSocialMediaResponse)) as CreateSocialMediaResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSocialMediaResponse create() => CreateSocialMediaResponse._();
  CreateSocialMediaResponse createEmptyInstance() => create();
  static $pb.PbList<CreateSocialMediaResponse> createRepeated() => $pb.PbList<CreateSocialMediaResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateSocialMediaResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSocialMediaResponse>(create);
  static CreateSocialMediaResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $32.SocialMedia get sm => $_getN(0);
  @$pb.TagNumber(1)
  set sm($32.SocialMedia v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSm() => $_has(0);
  @$pb.TagNumber(1)
  void clearSm() => clearField(1);
  @$pb.TagNumber(1)
  $32.SocialMedia ensureSm() => $_ensure(0);
}

class UpdateSocialMediaRequest extends $pb.GeneratedMessage {
  factory UpdateSocialMediaRequest({
    $core.int? userID,
    $core.int? targetID,
    $core.bool? image,
    $core.bool? contact,
    $core.bool? location,
    $core.bool? appointment,
    $core.bool? sns,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (targetID != null) {
      $result.targetID = targetID;
    }
    if (image != null) {
      $result.image = image;
    }
    if (contact != null) {
      $result.contact = contact;
    }
    if (location != null) {
      $result.location = location;
    }
    if (appointment != null) {
      $result.appointment = appointment;
    }
    if (sns != null) {
      $result.sns = sns;
    }
    return $result;
  }
  UpdateSocialMediaRequest._() : super();
  factory UpdateSocialMediaRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSocialMediaRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSocialMediaRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'TargetID', $pb.PbFieldType.O3, protoName: 'TargetID')
    ..aOB(3, _omitFieldNames ? '' : 'Image', protoName: 'Image')
    ..aOB(4, _omitFieldNames ? '' : 'Contact', protoName: 'Contact')
    ..aOB(5, _omitFieldNames ? '' : 'Location', protoName: 'Location')
    ..aOB(6, _omitFieldNames ? '' : 'Appointment', protoName: 'Appointment')
    ..aOB(7, _omitFieldNames ? '' : 'Sns', protoName: 'Sns')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSocialMediaRequest clone() => UpdateSocialMediaRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSocialMediaRequest copyWith(void Function(UpdateSocialMediaRequest) updates) => super.copyWith((message) => updates(message as UpdateSocialMediaRequest)) as UpdateSocialMediaRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSocialMediaRequest create() => UpdateSocialMediaRequest._();
  UpdateSocialMediaRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSocialMediaRequest> createRepeated() => $pb.PbList<UpdateSocialMediaRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSocialMediaRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSocialMediaRequest>(create);
  static UpdateSocialMediaRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get targetID => $_getIZ(1);
  @$pb.TagNumber(2)
  set targetID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetID() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetID() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get image => $_getBF(2);
  @$pb.TagNumber(3)
  set image($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImage() => $_has(2);
  @$pb.TagNumber(3)
  void clearImage() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get contact => $_getBF(3);
  @$pb.TagNumber(4)
  set contact($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasContact() => $_has(3);
  @$pb.TagNumber(4)
  void clearContact() => clearField(4);

  @$pb.TagNumber(5)
  $core.bool get location => $_getBF(4);
  @$pb.TagNumber(5)
  set location($core.bool v) { $_setBool(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLocation() => $_has(4);
  @$pb.TagNumber(5)
  void clearLocation() => clearField(5);

  @$pb.TagNumber(6)
  $core.bool get appointment => $_getBF(5);
  @$pb.TagNumber(6)
  set appointment($core.bool v) { $_setBool(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasAppointment() => $_has(5);
  @$pb.TagNumber(6)
  void clearAppointment() => clearField(6);

  @$pb.TagNumber(7)
  $core.bool get sns => $_getBF(6);
  @$pb.TagNumber(7)
  set sns($core.bool v) { $_setBool(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSns() => $_has(6);
  @$pb.TagNumber(7)
  void clearSns() => clearField(7);
}

class UpdateSocialMediaResponse extends $pb.GeneratedMessage {
  factory UpdateSocialMediaResponse({
    $32.SocialMedia? sm,
  }) {
    final $result = create();
    if (sm != null) {
      $result.sm = sm;
    }
    return $result;
  }
  UpdateSocialMediaResponse._() : super();
  factory UpdateSocialMediaResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSocialMediaResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSocialMediaResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$32.SocialMedia>(1, _omitFieldNames ? '' : 'sm', subBuilder: $32.SocialMedia.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSocialMediaResponse clone() => UpdateSocialMediaResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSocialMediaResponse copyWith(void Function(UpdateSocialMediaResponse) updates) => super.copyWith((message) => updates(message as UpdateSocialMediaResponse)) as UpdateSocialMediaResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSocialMediaResponse create() => UpdateSocialMediaResponse._();
  UpdateSocialMediaResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateSocialMediaResponse> createRepeated() => $pb.PbList<UpdateSocialMediaResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateSocialMediaResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSocialMediaResponse>(create);
  static UpdateSocialMediaResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $32.SocialMedia get sm => $_getN(0);
  @$pb.TagNumber(1)
  set sm($32.SocialMedia v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSm() => $_has(0);
  @$pb.TagNumber(1)
  void clearSm() => clearField(1);
  @$pb.TagNumber(1)
  $32.SocialMedia ensureSm() => $_ensure(0);
}

class GetSocialMediaRequest extends $pb.GeneratedMessage {
  factory GetSocialMediaRequest({
    $core.int? userID,
    $core.int? targetID,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (targetID != null) {
      $result.targetID = targetID;
    }
    return $result;
  }
  GetSocialMediaRequest._() : super();
  factory GetSocialMediaRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSocialMediaRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSocialMediaRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'TargetID', $pb.PbFieldType.O3, protoName: 'TargetID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSocialMediaRequest clone() => GetSocialMediaRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSocialMediaRequest copyWith(void Function(GetSocialMediaRequest) updates) => super.copyWith((message) => updates(message as GetSocialMediaRequest)) as GetSocialMediaRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSocialMediaRequest create() => GetSocialMediaRequest._();
  GetSocialMediaRequest createEmptyInstance() => create();
  static $pb.PbList<GetSocialMediaRequest> createRepeated() => $pb.PbList<GetSocialMediaRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSocialMediaRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSocialMediaRequest>(create);
  static GetSocialMediaRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get targetID => $_getIZ(1);
  @$pb.TagNumber(2)
  set targetID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetID() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetID() => clearField(2);
}

class GetSocialMediaResponse extends $pb.GeneratedMessage {
  factory GetSocialMediaResponse({
    $32.SocialMedia? sm,
  }) {
    final $result = create();
    if (sm != null) {
      $result.sm = sm;
    }
    return $result;
  }
  GetSocialMediaResponse._() : super();
  factory GetSocialMediaResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSocialMediaResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSocialMediaResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$32.SocialMedia>(1, _omitFieldNames ? '' : 'sm', subBuilder: $32.SocialMedia.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSocialMediaResponse clone() => GetSocialMediaResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSocialMediaResponse copyWith(void Function(GetSocialMediaResponse) updates) => super.copyWith((message) => updates(message as GetSocialMediaResponse)) as GetSocialMediaResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSocialMediaResponse create() => GetSocialMediaResponse._();
  GetSocialMediaResponse createEmptyInstance() => create();
  static $pb.PbList<GetSocialMediaResponse> createRepeated() => $pb.PbList<GetSocialMediaResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSocialMediaResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSocialMediaResponse>(create);
  static GetSocialMediaResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $32.SocialMedia get sm => $_getN(0);
  @$pb.TagNumber(1)
  set sm($32.SocialMedia v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSm() => $_has(0);
  @$pb.TagNumber(1)
  void clearSm() => clearField(1);
  @$pb.TagNumber(1)
  $32.SocialMedia ensureSm() => $_ensure(0);
}

class DeleteSocialMediaRequest extends $pb.GeneratedMessage {
  factory DeleteSocialMediaRequest({
    $core.int? userID,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    return $result;
  }
  DeleteSocialMediaRequest._() : super();
  factory DeleteSocialMediaRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteSocialMediaRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteSocialMediaRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteSocialMediaRequest clone() => DeleteSocialMediaRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteSocialMediaRequest copyWith(void Function(DeleteSocialMediaRequest) updates) => super.copyWith((message) => updates(message as DeleteSocialMediaRequest)) as DeleteSocialMediaRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSocialMediaRequest create() => DeleteSocialMediaRequest._();
  DeleteSocialMediaRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteSocialMediaRequest> createRepeated() => $pb.PbList<DeleteSocialMediaRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteSocialMediaRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSocialMediaRequest>(create);
  static DeleteSocialMediaRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
