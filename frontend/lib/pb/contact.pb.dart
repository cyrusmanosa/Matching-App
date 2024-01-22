//
//  Generated code. Do not modify.
//  source: contact.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $18;

class Contact extends $pb.GeneratedMessage {
  factory Contact({
    $core.int? contactID,
    $core.int? userID,
    $core.String? contactType,
    $core.String? message,
    $core.String? status,
    $18.Timestamp? contactAt,
  }) {
    final $result = create();
    if (contactID != null) {
      $result.contactID = contactID;
    }
    if (userID != null) {
      $result.userID = userID;
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
    if (contactAt != null) {
      $result.contactAt = contactAt;
    }
    return $result;
  }
  Contact._() : super();
  factory Contact.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Contact.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Contact', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'ContactID', $pb.PbFieldType.O3, protoName: 'ContactID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..aOS(3, _omitFieldNames ? '' : 'ContactType', protoName: 'ContactType')
    ..aOS(4, _omitFieldNames ? '' : 'Message', protoName: 'Message')
    ..aOS(5, _omitFieldNames ? '' : 'Status', protoName: 'Status')
    ..aOM<$18.Timestamp>(6, _omitFieldNames ? '' : 'ContactAt', protoName: 'ContactAt', subBuilder: $18.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Contact clone() => Contact()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Contact copyWith(void Function(Contact) updates) => super.copyWith((message) => updates(message as Contact)) as Contact;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Contact create() => Contact._();
  Contact createEmptyInstance() => create();
  static $pb.PbList<Contact> createRepeated() => $pb.PbList<Contact>();
  @$core.pragma('dart2js:noInline')
  static Contact getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Contact>(create);
  static Contact? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get contactID => $_getIZ(0);
  @$pb.TagNumber(1)
  set contactID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasContactID() => $_has(0);
  @$pb.TagNumber(1)
  void clearContactID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userID => $_getIZ(1);
  @$pb.TagNumber(2)
  set userID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserID() => clearField(2);

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

  @$pb.TagNumber(6)
  $18.Timestamp get contactAt => $_getN(5);
  @$pb.TagNumber(6)
  set contactAt($18.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasContactAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearContactAt() => clearField(6);
  @$pb.TagNumber(6)
  $18.Timestamp ensureContactAt() => $_ensure(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
