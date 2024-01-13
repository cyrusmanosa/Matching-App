//
//  Generated code. Do not modify.
//  source: rpc_canChange.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createCanChangeRequestDescriptor instead')
const CreateCanChangeRequest$json = {
  '1': 'CreateCanChangeRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'NickName', '3': 2, '4': 1, '5': 9, '10': 'NickName'},
    {'1': 'City', '3': 3, '4': 1, '5': 9, '10': 'City'},
    {'1': 'Sexual', '3': 4, '4': 1, '5': 9, '10': 'Sexual'},
    {'1': 'Height', '3': 5, '4': 1, '5': 5, '10': 'Height'},
    {'1': 'Weight', '3': 6, '4': 1, '5': 5, '10': 'Weight'},
    {'1': 'Speaklanguage', '3': 7, '4': 1, '5': 9, '10': 'Speaklanguage'},
    {'1': 'Education', '3': 8, '4': 1, '5': 9, '10': 'Education'},
    {'1': 'Job', '3': 9, '4': 1, '5': 9, '10': 'Job'},
    {'1': 'AnnualSalary', '3': 10, '4': 1, '5': 5, '10': 'AnnualSalary'},
    {'1': 'Sociability', '3': 11, '4': 1, '5': 9, '10': 'Sociability'},
    {'1': 'Religious', '3': 12, '4': 1, '5': 9, '10': 'Religious'},
    {'1': 'Introduce', '3': 13, '4': 1, '5': 9, '10': 'Introduce'},
  ],
};

/// Descriptor for `CreateCanChangeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCanChangeRequestDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVDYW5DaGFuZ2VSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklEEh'
    'oKCE5pY2tOYW1lGAIgASgJUghOaWNrTmFtZRISCgRDaXR5GAMgASgJUgRDaXR5EhYKBlNleHVh'
    'bBgEIAEoCVIGU2V4dWFsEhYKBkhlaWdodBgFIAEoBVIGSGVpZ2h0EhYKBldlaWdodBgGIAEoBV'
    'IGV2VpZ2h0EiQKDVNwZWFrbGFuZ3VhZ2UYByABKAlSDVNwZWFrbGFuZ3VhZ2USHAoJRWR1Y2F0'
    'aW9uGAggASgJUglFZHVjYXRpb24SEAoDSm9iGAkgASgJUgNKb2ISIgoMQW5udWFsU2FsYXJ5GA'
    'ogASgFUgxBbm51YWxTYWxhcnkSIAoLU29jaWFiaWxpdHkYCyABKAlSC1NvY2lhYmlsaXR5EhwK'
    'CVJlbGlnaW91cxgMIAEoCVIJUmVsaWdpb3VzEhwKCUludHJvZHVjZRgNIAEoCVIJSW50cm9kdW'
    'Nl');

@$core.Deprecated('Use createCanChangeResponseDescriptor instead')
const CreateCanChangeResponse$json = {
  '1': 'CreateCanChangeResponse',
  '2': [
    {'1': 'CanChangeInfo', '3': 1, '4': 1, '5': 11, '6': '.pb.CanChange', '10': 'CanChangeInfo'},
  ],
};

/// Descriptor for `CreateCanChangeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCanChangeResponseDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVDYW5DaGFuZ2VSZXNwb25zZRIzCg1DYW5DaGFuZ2VJbmZvGAEgASgLMg0ucGIuQ2'
    'FuQ2hhbmdlUg1DYW5DaGFuZ2VJbmZv');

@$core.Deprecated('Use getCanChangeRequestDescriptor instead')
const GetCanChangeRequest$json = {
  '1': 'GetCanChangeRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'UserID', '3': 2, '4': 1, '5': 5, '10': 'UserID'},
  ],
};

/// Descriptor for `GetCanChangeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCanChangeRequestDescriptor = $convert.base64Decode(
    'ChNHZXRDYW5DaGFuZ2VSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklEEhYKBl'
    'VzZXJJRBgCIAEoBVIGVXNlcklE');

@$core.Deprecated('Use getCanChangeResponseDescriptor instead')
const GetCanChangeResponse$json = {
  '1': 'GetCanChangeResponse',
  '2': [
    {'1': 'CanChangeInfo', '3': 1, '4': 1, '5': 11, '6': '.pb.CanChange', '10': 'CanChangeInfo'},
  ],
};

