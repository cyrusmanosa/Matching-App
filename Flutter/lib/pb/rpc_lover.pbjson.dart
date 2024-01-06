//
//  Generated code. Do not modify.
//  source: rpc_lover.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createLoverRequestDescriptor instead')
const CreateLoverRequest$json = {
  '1': 'CreateLoverRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'MinAge', '3': 2, '4': 1, '5': 5, '10': 'MinAge'},
    {'1': 'MaxAge', '3': 3, '4': 1, '5': 5, '10': 'MaxAge'},
    {'1': 'City', '3': 4, '4': 1, '5': 9, '10': 'City'},
    {'1': 'Gender', '3': 5, '4': 1, '5': 9, '10': 'Gender'},
    {'1': 'Constellation', '3': 6, '4': 1, '5': 9, '10': 'Constellation'},
    {'1': 'Sexual', '3': 7, '4': 1, '5': 9, '10': 'Sexual'},
    {'1': 'Height', '3': 8, '4': 1, '5': 5, '10': 'Height'},
    {'1': 'Weight', '3': 9, '4': 1, '5': 5, '10': 'Weight'},
    {'1': 'Speaklanguage', '3': 10, '4': 1, '5': 9, '10': 'Speaklanguage'},
    {'1': 'Job', '3': 11, '4': 1, '5': 9, '10': 'Job'},
    {'1': 'AnnualSalary', '3': 12, '4': 1, '5': 5, '10': 'AnnualSalary'},
    {'1': 'Sociability', '3': 13, '4': 1, '5': 9, '10': 'Sociability'},
    {'1': 'Religious', '3': 14, '4': 1, '5': 9, '10': 'Religious'},
    {'1': 'Certification', '3': 15, '4': 1, '5': 8, '10': 'Certification'},
  ],
};

/// Descriptor for `CreateLoverRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createLoverRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVMb3ZlclJlcXVlc3QSHAoJU2Vzc2lvbklEGAEgASgJUglTZXNzaW9uSUQSFgoGTW'
    'luQWdlGAIgASgFUgZNaW5BZ2USFgoGTWF4QWdlGAMgASgFUgZNYXhBZ2USEgoEQ2l0eRgEIAEo'
    'CVIEQ2l0eRIWCgZHZW5kZXIYBSABKAlSBkdlbmRlchIkCg1Db25zdGVsbGF0aW9uGAYgASgJUg'
    '1Db25zdGVsbGF0aW9uEhYKBlNleHVhbBgHIAEoCVIGU2V4dWFsEhYKBkhlaWdodBgIIAEoBVIG'
    'SGVpZ2h0EhYKBldlaWdodBgJIAEoBVIGV2VpZ2h0EiQKDVNwZWFrbGFuZ3VhZ2UYCiABKAlSDV'
    'NwZWFrbGFuZ3VhZ2USEAoDSm9iGAsgASgJUgNKb2ISIgoMQW5udWFsU2FsYXJ5GAwgASgFUgxB'
    'bm51YWxTYWxhcnkSIAoLU29jaWFiaWxpdHkYDSABKAlSC1NvY2lhYmlsaXR5EhwKCVJlbGlnaW'
    '91cxgOIAEoCVIJUmVsaWdpb3VzEiQKDUNlcnRpZmljYXRpb24YDyABKAhSDUNlcnRpZmljYXRp'
    'b24=');

@$core.Deprecated('Use createLoverResponseDescriptor instead')
const CreateLoverResponse$json = {
  '1': 'CreateLoverResponse',
  '2': [
    {'1': 'l', '3': 1, '4': 1, '5': 11, '6': '.pb.Lover', '10': 'l'},
  ],
};

/// Descriptor for `CreateLoverResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createLoverResponseDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVMb3ZlclJlc3BvbnNlEhcKAWwYASABKAsyCS5wYi5Mb3ZlclIBbA==');

@$core.Deprecated('Use getLoverRequestDescriptor instead')
const GetLoverRequest$json = {
  '1': 'GetLoverRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
  ],
};

/// Descriptor for `GetLoverRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLoverRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRMb3ZlclJlcXVlc3QSHAoJU2Vzc2lvbklEGAEgASgJUglTZXNzaW9uSUQ=');

@$core.Deprecated('Use getLoverResponseDescriptor instead')
const GetLoverResponse$json = {
  '1': 'GetLoverResponse',
  '2': [
    {'1': 'l', '3': 1, '4': 1, '5': 11, '6': '.pb.Lover', '10': 'l'},
  ],
};

