//
//  Generated code. Do not modify.
//  source: rpc_payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'payment.pb.dart' as $23;

class CreatePaymentRequest extends $pb.GeneratedMessage {
  factory CreatePaymentRequest({
    $core.String? sessionID,
    $core.String? paymentType,
    $core.int? amount,
    $core.String? product,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
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
    return $result;
  }
  CreatePaymentRequest._() : super();
  factory CreatePaymentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePaymentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePaymentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..aOS(2, _omitFieldNames ? '' : 'PaymentType', protoName: 'PaymentType')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'Amount', $pb.PbFieldType.O3, protoName: 'Amount')
    ..aOS(4, _omitFieldNames ? '' : 'Product', protoName: 'Product')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePaymentRequest clone() => CreatePaymentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePaymentRequest copyWith(void Function(CreatePaymentRequest) updates) => super.copyWith((message) => updates(message as CreatePaymentRequest)) as CreatePaymentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePaymentRequest create() => CreatePaymentRequest._();
  CreatePaymentRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePaymentRequest> createRepeated() => $pb.PbList<CreatePaymentRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePaymentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePaymentRequest>(create);
  static CreatePaymentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get paymentType => $_getSZ(1);
  @$pb.TagNumber(2)
  set paymentType($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPaymentType() => $_has(1);
  @$pb.TagNumber(2)
  void clearPaymentType() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get amount => $_getIZ(2);
  @$pb.TagNumber(3)
  set amount($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get product => $_getSZ(3);
  @$pb.TagNumber(4)
  set product($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasProduct() => $_has(3);
  @$pb.TagNumber(4)
  void clearProduct() => clearField(4);
}

class CreatePaymentResponse extends $pb.GeneratedMessage {
  factory CreatePaymentResponse({
    $23.Payment? payment,
  }) {
    final $result = create();
    if (payment != null) {
      $result.payment = payment;
    }
    return $result;
  }
  CreatePaymentResponse._() : super();
  factory CreatePaymentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePaymentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePaymentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$23.Payment>(1, _omitFieldNames ? '' : 'payment', subBuilder: $23.Payment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePaymentResponse clone() => CreatePaymentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePaymentResponse copyWith(void Function(CreatePaymentResponse) updates) => super.copyWith((message) => updates(message as CreatePaymentResponse)) as CreatePaymentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePaymentResponse create() => CreatePaymentResponse._();
  CreatePaymentResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePaymentResponse> createRepeated() => $pb.PbList<CreatePaymentResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePaymentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePaymentResponse>(create);
  static CreatePaymentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $23.Payment get payment => $_getN(0);
  @$pb.TagNumber(1)
  set payment($23.Payment v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPayment() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayment() => clearField(1);
  @$pb.TagNumber(1)
  $23.Payment ensurePayment() => $_ensure(0);
}

class GetPaymentRequest extends $pb.GeneratedMessage {
  factory GetPaymentRequest({
    $core.String? payID,
  }) {
    final $result = create();
    if (payID != null) {
      $result.payID = payID;
    }
    return $result;
  }
  GetPaymentRequest._() : super();
  factory GetPaymentRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPaymentRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPaymentRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'PayID', protoName: 'PayID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPaymentRequest clone() => GetPaymentRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPaymentRequest copyWith(void Function(GetPaymentRequest) updates) => super.copyWith((message) => updates(message as GetPaymentRequest)) as GetPaymentRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPaymentRequest create() => GetPaymentRequest._();
  GetPaymentRequest createEmptyInstance() => create();
  static $pb.PbList<GetPaymentRequest> createRepeated() => $pb.PbList<GetPaymentRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPaymentRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPaymentRequest>(create);
  static GetPaymentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get payID => $_getSZ(0);
  @$pb.TagNumber(1)
  set payID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPayID() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayID() => clearField(1);
}

class GetPaymentResponse extends $pb.GeneratedMessage {
  factory GetPaymentResponse({
    $23.Payment? payment,
  }) {
    final $result = create();
    if (payment != null) {
      $result.payment = payment;
    }
    return $result;
  }
  GetPaymentResponse._() : super();
  factory GetPaymentResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPaymentResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPaymentResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$23.Payment>(1, _omitFieldNames ? '' : 'payment', subBuilder: $23.Payment.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPaymentResponse clone() => GetPaymentResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPaymentResponse copyWith(void Function(GetPaymentResponse) updates) => super.copyWith((message) => updates(message as GetPaymentResponse)) as GetPaymentResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPaymentResponse create() => GetPaymentResponse._();
  GetPaymentResponse createEmptyInstance() => create();
  static $pb.PbList<GetPaymentResponse> createRepeated() => $pb.PbList<GetPaymentResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPaymentResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPaymentResponse>(create);
  static GetPaymentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $23.Payment get payment => $_getN(0);
  @$pb.TagNumber(1)
  set payment($23.Payment v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPayment() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayment() => clearField(1);
  @$pb.TagNumber(1)
  $23.Payment ensurePayment() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
