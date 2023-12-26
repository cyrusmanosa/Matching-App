//
//  Generated code. Do not modify.
//  source: rpc_password.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use inputPasswordRequestDescriptor instead')
const InputPasswordRequest$json = {
  '1': 'InputPasswordRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'Password', '3': 2, '4': 1, '5': 9, '10': 'Password'},
  ],
};

/// Descriptor for `InputPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputPasswordRequestDescriptor = $convert.base64Decode(
    'ChRJbnB1dFBhc3N3b3JkUmVxdWVzdBIcCglTZXNzaW9uSUQYASABKAlSCVNlc3Npb25JRBIaCg'
    'hQYXNzd29yZBgCIAEoCVIIUGFzc3dvcmQ=');

@$core.Deprecated('Use inputPasswordResponseDescriptor instead')
const InputPasswordResponse$json = {
  '1': 'InputPasswordResponse',
  '2': [
    {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    {'1': 'PasswordChangedAt', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'PasswordChangedAt'},
  ],
};

/// Descriptor for `InputPasswordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inputPasswordResponseDescriptor = $convert.base64Decode(
    'ChVJbnB1dFBhc3N3b3JkUmVzcG9uc2USGAoHTWVzc2FnZRgBIAEoCVIHTWVzc2FnZRJIChFQYX'
    'Nzd29yZENoYW5nZWRBdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSEVBhc3N3'
    'b3JkQ2hhbmdlZEF0');

@$core.Deprecated('Use resetPasswordRequestDescriptor instead')
const ResetPasswordRequest$json = {
  '1': 'ResetPasswordRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'Password', '3': 2, '4': 1, '5': 9, '10': 'Password'},
  ],
};

/// Descriptor for `ResetPasswordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordRequestDescriptor = $convert.base64Decode(
    'ChRSZXNldFBhc3N3b3JkUmVxdWVzdBIcCglTZXNzaW9uSUQYASABKAlSCVNlc3Npb25JRBIaCg'
    'hQYXNzd29yZBgCIAEoCVIIUGFzc3dvcmQ=');

@$core.Deprecated('Use resetPasswordResponseDescriptor instead')
const ResetPasswordResponse$json = {
  '1': 'ResetPasswordResponse',
  '2': [
    {'1': 'Message', '3': 1, '4': 1, '5': 9, '10': 'Message'},
    {'1': 'PasswordChangedAt', '3': 3, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'PasswordChangedAt'},
  ],
};

/// Descriptor for `ResetPasswordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resetPasswordResponseDescriptor = $convert.base64Decode(
    'ChVSZXNldFBhc3N3b3JkUmVzcG9uc2USGAoHTWVzc2FnZRgBIAEoCVIHTWVzc2FnZRJIChFQYX'
    'Nzd29yZENoYW5nZWRBdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSEVBhc3N3'
    'b3JkQ2hhbmdlZEF0');

