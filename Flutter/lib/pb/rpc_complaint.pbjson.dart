//
//  Generated code. Do not modify.
//  source: rpc_complaint.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createComplaintRequestDescriptor instead')
const CreateComplaintRequest$json = {
  '1': 'CreateComplaintRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'CpTargetID', '3': 2, '4': 1, '5': 5, '10': 'CpTargetID'},
    {'1': 'CpType', '3': 3, '4': 1, '5': 9, '10': 'CpType'},
    {'1': 'CpMessage', '3': 4, '4': 1, '5': 9, '10': 'CpMessage'},
  ],
};

/// Descriptor for `CreateComplaintRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createComplaintRequestDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVDb21wbGFpbnRSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklEEh'
    '4KCkNwVGFyZ2V0SUQYAiABKAVSCkNwVGFyZ2V0SUQSFgoGQ3BUeXBlGAMgASgJUgZDcFR5cGUS'
    'HAoJQ3BNZXNzYWdlGAQgASgJUglDcE1lc3NhZ2U=');

@$core.Deprecated('Use createComplaintResponseDescriptor instead')
const CreateComplaintResponse$json = {
  '1': 'CreateComplaintResponse',
  '2': [
    {'1': 'cp', '3': 1, '4': 1, '5': 11, '6': '.pb.Complaint', '10': 'cp'},
  ],
};

/// Descriptor for `CreateComplaintResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createComplaintResponseDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVDb21wbGFpbnRSZXNwb25zZRIdCgJjcBgBIAEoCzINLnBiLkNvbXBsYWludFICY3'
    'A=');

@$core.Deprecated('Use getComplaintRequestDescriptor instead')
const GetComplaintRequest$json = {
  '1': 'GetComplaintRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'CpID', '3': 2, '4': 1, '5': 5, '10': 'CpID'},
  ],
};

/// Descriptor for `GetComplaintRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getComplaintRequestDescriptor = $convert.base64Decode(
    'ChNHZXRDb21wbGFpbnRSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklEEhIKBE'
    'NwSUQYAiABKAVSBENwSUQ=');

@$core.Deprecated('Use getComplaintResponseDescriptor instead')
const GetComplaintResponse$json = {
  '1': 'GetComplaintResponse',
  '2': [
    {'1': 'cp', '3': 1, '4': 1, '5': 11, '6': '.pb.Complaint', '10': 'cp'},
  ],
};

/// Descriptor for `GetComplaintResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getComplaintResponseDescriptor = $convert.base64Decode(
    'ChRHZXRDb21wbGFpbnRSZXNwb25zZRIdCgJjcBgBIAEoCzINLnBiLkNvbXBsYWludFICY3A=');

@$core.Deprecated('Use updateComplaintRequestDescriptor instead')
const UpdateComplaintRequest$json = {
  '1': 'UpdateComplaintRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'CpID', '3': 2, '4': 1, '5': 5, '10': 'CpID'},
    {'1': 'Status', '3': 3, '4': 1, '5': 9, '10': 'Status'},
  ],
};

/// Descriptor for `UpdateComplaintRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateComplaintRequestDescriptor = $convert.base64Decode(
    'ChZVcGRhdGVDb21wbGFpbnRSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklEEh'
    'IKBENwSUQYAiABKAVSBENwSUQSFgoGU3RhdHVzGAMgASgJUgZTdGF0dXM=');

@$core.Deprecated('Use updateComplaintResponseDescriptor instead')
const UpdateComplaintResponse$json = {
  '1': 'UpdateComplaintResponse',
  '2': [
    {'1': 'cp', '3': 1, '4': 1, '5': 11, '6': '.pb.Complaint', '10': 'cp'},
  ],
};

/// Descriptor for `UpdateComplaintResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateComplaintResponseDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVDb21wbGFpbnRSZXNwb25zZRIdCgJjcBgBIAEoCzINLnBiLkNvbXBsYWludFICY3'
    'A=');

