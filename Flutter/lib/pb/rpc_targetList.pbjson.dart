//
//  Generated code. Do not modify.
//  source: rpc_targetList.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createTargetListRequestDescriptor instead')
const CreateTargetListRequest$json = {
  '1': 'CreateTargetListRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'Target1ID', '3': 2, '4': 1, '5': 5, '10': 'Target1ID'},
    {'1': 'Target2ID', '3': 3, '4': 1, '5': 5, '10': 'Target2ID'},
    {'1': 'Target3ID', '3': 4, '4': 1, '5': 5, '10': 'Target3ID'},
  ],
};

/// Descriptor for `CreateTargetListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTargetListRequestDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVUYXJnZXRMaXN0UmVxdWVzdBIWCgZVc2VySUQYASABKAVSBlVzZXJJRBIcCglUYX'
    'JnZXQxSUQYAiABKAVSCVRhcmdldDFJRBIcCglUYXJnZXQySUQYAyABKAVSCVRhcmdldDJJRBIc'
    'CglUYXJnZXQzSUQYBCABKAVSCVRhcmdldDNJRA==');

@$core.Deprecated('Use createTargetListResponseDescriptor instead')
const CreateTargetListResponse$json = {
  '1': 'CreateTargetListResponse',
  '2': [
    {'1': 'tl', '3': 1, '4': 1, '5': 11, '6': '.pb.Targetlist', '10': 'tl'},
  ],
};

/// Descriptor for `CreateTargetListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createTargetListResponseDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVUYXJnZXRMaXN0UmVzcG9uc2USHgoCdGwYASABKAsyDi5wYi5UYXJnZXRsaXN0Ug'
    'J0bA==');

@$core.Deprecated('Use getTargetListRequestDescriptor instead')
const GetTargetListRequest$json = {
  '1': 'GetTargetListRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
  ],
};

/// Descriptor for `GetTargetListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTargetListRequestDescriptor = $convert.base64Decode(
    'ChRHZXRUYXJnZXRMaXN0UmVxdWVzdBIWCgZVc2VySUQYASABKAVSBlVzZXJJRA==');

@$core.Deprecated('Use getTargetListResponseDescriptor instead')
const GetTargetListResponse$json = {
  '1': 'GetTargetListResponse',
  '2': [
    {'1': 'tl', '3': 1, '4': 1, '5': 11, '6': '.pb.Targetlist', '10': 'tl'},
  ],
};

/// Descriptor for `GetTargetListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTargetListResponseDescriptor = $convert.base64Decode(
    'ChVHZXRUYXJnZXRMaXN0UmVzcG9uc2USHgoCdGwYASABKAsyDi5wYi5UYXJnZXRsaXN0UgJ0bA'
    '==');

@$core.Deprecated('Use updateTargetListRequestDescriptor instead')
const UpdateTargetListRequest$json = {
  '1': 'UpdateTargetListRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'Target1ID', '3': 2, '4': 1, '5': 5, '10': 'Target1ID'},
    {'1': 'Target2ID', '3': 3, '4': 1, '5': 5, '10': 'Target2ID'},
    {'1': 'Target3ID', '3': 4, '4': 1, '5': 5, '10': 'Target3ID'},
  ],
};

/// Descriptor for `UpdateTargetListRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTargetListRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVUYXJnZXRMaXN0UmVxdWVzdBIWCgZVc2VySUQYASABKAVSBlVzZXJJRBIcCglUYX'
    'JnZXQxSUQYAiABKAVSCVRhcmdldDFJRBIcCglUYXJnZXQySUQYAyABKAVSCVRhcmdldDJJRBIc'
    'CglUYXJnZXQzSUQYBCABKAVSCVRhcmdldDNJRA==');

@$core.Deprecated('Use updateTargetListResponseDescriptor instead')
const UpdateTargetListResponse$json = {
  '1': 'UpdateTargetListResponse',
  '2': [
    {'1': 'tl', '3': 1, '4': 1, '5': 11, '6': '.pb.Targetlist', '10': 'tl'},
  ],
};

/// Descriptor for `UpdateTargetListResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTargetListResponseDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVUYXJnZXRMaXN0UmVzcG9uc2USHgoCdGwYASABKAsyDi5wYi5UYXJnZXRsaXN0Ug'
    'J0bA==');

