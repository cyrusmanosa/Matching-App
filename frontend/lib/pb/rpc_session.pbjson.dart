//
//  Generated code. Do not modify.
//  source: rpc_session.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getUserIDRequestDescriptor instead')
const GetUserIDRequest$json = {
  '1': 'GetUserIDRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
  ],
};

/// Descriptor for `GetUserIDRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserIDRequestDescriptor = $convert.base64Decode(
    'ChBHZXRVc2VySURSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklE');

@$core.Deprecated('Use getUserIDResponseDescriptor instead')
const GetUserIDResponse$json = {
  '1': 'GetUserIDResponse',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
  ],
};

/// Descriptor for `GetUserIDResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserIDResponseDescriptor = $convert.base64Decode(
    'ChFHZXRVc2VySURSZXNwb25zZRIWCgZVc2VySUQYASABKAVSBlVzZXJJRA==');

