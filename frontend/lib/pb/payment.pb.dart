//
//  Generated code. Do not modify.
//  source: payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'google/protobuf/timestamp.pb.dart' as $18;

class Payment extends $pb.GeneratedMessage {
  factory Payment({
    $core.String? payID,
    $core.String? fullName,
    $core.String? paymentType,
    $core.int? amount,
    $core.String? product,
    $18.Timestamp? payAt,
  }) {
    final $result = create();
    if (payID != null) {
      $result.payID = payID;
    }
    if (fullName != null) {
      $result.fullName = fullName;
    }
    if (paymentType != null) {
      $result.paymentType = paymentType;
    }
    if (amount != null) {
      $result.amount = amount;
    }
    if (product != null) {
      $result.product = product;
    }
    if (payAt != null) {
      $result.payAt = payAt;
    }
    return $result;
  }
  Payment._() : super();
  factory Payment.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Payment.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Payment', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'PayID', protoName: 'PayID')
    ..aOS(2, _omitFieldNames ? '' : 'FullName', protoName: 'FullName')
    ..aOS(3, _omitFieldNames ? '' : 'PaymentType', protoName: 'PaymentType')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'Amount', $pb.PbFieldType.O3, protoName: 'Amount')
    ..aOS(5, _omitFieldNames ? '' : 'Product', protoName: 'Product')
    ..aOM<$18.Timestamp>(6, _omitFieldNames ? '' : 'PayAt', protoName: 'PayAt', subBuilder: $18.Timestamp.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Payment clone() => Payment()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Payment copyWith(void Function(Payment) updates) => super.copyWith((message) => updates(message as Payment)) as Payment;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Payment create() => Payment._();
  Payment createEmptyInstance() => create();
  static $pb.PbList<Payment> createRepeated() => $pb.PbList<Payment>();
  @$core.pragma('dart2js:noInline')
  static Payment getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Payment>(create);
  static Payment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get payID => $_getSZ(0);
  @$pb.TagNumber(1)
  set payID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPayID() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get fullName => $_getSZ(1);
  @$pb.TagNumber(2)
  set fullName($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasFullName() => $_has(1);
  @$pb.TagNumber(2)
  void clearFullName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get paymentType => $_getSZ(2);
  @$pb.TagNumber(3)
  set paymentType($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPaymentType() => $_has(2);
  @$pb.TagNumber(3)
  void clearPaymentType() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get amount => $_getIZ(3);
  @$pb.TagNumber(4)
  set amount($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get product => $_getSZ(4);
  @$pb.TagNumber(5)
  set product($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasProduct() => $_has(4);
  @$pb.TagNumber(5)
  void clearProduct() => clearField(5);

  @$pb.TagNumber(6)
  $18.Timestamp get payAt => $_getN(5);
  @$pb.TagNumber(6)
  set payAt($18.Timestamp v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasPayAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearPayAt() => clearField(6);
  @$pb.TagNumber(6)
  $18.Timestamp ensurePayAt() => $_ensure(5);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