/// Descriptor for `GetCanChangeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCanChangeResponseDescriptor = $convert.base64Decode(
    'ChRHZXRDYW5DaGFuZ2VSZXNwb25zZRIzCg1DYW5DaGFuZ2VJbmZvGAEgASgLMg0ucGIuQ2FuQ2'
    'hhbmdlUg1DYW5DaGFuZ2VJbmZv');

@$core.Deprecated('Use updateCanChangeRequestDescriptor instead')
const UpdateCanChangeRequest$json = {
  '1': 'UpdateCanChangeRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'NickName', '3': 2, '4': 1, '5': 9, '10': 'NickName'},
    {'1': 'City', '3': 3, '4': 1, '5': 9, '10': 'City'},
    {'1': 'Sexual', '3': 4, '4': 1, '5': 9, '10': 'Sexual'},
    {'1': 'Height', '3': 5, '4': 1, '5': 5, '10': 'Height'},
    {'1': 'Weight', '3': 6, '4': 1, '5': 5, '10': 'Weight'},
    {'1': 'Speaklanguage', '3': 7, '4': 1, '5': 9, '10': 'Speaklanguage'},
    {'1': 'Education', '3': 8, '4': 1, '5': 9, '10': 'Education'},
    {'1': 'Job', '3': 9, '4': 1, '5': 9, '10': 'Job'},
    {'1': 'AnnualSalary', '3': 10, '4': 1, '5': 5, '10': 'AnnualSalary'},
    {'1': 'Sociability', '3': 11, '4': 1, '5': 9, '10': 'Sociability'},
    {'1': 'Religious', '3': 12, '4': 1, '5': 9, '10': 'Religious'},
    {'1': 'Introduce', '3': 13, '4': 1, '5': 9, '10': 'Introduce'},
  ],
};

/// Descriptor for `UpdateCanChangeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCanChangeRequestDescriptor = $convert.base64Decode(
    'ChZVcGRhdGVDYW5DaGFuZ2VSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklEEh'
    'oKCE5pY2tOYW1lGAIgASgJUghOaWNrTmFtZRISCgRDaXR5GAMgASgJUgRDaXR5EhYKBlNleHVh'
    'bBgEIAEoCVIGU2V4dWFsEhYKBkhlaWdodBgFIAEoBVIGSGVpZ2h0EhYKBldlaWdodBgGIAEoBV'
    'IGV2VpZ2h0EiQKDVNwZWFrbGFuZ3VhZ2UYByABKAlSDVNwZWFrbGFuZ3VhZ2USHAoJRWR1Y2F0'
    'aW9uGAggASgJUglFZHVjYXRpb24SEAoDSm9iGAkgASgJUgNKb2ISIgoMQW5udWFsU2FsYXJ5GA'
    'ogASgFUgxBbm51YWxTYWxhcnkSIAoLU29jaWFiaWxpdHkYCyABKAlSC1NvY2lhYmlsaXR5EhwK'
    'CVJlbGlnaW91cxgMIAEoCVIJUmVsaWdpb3VzEhwKCUludHJvZHVjZRgNIAEoCVIJSW50cm9kdW'
    'Nl');

@$core.Deprecated('Use updateCanChangeResponseDescriptor instead')
const UpdateCanChangeResponse$json = {
  '1': 'UpdateCanChangeResponse',
  '2': [
    {'1': 'CanChangeInfo', '3': 1, '4': 1, '5': 11, '6': '.pb.CanChange', '10': 'CanChangeInfo'},
  ],
};

/// Descriptor for `UpdateCanChangeResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateCanChangeResponseDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVDYW5DaGFuZ2VSZXNwb25zZRIzCg1DYW5DaGFuZ2VJbmZvGAEgASgLMg0ucGIuQ2'
    'FuQ2hhbmdlUg1DYW5DaGFuZ2VJbmZv');

@$core.Deprecated('Use deleteCanChangeRequestDescriptor instead')
const DeleteCanChangeRequest$json = {
  '1': 'DeleteCanChangeRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
  ],
};

/// Descriptor for `DeleteCanChangeRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteCanChangeRequestDescriptor = $convert.base64Decode(
    'ChZEZWxldGVDYW5DaGFuZ2VSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklE');

