//
//  Generated code. Do not modify.
//  source: rpc_fix.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createFixRequestDescriptor instead')
const CreateFixRequest$json = {
  '1': 'CreateFixRequest',
  '2': [
    {'1': 'FirstName', '3': 1, '4': 1, '5': 9, '10': 'FirstName'},
    {'1': 'LastName', '3': 2, '4': 1, '5': 9, '10': 'LastName'},
    {'1': 'Birth', '3': 3, '4': 1, '5': 9, '10': 'Birth'},
    {'1': 'Country', '3': 4, '4': 1, '5': 9, '10': 'Country'},
    {'1': 'Gender', '3': 5, '4': 1, '5': 9, '10': 'Gender'},
    {'1': 'Blood', '3': 6, '4': 1, '5': 9, '10': 'Blood'},
  ],
};

/// Descriptor for `CreateFixRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFixRequestDescriptor = $convert.base64Decode(
    'ChBDcmVhdGVGaXhSZXF1ZXN0EhwKCUZpcnN0TmFtZRgBIAEoCVIJRmlyc3ROYW1lEhoKCExhc3'
    'ROYW1lGAIgASgJUghMYXN0TmFtZRIUCgVCaXJ0aBgDIAEoCVIFQmlydGgSGAoHQ291bnRyeRgE'
    'IAEoCVIHQ291bnRyeRIWCgZHZW5kZXIYBSABKAlSBkdlbmRlchIUCgVCbG9vZBgGIAEoCVIFQm'
    'xvb2Q=');

@$core.Deprecated('Use createFixResponseDescriptor instead')
const CreateFixResponse$json = {
  '1': 'CreateFixResponse',
  '2': [
    {'1': 'SessionsID', '3': 1, '4': 1, '5': 9, '10': 'SessionsID'},
    {'1': 'Email', '3': 2, '4': 1, '5': 9, '10': 'Email'},
    {'1': 'CreateAt', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'CreateAt'},
    {'1': 'AccessTokenExpiresAt', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'AccessTokenExpiresAt'},
  ],
};

/// Descriptor for `CreateFixResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createFixResponseDescriptor = $convert.base64Decode(
    'ChFDcmVhdGVGaXhSZXNwb25zZRIeCgpTZXNzaW9uc0lEGAEgASgJUgpTZXNzaW9uc0lEEhQKBU'
    'VtYWlsGAIgASgJUgVFbWFpbBI2CghDcmVhdGVBdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5U'
    'aW1lc3RhbXBSCENyZWF0ZUF0Ek4KFEFjY2Vzc1Rva2VuRXhwaXJlc0F0GAQgASgLMhouZ29vZ2'
    'xlLnByb3RvYnVmLlRpbWVzdGFtcFIUQWNjZXNzVG9rZW5FeHBpcmVzQXQ=');

@$core.Deprecated('Use getFixRequestDescriptor instead')
const GetFixRequest$json = {
  '1': 'GetFixRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'UserID', '3': 2, '4': 1, '5': 5, '10': 'UserID'},
  ],
};

/// Descriptor for `GetFixRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFixRequestDescriptor = $convert.base64Decode(
    'Cg1HZXRGaXhSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklEEhYKBlVzZXJJRB'
    'gCIAEoBVIGVXNlcklE');

@$core.Deprecated('Use getFixResponseDescriptor instead')
const GetFixResponse$json = {
  '1': 'GetFixResponse',
  '2': [
    {'1': 'fix', '3': 1, '4': 1, '5': 11, '6': '.pb.Fix', '10': 'fix'},
  ],
};

/// Descriptor for `GetFixResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFixResponseDescriptor = $convert.base64Decode(
    'Cg5HZXRGaXhSZXNwb25zZRIZCgNmaXgYASABKAsyBy5wYi5GaXhSA2ZpeA==');

@$core.Deprecated('Use deleteFixRequestDescriptor instead')
const DeleteFixRequest$json = {
  '1': 'DeleteFixRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
  ],
};

/// Descriptor for `DeleteFixRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteFixRequestDescriptor = $convert.base64Decode(
    'ChBEZWxldGVGaXhSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklE');

