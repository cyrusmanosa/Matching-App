//
//  Generated code. Do not modify.
//  source: rpc_ResetPasswordEmail.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use resetPwEmailRequestDescriptor instead')
const ResetPwEmailRequest$json = {
  '1': 'ResetPwEmailRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
  ],
};

/// Descriptor for `ResetPwEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPwEmailRequestDescriptor = $convert.base64Decode(
    'ChNSZXNldFB3RW1haWxSZXF1ZXN0EhQKBWVtYWlsGAEgASgJUgVlbWFpbA==');

@$core.Deprecated('Use resetPwEmailResponseDescriptor instead')
const ResetPwEmailResponse$json = {
  '1': 'ResetPwEmailResponse',
  '2': [
    {'1': 'link', '3': 1, '4': 1, '5': 9, '10': 'link'},
    {'1': 'status', '3': 2, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `ResetPwEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPwEmailResponseDescriptor = $convert.base64Decode(
    'ChRSZXNldFB3RW1haWxSZXNwb25zZRISCgRsaW5rGAEgASgJUgRsaW5rEhYKBnN0YXR1cxgCIA'
    'EoCVIGc3RhdHVz');

@$core.Deprecated('Use resetPwEmailConfirmRequestDescriptor instead')
const ResetPwEmailConfirmRequest$json = {
  '1': 'ResetPwEmailConfirmRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `ResetPwEmailConfirmRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPwEmailConfirmRequestDescriptor = $convert.base64Decode(
    'ChpSZXNldFB3RW1haWxDb25maXJtUmVxdWVzdBIUCgVlbWFpbBgBIAEoCVIFZW1haWwSGgoIcG'
    'Fzc3dvcmQYAiABKAlSCHBhc3N3b3Jk');

