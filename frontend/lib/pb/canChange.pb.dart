//
//  Generated code. Do not modify.
//  source: canChange.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $19;

class CanChange extends $pb.GeneratedMessage {
  factory CanChange({
    $core.int? userID,
    $core.String? nickName,
    $core.String? city,
    $core.String? sexual,
    $core.int? height,
    $core.int? weight,
    $core.Iterable<$core.String>? speaklanguage,
    $core.String? education,
    $core.String? job,
    $core.int? annualSalary,
    $core.String? sociability,
    $core.String? hobbyType,
    $core.int? experience,
    $core.String? accompanyType,
    $core.String? religious,
    $core.String? introduce,
    $19.Timestamp? infoChangedAt,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (nickName != null) {
      $result.nickName = nickName;
    }
    if (city != null) {
      $result.city = city;
    }
    if (sexual != null) {
      $result.sexual = sexual;
    }
    if (height != null) {
      $result.height = height;
    }
    if (weight != null) {
      $result.weight = weight;
    }
    if (speaklanguage != null) {
      $result.speaklanguage.addAll(speaklanguage);
    }
    if (education != null) {
      $result.education = education;
    }
    if (job != null) {
      $result.job = job;
    }
    if (annualSalary != null) {
      $result.annualSalary = annualSalary;
    }
    if (sociability != null) {
      $result.sociability = sociability;
    }
    if (hobbyType != null) {
      $result.hobbyType = hobbyType;
    }
    if (experience != null) {
      $result.experience = experience;
    }
    if (accompanyType != null) {
      $result.accompanyType = accompanyType;
    }
    if (religious != null) {
      $result.religious = religious;
    }
    if (introduce != null) {
      $result.introduce = introduce;
    }
    if (infoChangedAt != null) {
      $result.infoChangedAt = infoChangedAt;
    }
    return $result;
  }
  CanChange._() : super();
  factory CanChange.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CanChange.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CanChange', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..aOS(2, _omitFieldNames ? '' : 'NickName', protoName: 'NickName')
    ..aOS(3, _omitFieldNames ? '' : 'City', protoName: 'City')
    ..aOS(4, _omitFieldNames ? '' : 'Sexual', protoName: 'Sexual')
    ..a<$core.int>(5, _omitFieldNames ? '' : 'Height', $pb.PbFieldType.O3, protoName: 'Height')
    ..a<$core.int>(6, _omitFieldNames ? '' : 'Weight', $pb.PbFieldType.O3, protoName: 'Weight')
    ..pPS(7, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(8, _omitFieldNames ? '' : 'Education', protoName: 'Education')
    ..aOS(9, _omitFieldNames ? '' : 'Job', protoName: 'Job')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'AnnualSalary', $pb.PbFieldType.O3, protoName: 'AnnualSalary')
    ..aOS(11, _omitFieldNames ? '' : 'Sociability', protoName: 'Sociability')
    ..aOS(12, _omitFieldNames ? '' : 'hobbyType', protoName: 'hobbyType')
    ..a<$core.int>(13, _omitFieldNames ? '' : 'Experience', $pb.PbFieldType.O3, protoName: 'Experience')
    ..aOS(14, _omitFieldNames ? '' : 'AccompanyType', protoName: 'AccompanyType')
    ..aOS(15, _omitFieldNames ? '' : 'Religious', protoName: 'Religious')
    ..aOS(16, _omitFieldNames ? '' : 'Introduce', protoName: 'Introduce')
    ..aOM<$19.Timestamp>(17, _omitFieldNames ? '' : 'InfoChangedAt', protoName: 'InfoChangedAt', subBuilder: $19.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CanChange clone() => CanChange()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CanChange copyWith(void Function(CanChange) updates) => super.copyWith((message) => updates(message as CanChange)) as CanChange;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CanChange create() => CanChange._();
  CanChange createEmptyInstance() => create();
  static $pb.PbList<CanChange> createRepeated() => $pb.PbList<CanChange>();
  @$core.pragma('dart2js:noInline')
  static CanChange getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CanChange>(create);
  static CanChange? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get nickName => $_getSZ(1);
  @$pb.TagNumber(2)
  set nickName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasNickName() => $_has(1);
  @$pb.TagNumber(2)
  void clearNickName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get city => $_getSZ(2);
  @$pb.TagNumber(3)
  set city($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasCity() => $_has(2);
  @$pb.TagNumber(3)
  void clearCity() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get sexual => $_getSZ(3);
  @$pb.TagNumber(4)
  set sexual($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSexual() => $_has(3);
  @$pb.TagNumber(4)
  void clearSexual() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get height => $_getIZ(4);
  @$pb.TagNumber(5)
  set height($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasHeight() => $_has(4);
  @$pb.TagNumber(5)
  void clearHeight() => clearField(5);

  @$pb.TagNumber(6)
  $core.int get weight => $_getIZ(5);
  @$pb.TagNumber(6)
  set weight($core.int v) { $_setSignedInt32(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasWeight() => $_has(5);
  @$pb.TagNumber(6)
  void clearWeight() => clearField(6);

  @$pb.TagNumber(7)
  $core.List<$core.String> get speaklanguage => $_getList(6);

  @$pb.TagNumber(8)
  $core.String get education => $_getSZ(7);
  @$pb.TagNumber(8)
  set education($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasEducation() => $_has(7);
  @$pb.TagNumber(8)
  void clearEducation() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get job => $_getSZ(8);
  @$pb.TagNumber(9)
  set job($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasJob() => $_has(8);
  @$pb.TagNumber(9)
  void clearJob() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get annualSalary => $_getIZ(9);
  @$pb.TagNumber(10)
  set annualSalary($core.int v) { $_setSignedInt32(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasAnnualSalary() => $_has(9);
  @$pb.TagNumber(10)
  void clearAnnualSalary() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get sociability => $_getSZ(10);
  @$pb.TagNumber(11)
  set sociability($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasSociability() => $_has(10);
  @$pb.TagNumber(11)
  void clearSociability() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get hobbyType => $_getSZ(11);
  @$pb.TagNumber(12)
  set hobbyType($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasHobbyType() => $_has(11);
  @$pb.TagNumber(12)
  void clearHobbyType() => clearField(12);

  @$pb.TagNumber(13)
  $core.int get experience => $_getIZ(12);
  @$pb.TagNumber(13)
  set experience($core.int v) { $_setSignedInt32(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasExperience() => $_has(12);
  @$pb.TagNumber(13)
  void clearExperience() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get accompanyType => $_getSZ(13);
  @$pb.TagNumber(14)
  set accompanyType($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasAccompanyType() => $_has(13);
  @$pb.TagNumber(14)
  void clearAccompanyType() => clearField(14);

  @$pb.TagNumber(15)
  $core.String get religious => $_getSZ(14);
  @$pb.TagNumber(15)
  set religious($core.String v) { $_setString(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasReligious() => $_has(14);
  @$pb.TagNumber(15)
  void clearReligious() => clearField(15);

  @$pb.TagNumber(16)
  $core.String get introduce => $_getSZ(15);
  @$pb.TagNumber(16)
  set introduce($core.String v) { $_setString(15, v); }
  @$pb.TagNumber(16)
  $core.bool hasIntroduce() => $_has(15);
  @$pb.TagNumber(16)
  void clearIntroduce() => clearField(16);

  @$pb.TagNumber(17)
  $19.Timestamp get infoChangedAt => $_getN(16);
  @$pb.TagNumber(17)
  set infoChangedAt($19.Timestamp v) { setField(17, v); }
  @$pb.TagNumber(17)
  $core.bool hasInfoChangedAt() => $_has(16);
  @$pb.TagNumber(17)
  void clearInfoChangedAt() => clearField(17);
  @$pb.TagNumber(17)
  $19.Timestamp ensureInfoChangedAt() => $_ensure(16);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
