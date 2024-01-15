//
//  Generated code. Do not modify.
//  source: rpc_changeTarget.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createChangeTargetRequestDescriptor instead')
const CreateChangeTargetRequest$json = {
  '1': 'CreateChangeTargetRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'ChangeUserID', '3': 2, '4': 1, '5': 5, '10': 'ChangeUserID'},
    {'1': 'Reason', '3': 3, '4': 1, '5': 9, '10': 'Reason'},
  ],
};

/// Descriptor for `CreateChangeTargetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChangeTargetRequestDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVDaGFuZ2VUYXJnZXRSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbk'
    'lEEiIKDENoYW5nZVVzZXJJRBgCIAEoBVIMQ2hhbmdlVXNlcklEEhYKBlJlYXNvbhgDIAEoCVIG'
    'UmVhc29u');

@$core.Deprecated('Use createChangeTargetResponseDescriptor instead')
const CreateChangeTargetResponse$json = {
  '1': 'CreateChangeTargetResponse',
  '2': [
    {'1': 'ct', '3': 1, '4': 1, '5': 11, '6': '.pb.ChangeTarget', '10': 'ct'},
  ],
};

/// Descriptor for `CreateChangeTargetResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChangeTargetResponseDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVDaGFuZ2VUYXJnZXRSZXNwb25zZRIgCgJjdBgBIAEoCzIQLnBiLkNoYW5nZVRhcm'
    'dldFICY3Q=');

@$core.Deprecated('Use getChangeTargetRequestDescriptor instead')
const GetChangeTargetRequest$json = {
  '1': 'GetChangeTargetRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
  ],
};

/// Descriptor for `GetChangeTargetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChangeTargetRequestDescriptor = $convert.base64Decode(
    'ChZHZXRDaGFuZ2VUYXJnZXRSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklE');

@$core.Deprecated('Use getChangeTargetResponseDescriptor instead')
const GetChangeTargetResponse$json = {
  '1': 'GetChangeTargetResponse',
  '2': [
    {'1': 'ct', '3': 1, '4': 1, '5': 11, '6': '.pb.ChangeTarget', '10': 'ct'},
  ],
};

/// Descriptor for `GetChangeTargetResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChangeTargetResponseDescriptor = $convert.base64Decode(
    'ChdHZXRDaGFuZ2VUYXJnZXRSZXNwb25zZRIgCgJjdBgBIAEoCzIQLnBiLkNoYW5nZVRhcmdldF'
    'ICY3Q=');

@$core.Deprecated('Use deleteChangeTargetRequestDescriptor instead')
const DeleteChangeTargetRequest$json = {
  '1': 'DeleteChangeTargetRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
  ],
};

/// Descriptor for `DeleteChangeTargetRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteChangeTargetRequestDescriptor = $convert.base64Decode(
    'ChlEZWxldGVDaGFuZ2VUYXJnZXRSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbk'
    'lE');

