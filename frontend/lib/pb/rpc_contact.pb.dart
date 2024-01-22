//
//  Generated code. Do not modify.
//  source: rpc_contact.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'contact.pb.dart' as $24;

/// Create
class CreateContactRequest extends $pb.GeneratedMessage {
  factory CreateContactRequest({
    $core.String? sessionID,
    $core.String? contactType,
    $core.String? message,
    $core.String? status,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (contactType != null) {
      $result.contactType = contactType;
    }
    if (message != null) {
      $result.message = message;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  CreateContactRequest._() : super();
  factory CreateContactRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateContactRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateContactRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..aOS(2, _omitFieldNames ? '' : 'ContactType', protoName: 'ContactType')
    ..aOS(3, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..aOS(4, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateContactRequest clone() => CreateContactRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateContactRequest copyWith(void Function(CreateContactRequest) updates) => super.copyWith((message) => updates(message as CreateContactRequest)) as CreateContactRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateContactRequest create() => CreateContactRequest._();
  CreateContactRequest createEmptyInstance() => create();
  static $pb.PbList<CreateContactRequest> createRepeated() => $pb.PbList<CreateContactRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateContactRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateContactRequest>(create);
  static CreateContactRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get contactType => $_getSZ(1);
  @$pb.TagNumber(2)
  set contactType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContactType() => $_has(1);
  @$pb.TagNumber(2)
  void clearContactType() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get status => $_getSZ(3);
  @$pb.TagNumber(4)
  set status($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => clearField(4);
}

class CreateContactResponse extends $pb.GeneratedMessage {
  factory CreateContactResponse({
    $24.Contact? c,
  }) {
    final $result = create();
    if (c != null) {
      $result.c = c;
    }
    return $result;
  }
  CreateContactResponse._() : super();
  factory CreateContactResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateContactResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateContactResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$24.Contact>(1, _omitFieldNames ? '' : 'c', subBuilder: $24.Contact.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateContactResponse clone() => CreateContactResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateContactResponse copyWith(void Function(CreateContactResponse) updates) => super.copyWith((message) => updates(message as CreateContactResponse)) as CreateContactResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateContactResponse create() => CreateContactResponse._();
  CreateContactResponse createEmptyInstance() => create();
  static $pb.PbList<CreateContactResponse> createRepeated() => $pb.PbList<CreateContactResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateContactResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateContactResponse>(create);
  static CreateContactResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $24.Contact get c => $_getN(0);
  @$pb.TagNumber(1)
  set c($24.Contact v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasC() => $_has(0);
  @$pb.TagNumber(1)
  void clearC() => clearField(1);
  @$pb.TagNumber(1)
  $24.Contact ensureC() => $_ensure(0);
}

/// Get
class GetContactRequest extends $pb.GeneratedMessage {
  factory GetContactRequest({
    $core.String? sessionID,
    $core.int? contactID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (contactID != null) {
      $result.contactID = contactID;
    }
    return $result;
  }
  GetContactRequest._() : super();
  factory GetContactRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetContactRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetContactRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'ContactID', $pb.PbFieldType.O3, protoName: 'ContactID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetContactRequest clone() => GetContactRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetContactRequest copyWith(void Function(GetContactRequest) updates) => super.copyWith((message) => updates(message as GetContactRequest)) as GetContactRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetContactRequest create() => GetContactRequest._();
  GetContactRequest createEmptyInstance() => create();
  static $pb.PbList<GetContactRequest> createRepeated() => $pb.PbList<GetContactRequest>();
  @$core.pragma('dart2js:noInline')
  static GetContactRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetContactRequest>(create);
  static GetContactRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get contactID => $_getIZ(1);
  @$pb.TagNumber(2)
  set contactID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContactID() => $_has(1);
  @$pb.TagNumber(2)
  void clearContactID() => clearField(2);
}

class GetContactResponse extends $pb.GeneratedMessage {
  factory GetContactResponse({
    $24.Contact? c,
  }) {
    final $result = create();
    if (c != null) {
      $result.c = c;
    }
    return $result;
  }
  GetContactResponse._() : super();
  factory GetContactResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetContactResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetContactResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$24.Contact>(1, _omitFieldNames ? '' : 'c', subBuilder: $24.Contact.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetContactResponse clone() => GetContactResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetContactResponse copyWith(void Function(GetContactResponse) updates) => super.copyWith((message) => updates(message as GetContactResponse)) as GetContactResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetContactResponse create() => GetContactResponse._();
  GetContactResponse createEmptyInstance() => create();
  static $pb.PbList<GetContactResponse> createRepeated() => $pb.PbList<GetContactResponse>();
  @$core.pragma('dart2js:noInline')
  static GetContactResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetContactResponse>(create);
  static GetContactResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $24.Contact get c => $_getN(0);
  @$pb.TagNumber(1)
  set c($24.Contact v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasC() => $_has(0);
  @$pb.TagNumber(1)
  void clearC() => clearField(1);
  @$pb.TagNumber(1)
  $24.Contact ensureC() => $_ensure(0);
}

/// Update
class UpdateContactRequest extends $pb.GeneratedMessage {
  factory UpdateContactRequest({
    $core.String? sessionID,
    $core.int? contactID,
    $core.String? contactType,
    $core.String? message,
    $core.String? status,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (contactID != null) {
      $result.contactID = contactID;
    }
    if (contactType != null) {
      $result.contactType = contactType;
    }
    if (message != null) {
      $result.message = message;
    }
    if (status != null) {
      $result.status = status;
    }
    return $result;
  }
  UpdateContactRequest._() : super();
  factory UpdateContactRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateContactRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateContactRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'ContactID', $pb.PbFieldType.O3, protoName: 'ContactID')
    ..aOS(3, _omitFieldNames ? '' : 'ContactType', protoName: 'ContactType')
    ..aOS(4, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..aOS(5, _omitFieldNames ? '' : 'status')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateContactRequest clone() => UpdateContactRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateContactRequest copyWith(void Function(UpdateContactRequest) updates) => super.copyWith((message) => updates(message as UpdateContactRequest)) as UpdateContactRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateContactRequest create() => UpdateContactRequest._();
  UpdateContactRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateContactRequest> createRepeated() => $pb.PbList<UpdateContactRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateContactRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateContactRequest>(create);
  static UpdateContactRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get contactID => $_getIZ(1);
  @$pb.TagNumber(2)
  set contactID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContactID() => $_has(1);
  @$pb.TagNumber(2)
  void clearContactID() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get contactType => $_getSZ(2);
  @$pb.TagNumber(3)
  set contactType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasContactType() => $_has(2);
  @$pb.TagNumber(3)
  void clearContactType() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get status => $_getSZ(4);
  @$pb.TagNumber(5)
  set status($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => clearField(5);
}

class UpdateContactResponse extends $pb.GeneratedMessage {
  factory UpdateContactResponse({
    $24.Contact? c,
  }) {
    final $result = create();
    if (c != null) {
      $result.c = c;
    }
    return $result;
  }
  UpdateContactResponse._() : super();
  factory UpdateContactResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateContactResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateContactResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$24.Contact>(1, _omitFieldNames ? '' : 'c', subBuilder: $24.Contact.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateContactResponse clone() => UpdateContactResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateContactResponse copyWith(void Function(UpdateContactResponse) updates) => super.copyWith((message) => updates(message as UpdateContactResponse)) as UpdateContactResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateContactResponse create() => UpdateContactResponse._();
  UpdateContactResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateContactResponse> createRepeated() => $pb.PbList<UpdateContactResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateContactResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateContactResponse>(create);
  static UpdateContactResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $24.Contact get c => $_getN(0);
  @$pb.TagNumber(1)
  set c($24.Contact v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasC() => $_has(0);
  @$pb.TagNumber(1)
  void clearC() => clearField(1);
  @$pb.TagNumber(1)
  $24.Contact ensureC() => $_ensure(0);
}

/// Delete
class DeleteContactRequest extends $pb.GeneratedMessage {
  factory DeleteContactRequest({
    $core.String? sessionID,
    $core.int? contactID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (contactID != null) {
      $result.contactID = contactID;
    }
    return $result;
  }
  DeleteContactRequest._() : super();
  factory DeleteContactRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteContactRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteContactRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'ContactID', $pb.PbFieldType.O3, protoName: 'ContactID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteContactRequest clone() => DeleteContactRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteContactRequest copyWith(void Function(DeleteContactRequest) updates) => super.copyWith((message) => updates(message as DeleteContactRequest)) as DeleteContactRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteContactRequest create() => DeleteContactRequest._();
  DeleteContactRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteContactRequest> createRepeated() => $pb.PbList<DeleteContactRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteContactRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteContactRequest>(create);
  static DeleteContactRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get contactID => $_getIZ(1);
  @$pb.TagNumber(2)
  set contactID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasContactID() => $_has(1);
  @$pb.TagNumber(2)
  void clearContactID() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
