//
//  Generated code. Do not modify.
//  source: rpc_payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createPaymentRequestDescriptor instead')
const CreatePaymentRequest$json = {
  '1': 'CreatePaymentRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'PaymentType', '3': 2, '4': 1, '5': 9, '10': 'PaymentType'},
    {'1': 'Amount', '3': 3, '4': 1, '5': 5, '10': 'Amount'},
    {'1': 'Product', '3': 4, '4': 1, '5': 9, '10': 'Product'},
  ],
};

/// Descriptor for `CreatePaymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPaymentRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVQYXltZW50UmVxdWVzdBIcCglTZXNzaW9uSUQYASABKAlSCVNlc3Npb25JRBIgCg'
    'tQYXltZW50VHlwZRgCIAEoCVILUGF5bWVudFR5cGUSFgoGQW1vdW50GAMgASgFUgZBbW91bnQS'
    'GAoHUHJvZHVjdBgEIAEoCVIHUHJvZHVjdA==');

@$core.Deprecated('Use createPaymentResponseDescriptor instead')
const CreatePaymentResponse$json = {
  '1': 'CreatePaymentResponse',
  '2': [
    {'1': 'payment', '3': 1, '4': 1, '5': 11, '6': '.pb.Payment', '10': 'payment'},
  ],
};

/// Descriptor for `CreatePaymentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPaymentResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVQYXltZW50UmVzcG9uc2USJQoHcGF5bWVudBgBIAEoCzILLnBiLlBheW1lbnRSB3'
    'BheW1lbnQ=');

@$core.Deprecated('Use getPaymentRequestDescriptor instead')
const GetPaymentRequest$json = {
  '1': 'GetPaymentRequest',
  '2': [
    {'1': 'PayID', '3': 1, '4': 1, '5': 9, '10': 'PayID'},
  ],
};

/// Descriptor for `GetPaymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPaymentRequestDescriptor = $convert.base64Decode(
    'ChFHZXRQYXltZW50UmVxdWVzdBIUCgVQYXlJRBgBIAEoCVIFUGF5SUQ=');

@$core.Deprecated('Use getPaymentResponseDescriptor instead')
const GetPaymentResponse$json = {
  '1': 'GetPaymentResponse',
  '2': [
    {'1': 'payment', '3': 1, '4': 1, '5': 11, '6': '.pb.Payment', '10': 'payment'},
  ],
};

/// Descriptor for `GetPaymentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPaymentResponseDescriptor = $convert.base64Decode(
    'ChJHZXRQYXltZW50UmVzcG9uc2USJQoHcGF5bWVudBgBIAEoCzILLnBiLlBheW1lbnRSB3BheW'
    '1lbnQ=');

