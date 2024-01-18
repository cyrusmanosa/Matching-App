//
//  Generated code. Do not modify.
//  source: rpc_accompany.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createAccompanyRequestDescriptor instead')
const CreateAccompanyRequest$json = {
  '1': 'CreateAccompanyRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'Era', '3': 2, '4': 1, '5': 5, '10': 'Era'},
    {'1': 'Speaklanguage', '3': 3, '4': 3, '5': 9, '10': 'Speaklanguage'},
    {'1': 'FindType', '3': 4, '4': 1, '5': 9, '10': 'FindType'},
    {'1': 'Sociability', '3': 5, '4': 1, '5': 9, '10': 'Sociability'},
  ],
};

/// Descriptor for `CreateAccompanyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAccompanyRequestDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVBY2NvbXBhbnlSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklEEh'
    'AKA0VyYRgCIAEoBVIDRXJhEiQKDVNwZWFrbGFuZ3VhZ2UYAyADKAlSDVNwZWFrbGFuZ3VhZ2US'
    'GgoIRmluZFR5cGUYBCABKAlSCEZpbmRUeXBlEiAKC1NvY2lhYmlsaXR5GAUgASgJUgtTb2NpYW'
    'JpbGl0eQ==');

@$core.Deprecated('Use createAccompanyResponseDescriptor instead')
const CreateAccompanyResponse$json = {
  '1': 'CreateAccompanyResponse',
  '2': [
    {'1': 'ac', '3': 1, '4': 1, '5': 11, '6': '.pb.Accompany', '10': 'ac'},
  ],
};

/// Descriptor for `CreateAccompanyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createAccompanyResponseDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVBY2NvbXBhbnlSZXNwb25zZRIdCgJhYxgBIAEoCzINLnBiLkFjY29tcGFueVICYW'
    'M=');

@$core.Deprecated('Use getAccompanyRequestDescriptor instead')
const GetAccompanyRequest$json = {
  '1': 'GetAccompanyRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
  ],
};

/// Descriptor for `GetAccompanyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAccompanyRequestDescriptor = $convert.base64Decode(
    'ChNHZXRBY2NvbXBhbnlSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklE');

@$core.Deprecated('Use getAccompanyResponseDescriptor instead')
const GetAccompanyResponse$json = {
  '1': 'GetAccompanyResponse',
  '2': [
    {'1': 'ac', '3': 1, '4': 1, '5': 11, '6': '.pb.Accompany', '10': 'ac'},
  ],
};

/// Descriptor for `GetAccompanyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getAccompanyResponseDescriptor = $convert.base64Decode(
    'ChRHZXRBY2NvbXBhbnlSZXNwb25zZRIdCgJhYxgBIAEoCzINLnBiLkFjY29tcGFueVICYWM=');

@$core.Deprecated('Use updateAccompanyRequestDescriptor instead')
const UpdateAccompanyRequest$json = {
  '1': 'UpdateAccompanyRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'Era', '3': 2, '4': 1, '5': 5, '10': 'Era'},
    {'1': 'Speaklanguage', '3': 3, '4': 3, '5': 9, '10': 'Speaklanguage'},
    {'1': 'FindType', '3': 4, '4': 1, '5': 9, '10': 'FindType'},
    {'1': 'Sociability', '3': 5, '4': 1, '5': 9, '10': 'Sociability'},
  ],
};

/// Descriptor for `UpdateAccompanyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAccompanyRequestDescriptor = $convert.base64Decode(
    'ChZVcGRhdGVBY2NvbXBhbnlSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklEEh'
    'AKA0VyYRgCIAEoBVIDRXJhEiQKDVNwZWFrbGFuZ3VhZ2UYAyADKAlSDVNwZWFrbGFuZ3VhZ2US'
    'GgoIRmluZFR5cGUYBCABKAlSCEZpbmRUeXBlEiAKC1NvY2lhYmlsaXR5GAUgASgJUgtTb2NpYW'
    'JpbGl0eQ==');

@$core.Deprecated('Use updateAccompanyResponseDescriptor instead')
const UpdateAccompanyResponse$json = {
  '1': 'UpdateAccompanyResponse',
  '2': [
    {'1': 'ac', '3': 1, '4': 1, '5': 11, '6': '.pb.Accompany', '10': 'ac'},
  ],
};

/// Descriptor for `UpdateAccompanyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateAccompanyResponseDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVBY2NvbXBhbnlSZXNwb25zZRIdCgJhYxgBIAEoCzINLnBiLkFjY29tcGFueVICYW'
    'M=');

@$core.Deprecated('Use deleteAccompanyRequestDescriptor instead')
const DeleteAccompanyRequest$json = {
  '1': 'DeleteAccompanyRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
  ],
};

/// Descriptor for `DeleteAccompanyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteAccompanyRequestDescriptor = $convert.base64Decode(
    'ChZEZWxldGVBY2NvbXBhbnlSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklE');

