//
//  Generated code. Do not modify.
//  source: payment.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use paymentDescriptor instead')
const Payment$json = {
  '1': 'Payment',
  '2': [
    {'1': 'PayID', '3': 1, '4': 1, '5': 9, '10': 'PayID'},
    {'1': 'FullName', '3': 2, '4': 1, '5': 9, '10': 'FullName'},
    {'1': 'PaymentType', '3': 3, '4': 1, '5': 9, '10': 'PaymentType'},
    {'1': 'Amount', '3': 4, '4': 1, '5': 5, '10': 'Amount'},
    {'1': 'Product', '3': 5, '4': 1, '5': 9, '10': 'Product'},
    {'1': 'PayAt', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'PayAt'},
  ],
};

/// Descriptor for `Payment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentDescriptor = $convert.base64Decode(
    'CgdQYXltZW50EhQKBVBheUlEGAEgASgJUgVQYXlJRBIaCghGdWxsTmFtZRgCIAEoCVIIRnVsbE'
    '5hbWUSIAoLUGF5bWVudFR5cGUYAyABKAlSC1BheW1lbnRUeXBlEhYKBkFtb3VudBgEIAEoBVIG'
    'QW1vdW50EhgKB1Byb2R1Y3QYBSABKAlSB1Byb2R1Y3QSMAoFUGF5QXQYBiABKAsyGi5nb29nbG'
    'UucHJvdG9idWYuVGltZXN0YW1wUgVQYXlBdA==');