/// Descriptor for `GetLoverResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLoverResponseDescriptor = $convert.base64Decode(
    'ChBHZXRMb3ZlclJlc3BvbnNlEhcKAWwYASABKAsyCS5wYi5Mb3ZlclIBbA==');

@$core.Deprecated('Use updateLoverRequestDescriptor instead')
const UpdateLoverRequest$json = {
  '1': 'UpdateLoverRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'MinAge', '3': 2, '4': 1, '5': 5, '10': 'MinAge'},
    {'1': 'MaxAge', '3': 3, '4': 1, '5': 5, '10': 'MaxAge'},
    {'1': 'City', '3': 4, '4': 1, '5': 9, '10': 'City'},
    {'1': 'Gender', '3': 5, '4': 1, '5': 9, '10': 'Gender'},
    {'1': 'Constellation', '3': 6, '4': 1, '5': 9, '10': 'Constellation'},
    {'1': 'Sexual', '3': 7, '4': 1, '5': 9, '10': 'Sexual'},
    {'1': 'Height', '3': 8, '4': 1, '5': 5, '10': 'Height'},
    {'1': 'Weight', '3': 9, '4': 1, '5': 5, '10': 'Weight'},
    {'1': 'Speaklanguage', '3': 10, '4': 1, '5': 9, '10': 'Speaklanguage'},
    {'1': 'Job', '3': 11, '4': 1, '5': 9, '10': 'Job'},
    {'1': 'AnnualSalary', '3': 12, '4': 1, '5': 5, '10': 'AnnualSalary'},
    {'1': 'Sociability', '3': 13, '4': 1, '5': 9, '10': 'Sociability'},
    {'1': 'Religious', '3': 14, '4': 1, '5': 9, '10': 'Religious'},
    {'1': 'Certification', '3': 15, '4': 1, '5': 8, '10': 'Certification'},
  ],
};

/// Descriptor for `UpdateLoverRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLoverRequestDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVMb3ZlclJlcXVlc3QSHAoJU2Vzc2lvbklEGAEgASgJUglTZXNzaW9uSUQSFgoGTW'
    'luQWdlGAIgASgFUgZNaW5BZ2USFgoGTWF4QWdlGAMgASgFUgZNYXhBZ2USEgoEQ2l0eRgEIAEo'
    'CVIEQ2l0eRIWCgZHZW5kZXIYBSABKAlSBkdlbmRlchIkCg1Db25zdGVsbGF0aW9uGAYgASgJUg'
    '1Db25zdGVsbGF0aW9uEhYKBlNleHVhbBgHIAEoCVIGU2V4dWFsEhYKBkhlaWdodBgIIAEoBVIG'
    'SGVpZ2h0EhYKBldlaWdodBgJIAEoBVIGV2VpZ2h0EiQKDVNwZWFrbGFuZ3VhZ2UYCiABKAlSDV'
    'NwZWFrbGFuZ3VhZ2USEAoDSm9iGAsgASgJUgNKb2ISIgoMQW5udWFsU2FsYXJ5GAwgASgFUgxB'
    'bm51YWxTYWxhcnkSIAoLU29jaWFiaWxpdHkYDSABKAlSC1NvY2lhYmlsaXR5EhwKCVJlbGlnaW'
    '91cxgOIAEoCVIJUmVsaWdpb3VzEiQKDUNlcnRpZmljYXRpb24YDyABKAhSDUNlcnRpZmljYXRp'
    'b24=');

@$core.Deprecated('Use updateLoverResponseDescriptor instead')
const UpdateLoverResponse$json = {
  '1': 'UpdateLoverResponse',
  '2': [
    {'1': 'l', '3': 1, '4': 1, '5': 11, '6': '.pb.Lover', '10': 'l'},
  ],
};

/// Descriptor for `UpdateLoverResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateLoverResponseDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVMb3ZlclJlc3BvbnNlEhcKAWwYASABKAsyCS5wYi5Mb3ZlclIBbA==');

@$core.Deprecated('Use deleteLoverRequestDescriptor instead')
const DeleteLoverRequest$json = {
  '1': 'DeleteLoverRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
  ],
};

/// Descriptor for `DeleteLoverRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteLoverRequestDescriptor = $convert.base64Decode(
    'ChJEZWxldGVMb3ZlclJlcXVlc3QSHAoJU2Vzc2lvbklEGAEgASgJUglTZXNzaW9uSUQ=');

