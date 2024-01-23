//
//  Generated code. Do not modify.
//  source: socialmedia.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SocialMedia extends $pb.GeneratedMessage {
  factory SocialMedia({
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
  SocialMedia._() : super();
  factory SocialMedia.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SocialMedia.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SocialMedia', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
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
  SocialMedia clone() => SocialMedia()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SocialMedia copyWith(void Function(SocialMedia) updates) => super.copyWith((message) => updates(message as SocialMedia)) as SocialMedia;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SocialMedia create() => SocialMedia._();
  SocialMedia createEmptyInstance() => create();
  static $pb.PbList<SocialMedia> createRepeated() => $pb.PbList<SocialMedia>();
  @$core.pragma('dart2js:noInline')
  static SocialMedia getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SocialMedia>(create);
  static SocialMedia? _defaultInstance;

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


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
