//
//  Generated code. Do not modify.
//  source: fix.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $16;

class Fix extends $pb.GeneratedMessage {
  factory Fix({
    $core.String? firstName,
    $core.String? lastName,
    $core.String? birth,
    $core.String? country,
    $core.String? gender,
    $core.String? blood,
    $core.int? age,
    $core.String? constellation,
    $core.bool? certification,
    $16.Timestamp? createAt,
  }) {
    final $result = create();
    if (firstName != null) {
      $result.firstName = firstName;
    }
    if (lastName != null) {
      $result.lastName = lastName;
    }
    if (birth != null) {
      $result.birth = birth;
    }
    if (country != null) {
      $result.country = country;
    }
    if (gender != null) {
      $result.gender = gender;
    }
    if (blood != null) {
      $result.blood = blood;
    }
    if (age != null) {
      $result.age = age;
    }
    if (constellation != null) {
      $result.constellation = constellation;
    }
    if (certification != null) {
      $result.certification = certification;
    }
    if (createAt != null) {
      $result.createAt = createAt;
    }
    return $result;
  }
  Fix._() : super();
  factory Fix.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Fix.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Fix', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'FirstName', protoName: 'FirstName')
    ..aOS(2, _omitFieldNames ? '' : 'LastName', protoName: 'LastName')
    ..aOS(3, _omitFieldNames ? '' : 'Birth', protoName: 'Birth')
    ..aOS(4, _omitFieldNames ? '' : 'Country', protoName: 'Country')
    ..aOS(5, _omitFieldNames ? '' : 'Gender', protoName: 'Gender')
    ..aOS(6, _omitFieldNames ? '' : 'Blood', protoName: 'Blood')
    ..a<$core.int>(7, _omitFieldNames ? '' : 'age', $pb.PbFieldType.O3)
    ..aOS(8, _omitFieldNames ? '' : 'constellation')
    ..aOB(9, _omitFieldNames ? '' : 'certification')
    ..aOM<$16.Timestamp>(10, _omitFieldNames ? '' : 'CreateAt', protoName: 'CreateAt', subBuilder: $16.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Fix clone() => Fix()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Fix copyWith(void Function(Fix) updates) => super.copyWith((message) => updates(message as Fix)) as Fix;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Fix create() => Fix._();
  Fix createEmptyInstance() => create();
  static $pb.PbList<Fix> createRepeated() => $pb.PbList<Fix>();
  @$core.pragma('dart2js:noInline')
  static Fix getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Fix>(create);
  static Fix? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get firstName => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstName($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasFirstName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstName() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get lastName => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLastName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get birth => $_getSZ(2);
  @$pb.TagNumber(3)
  set birth($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasBirth() => $_has(2);
  @$pb.TagNumber(3)
  void clearBirth() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get country => $_getSZ(3);
  @$pb.TagNumber(4)
  set country($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasCountry() => $_has(3);
  @$pb.TagNumber(4)
  void clearCountry() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get gender => $_getSZ(4);
  @$pb.TagNumber(5)
  set gender($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasGender() => $_has(4);
  @$pb.TagNumber(5)
  void clearGender() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get blood => $_getSZ(5);
  @$pb.TagNumber(6)
  set blood($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBlood() => $_has(5);
  @$pb.TagNumber(6)
  void clearBlood() => clearField(6);

  @$pb.TagNumber(7)
  $core.int get age => $_getIZ(6);
  @$pb.TagNumber(7)
  set age($core.int v) { $_setSignedInt32(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasAge() => $_has(6);
  @$pb.TagNumber(7)
  void clearAge() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get constellation => $_getSZ(7);
  @$pb.TagNumber(8)
  set constellation($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasConstellation() => $_has(7);
  @$pb.TagNumber(8)
  void clearConstellation() => clearField(8);

  @$pb.TagNumber(9)
  $core.bool get certification => $_getBF(8);
  @$pb.TagNumber(9)
  set certification($core.bool v) { $_setBool(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasCertification() => $_has(8);
  @$pb.TagNumber(9)
  void clearCertification() => clearField(9);

  @$pb.TagNumber(10)
  $16.Timestamp get createAt => $_getN(9);
  @$pb.TagNumber(10)
  set createAt($16.Timestamp v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasCreateAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreateAt() => clearField(10);
  @$pb.TagNumber(10)
  $16.Timestamp ensureCreateAt() => $_ensure(9);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
