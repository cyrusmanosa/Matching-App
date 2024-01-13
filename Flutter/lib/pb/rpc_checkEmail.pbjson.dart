//
//  Generated code. Do not modify.
//  source: rpc_checkEmail.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use checkEmailRequestDescriptor instead')
const CheckEmailRequest$json = {
  '1': 'CheckEmailRequest',
  '2': [
    {'1': 'Email', '3': 1, '4': 1, '5': 9, '10': 'Email'},
  ],
};

/// Descriptor for `CheckEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkEmailRequestDescriptor = $convert.base64Decode(
    'ChFDaGVja0VtYWlsUmVxdWVzdBIUCgVFbWFpbBgBIAEoCVIFRW1haWw=');

@$core.Deprecated('Use checkEmailResponseDescriptor instead')
const CheckEmailResponse$json = {
  '1': 'CheckEmailResponse',
  '2': [
    {'1': 'Email', '3': 1, '4': 1, '5': 9, '10': 'Email'},
    {'1': 'CheckCode', '3': 2, '4': 1, '5': 9, '10': 'CheckCode'},
  ],
};

/// Descriptor for `CheckEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkEmailResponseDescriptor = $convert.base64Decode(
    'ChJDaGVja0VtYWlsUmVzcG9uc2USFAoFRW1haWwYASABKAlSBUVtYWlsEhwKCUNoZWNrQ29kZR'
    'gCIAEoCVIJQ2hlY2tDb2Rl');

@$core.Deprecated('Use sendEmailRequestDescriptor instead')
const SendEmailRequest$json = {
  '1': 'SendEmailRequest',
  '2': [
    {'1': 'CheckCode', '3': 1, '4': 1, '5': 9, '10': 'CheckCode'},
  ],
};

/// Descriptor for `SendEmailRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List sendEmailRequestDescriptor = $convert.base64Decode(
    'ChBTZW5kRW1haWxSZXF1ZXN0EhwKCUNoZWNrQ29kZRgBIAEoCVIJQ2hlY2tDb2Rl');

@$core.Deprecated('Use checkedEmailResponseDescriptor instead')
const CheckedEmailResponse$json = {
  '1': 'CheckedEmailResponse',
  '2': [
    {'1': 'Email', '3': 1, '4': 1, '5': 9, '10': 'Email'},
    {'1': 'Status', '3': 2, '4': 1, '5': 9, '10': 'Status'},
  ],
};

/// Descriptor for `CheckedEmailResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkedEmailResponseDescriptor = $convert.base64Decode(
    'ChRDaGVja2VkRW1haWxSZXNwb25zZRIUCgVFbWFpbBgBIAEoCVIFRW1haWwSFgoGU3RhdHVzGA'
    'IgASgJUgZTdGF0dXM=');

