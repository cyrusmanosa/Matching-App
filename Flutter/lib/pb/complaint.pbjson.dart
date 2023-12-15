//
//  Generated code. Do not modify.
//  source: complaint.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use complaintDescriptor instead')
const Complaint$json = {
  '1': 'Complaint',
  '2': [
    {'1': 'CpID', '3': 1, '4': 1, '5': 5, '10': 'CpID'},
    {'1': 'UserID', '3': 2, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'CpTargetID', '3': 3, '4': 1, '5': 5, '10': 'CpTargetID'},
    {'1': 'CpType', '3': 4, '4': 1, '5': 9, '10': 'CpType'},
    {'1': 'CpMessage', '3': 5, '4': 1, '5': 9, '10': 'CpMessage'},
    {'1': 'Status', '3': 6, '4': 1, '5': 9, '10': 'Status'},
    {'1': 'ComplaintTime', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'ComplaintTime'},
  ],
};

/// Descriptor for `Complaint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List complaintDescriptor = $convert.base64Decode(
    'CglDb21wbGFpbnQSEgoEQ3BJRBgBIAEoBVIEQ3BJRBIWCgZVc2VySUQYAiABKAVSBlVzZXJJRB'
    'IeCgpDcFRhcmdldElEGAMgASgFUgpDcFRhcmdldElEEhYKBkNwVHlwZRgEIAEoCVIGQ3BUeXBl'
    'EhwKCUNwTWVzc2FnZRgFIAEoCVIJQ3BNZXNzYWdlEhYKBlN0YXR1cxgGIAEoCVIGU3RhdHVzEk'
    'AKDUNvbXBsYWludFRpbWUYByABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg1Db21w'
    'bGFpbnRUaW1l');

