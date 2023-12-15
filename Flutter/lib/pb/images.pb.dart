//
//  Generated code. Do not modify.
//  source: images.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Images extends $pb.GeneratedMessage {
  factory Images({
    $core.int? userID,
    $core.String? qr,
    $core.String? img1,
    $core.String? img2,
    $core.String? img3,
    $core.String? img4,
    $core.String? img5,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (qr != null) {
      $result.qr = qr;
    }
    if (img1 != null) {
      $result.img1 = img1;
    }
    if (img2 != null) {
      $result.img2 = img2;
    }
    if (img3 != null) {
      $result.img3 = img3;
    }
    if (img4 != null) {
      $result.img4 = img4;
    }
    if (img5 != null) {
      $result.img5 = img5;
    }
    return $result;
  }
  Images._() : super();
  factory Images.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Images.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Images', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..aOS(2, _omitFieldNames ? '' : 'Qr', protoName: 'Qr')
    ..aOS(3, _omitFieldNames ? '' : 'Img1', protoName: 'Img1')
    ..aOS(4, _omitFieldNames ? '' : 'Img2', protoName: 'Img2')
    ..aOS(5, _omitFieldNames ? '' : 'Img3', protoName: 'Img3')
    ..aOS(6, _omitFieldNames ? '' : 'Img4', protoName: 'Img4')
    ..aOS(7, _omitFieldNames ? '' : 'Img5', protoName: 'Img5')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Images clone() => Images()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Images copyWith(void Function(Images) updates) => super.copyWith((message) => updates(message as Images)) as Images;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Images create() => Images._();
  Images createEmptyInstance() => create();
  static $pb.PbList<Images> createRepeated() => $pb.PbList<Images>();
  @$core.pragma('dart2js:noInline')
  static Images getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Images>(create);
  static Images? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get qr => $_getSZ(1);
  @$pb.TagNumber(2)
  set qr($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasQr() => $_has(1);
  @$pb.TagNumber(2)
  void clearQr() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get img1 => $_getSZ(2);
  @$pb.TagNumber(3)
  set img1($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImg1() => $_has(2);
  @$pb.TagNumber(3)
  void clearImg1() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get img2 => $_getSZ(3);
  @$pb.TagNumber(4)
  set img2($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasImg2() => $_has(3);
  @$pb.TagNumber(4)
  void clearImg2() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get img3 => $_getSZ(4);
  @$pb.TagNumber(5)
  set img3($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasImg3() => $_has(4);
  @$pb.TagNumber(5)
  void clearImg3() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get img4 => $_getSZ(5);
  @$pb.TagNumber(6)
  set img4($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasImg4() => $_has(5);
  @$pb.TagNumber(6)
  void clearImg4() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get img5 => $_getSZ(6);
  @$pb.TagNumber(7)
  set img5($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasImg5() => $_has(6);
  @$pb.TagNumber(7)
  void clearImg5() => clearField(7);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
