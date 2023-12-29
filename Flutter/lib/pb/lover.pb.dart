//
//  Generated code. Do not modify.
//  source: lover.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $14;

class Lover extends $pb.GeneratedMessage {
  factory Lover({
    $core.int? userID,
    $core.int? minAge,
    $core.int? maxAge,
    $core.String? city,
    $core.String? gender,
    $core.String? constellation,
    $core.String? sexual,
    $core.int? height,
    $core.int? weight,
    $core.String? speaklanguage,
    $core.String? job,
    $core.int? annualSalary,
    $core.String? sociability,
    $core.String? religious,
    $core.bool? certification,
    $14.Timestamp? infoChangedAt,
  }) {
    final $result = create();
    if (userID != null) {
      $result.userID = userID;
    }
    if (minAge != null) {
      $result.minAge = minAge;
    }
    if (maxAge != null) {
      $result.maxAge = maxAge;
    }
    if (city != null) {
      $result.city = city;
    }
    if (gender != null) {
      $result.gender = gender;
    }
    if (constellation != null) {
      $result.constellation = constellation;
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
      $result.speaklanguage = speaklanguage;
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
    if (religious != null) {
      $result.religious = religious;
    }
    if (certification != null) {
      $result.certification = certification;
    }
    if (infoChangedAt != null) {
      $result.infoChangedAt = infoChangedAt;
    }
    return $result;
  }
  Lover._() : super();
  factory Lover.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Lover.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Lover', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'MinAge', $pb.PbFieldType.O3, protoName: 'MinAge')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'MaxAge', $pb.PbFieldType.O3, protoName: 'MaxAge')
    ..aOS(4, _omitFieldNames ? '' : 'City', protoName: 'City')
    ..aOS(5, _omitFieldNames ? '' : 'Gender', protoName: 'Gender')
    ..aOS(6, _omitFieldNames ? '' : 'Constellation', protoName: 'Constellation')
    ..aOS(7, _omitFieldNames ? '' : 'Sexual', protoName: 'Sexual')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'Height', $pb.PbFieldType.O3, protoName: 'Height')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'Weight', $pb.PbFieldType.O3, protoName: 'Weight')
    ..aOS(10, _omitFieldNames ? '' : 'Speaklanguage', protoName: 'Speaklanguage')
    ..aOS(11, _omitFieldNames ? '' : 'Job', protoName: 'Job')
    ..a<$core.int>(12, _omitFieldNames ? '' : 'AnnualSalary', $pb.PbFieldType.O3, protoName: 'AnnualSalary')
    ..aOS(13, _omitFieldNames ? '' : 'Sociability', protoName: 'Sociability')
    ..aOS(14, _omitFieldNames ? '' : 'Religious', protoName: 'Religious')
    ..aOB(15, _omitFieldNames ? '' : 'Certification', protoName: 'Certification')
    ..aOM<$14.Timestamp>(16, _omitFieldNames ? '' : 'InfoChangedAt', protoName: 'InfoChangedAt', subBuilder: $14.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Lover clone() => Lover()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Lover copyWith(void Function(Lover) updates) => super.copyWith((message) => updates(message as Lover)) as Lover;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Lover create() => Lover._();
  Lover createEmptyInstance() => create();
  static $pb.PbList<Lover> createRepeated() => $pb.PbList<Lover>();
  @$core.pragma('dart2js:noInline')
  static Lover getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Lover>(create);
  static Lover? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get userID => $_getIZ(0);
  @$pb.TagNumber(1)
  set userID($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserID() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get minAge => $_getIZ(1);
  @$pb.TagNumber(2)
  set minAge($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasMinAge() => $_has(1);
  @$pb.TagNumber(2)
  void clearMinAge() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get maxAge => $_getIZ(2);
  @$pb.TagNumber(3)
  set maxAge($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMaxAge() => $_has(2);
  @$pb.TagNumber(3)
  void clearMaxAge() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get city => $_getSZ(3);
  @$pb.TagNumber(4)
  set city($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCity() => $_has(3);
  @$pb.TagNumber(4)
  void clearCity() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get gender => $_getSZ(4);
  @$pb.TagNumber(5)
  set gender($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGender() => $_has(4);
  @$pb.TagNumber(5)
  void clearGender() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get constellation => $_getSZ(5);
  @$pb.TagNumber(6)
  set constellation($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasConstellation() => $_has(5);
  @$pb.TagNumber(6)
  void clearConstellation() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get sexual => $_getSZ(6);
  @$pb.TagNumber(7)
  set sexual($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasSexual() => $_has(6);
  @$pb.TagNumber(7)
  void clearSexual() => clearField(7);

  @$pb.TagNumber(8)
  $core.int get height => $_getIZ(7);
  @$pb.TagNumber(8)
  set height($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasHeight() => $_has(7);
  @$pb.TagNumber(8)
  void clearHeight() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get weight => $_getIZ(8);
  @$pb.TagNumber(9)
  set weight($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasWeight() => $_has(8);
  @$pb.TagNumber(9)
  void clearWeight() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get speaklanguage => $_getSZ(9);
  @$pb.TagNumber(10)
  set speaklanguage($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasSpeaklanguage() => $_has(9);
  @$pb.TagNumber(10)
  void clearSpeaklanguage() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get job => $_getSZ(10);
  @$pb.TagNumber(11)
  set job($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasJob() => $_has(10);
  @$pb.TagNumber(11)
  void clearJob() => clearField(11);

  @$pb.TagNumber(12)
  $core.int get annualSalary => $_getIZ(11);
  @$pb.TagNumber(12)
  set annualSalary($core.int v) { $_setSignedInt32(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasAnnualSalary() => $_has(11);
  @$pb.TagNumber(12)
  void clearAnnualSalary() => clearField(12);

  @$pb.TagNumber(13)
  $core.String get sociability => $_getSZ(12);
  @$pb.TagNumber(13)
  set sociability($core.String v) { $_setString(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasSociability() => $_has(12);
  @$pb.TagNumber(13)
  void clearSociability() => clearField(13);

  @$pb.TagNumber(14)
  $core.String get religious => $_getSZ(13);
  @$pb.TagNumber(14)
  set religious($core.String v) { $_setString(13, v); }
  @$pb.TagNumber(14)
  $core.bool hasReligious() => $_has(13);
  @$pb.TagNumber(14)
  void clearReligious() => clearField(14);

  @$pb.TagNumber(15)
  $core.bool get certification => $_getBF(14);
  @$pb.TagNumber(15)
  set certification($core.bool v) { $_setBool(14, v); }
  @$pb.TagNumber(15)
  $core.bool hasCertification() => $_has(14);
  @$pb.TagNumber(15)
  void clearCertification() => clearField(15);

  @$pb.TagNumber(16)
  $14.Timestamp get infoChangedAt => $_getN(15);
  @$pb.TagNumber(16)
  set infoChangedAt($14.Timestamp v) { setField(16, v); }
  @$pb.TagNumber(16)
  $core.bool hasInfoChangedAt() => $_has(15);
  @$pb.TagNumber(16)
  void clearInfoChangedAt() => clearField(16);
  @$pb.TagNumber(16)
  $14.Timestamp ensureInfoChangedAt() => $_ensure(15);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
