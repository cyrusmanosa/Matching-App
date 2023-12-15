//
//  Generated code. Do not modify.
//  source: rpc_login.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use loginUserRequestDescriptor instead')
const LoginUserRequest$json = {
  '1': 'LoginUserRequest',
  '2': [
    {'1': 'Email', '3': 1, '4': 1, '5': 9, '10': 'Email'},
    {'1': 'Password', '3': 2, '4': 1, '5': 9, '10': 'Password'},
  ],
};

/// Descriptor for `LoginUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginUserRequestDescriptor = $convert.base64Decode(
    'ChBMb2dpblVzZXJSZXF1ZXN0EhQKBUVtYWlsGAEgASgJUgVFbWFpbBIaCghQYXNzd29yZBgCIA'
    'EoCVIIUGFzc3dvcmQ=');

@$core.Deprecated('Use loginUserResponseDescriptor instead')
const LoginUserResponse$json = {
  '1': 'LoginUserResponse',
  '2': [
    {'1': 'SessionsID', '3': 1, '4': 1, '5': 9, '10': 'SessionsID'},
    {'1': 'Email', '3': 3, '4': 1, '5': 9, '10': 'Email'},
    {'1': 'AccessTokenExpiresAt', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'AccessTokenExpiresAt'},
  ],
};

/// Descriptor for `LoginUserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List loginUserResponseDescriptor = $convert.base64Decode(
    'ChFMb2dpblVzZXJSZXNwb25zZRIeCgpTZXNzaW9uc0lEGAEgASgJUgpTZXNzaW9uc0lEEhQKBU'
    'VtYWlsGAMgASgJUgVFbWFpbBJOChRBY2Nlc3NUb2tlbkV4cGlyZXNBdBgGIAEoCzIaLmdvb2ds'
    'ZS5wcm90b2J1Zi5UaW1lc3RhbXBSFEFjY2Vzc1Rva2VuRXhwaXJlc0F0');

