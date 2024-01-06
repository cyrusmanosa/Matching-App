//
//  Generated code. Do not modify.
//  source: rpc_hobby.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createHobbyRequestDescriptor instead')
const CreateHobbyRequest$json = {
  '1': 'CreateHobbyRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'Era', '3': 2, '4': 1, '5': 5, '10': 'Era'},
    {'1': 'City', '3': 3, '4': 1, '5': 9, '10': 'City'},
    {'1': 'Gender', '3': 4, '4': 1, '5': 9, '10': 'Gender'},
    {'1': 'Height', '3': 5, '4': 1, '5': 5, '10': 'Height'},
    {'1': 'Weight', '3': 6, '4': 1, '5': 5, '10': 'Weight'},
    {'1': 'Speaklanguage', '3': 7, '4': 1, '5': 9, '10': 'Speaklanguage'},
    {'1': 'FindType', '3': 8, '4': 1, '5': 9, '10': 'FindType'},
    {'1': 'FindTarget', '3': 9, '4': 1, '5': 9, '10': 'FindTarget'},
    {'1': 'Experience', '3': 10, '4': 1, '5': 5, '10': 'Experience'},
    {'1': 'Sociability', '3': 11, '4': 1, '5': 9, '10': 'Sociability'},
    {'1': 'Certification', '3': 12, '4': 1, '5': 8, '10': 'Certification'},
  ],
};

/// Descriptor for `CreateHobbyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createHobbyRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVIb2JieVJlcXVlc3QSHAoJU2Vzc2lvbklEGAEgASgJUglTZXNzaW9uSUQSEAoDRX'
    'JhGAIgASgFUgNFcmESEgoEQ2l0eRgDIAEoCVIEQ2l0eRIWCgZHZW5kZXIYBCABKAlSBkdlbmRl'
    'chIWCgZIZWlnaHQYBSABKAVSBkhlaWdodBIWCgZXZWlnaHQYBiABKAVSBldlaWdodBIkCg1TcG'
    'Vha2xhbmd1YWdlGAcgASgJUg1TcGVha2xhbmd1YWdlEhoKCEZpbmRUeXBlGAggASgJUghGaW5k'
    'VHlwZRIeCgpGaW5kVGFyZ2V0GAkgASgJUgpGaW5kVGFyZ2V0Eh4KCkV4cGVyaWVuY2UYCiABKA'
    'VSCkV4cGVyaWVuY2USIAoLU29jaWFiaWxpdHkYCyABKAlSC1NvY2lhYmlsaXR5EiQKDUNlcnRp'
    'ZmljYXRpb24YDCABKAhSDUNlcnRpZmljYXRpb24=');

@$core.Deprecated('Use createHobbyResponseDescriptor instead')
const CreateHobbyResponse$json = {
  '1': 'CreateHobbyResponse',
  '2': [
    {'1': 'h', '3': 1, '4': 1, '5': 11, '6': '.pb.Hobby', '10': 'h'},
  ],
};

/// Descriptor for `CreateHobbyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createHobbyResponseDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVIb2JieVJlc3BvbnNlEhcKAWgYASABKAsyCS5wYi5Ib2JieVIBaA==');

@$core.Deprecated('Use getHobbyRequestDescriptor instead')
const GetHobbyRequest$json = {
  '1': 'GetHobbyRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
  ],
};

/// Descriptor for `GetHobbyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHobbyRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRIb2JieVJlcXVlc3QSHAoJU2Vzc2lvbklEGAEgASgJUglTZXNzaW9uSUQ=');

@$core.Deprecated('Use getHobbyResponseDescriptor instead')
const GetHobbyResponse$json = {
  '1': 'GetHobbyResponse',
  '2': [
    {'1': 'h', '3': 1, '4': 1, '5': 11, '6': '.pb.Hobby', '10': 'h'},
  ],
};

/// Descriptor for `GetHobbyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getHobbyResponseDescriptor = $convert.base64Decode(
    'ChBHZXRIb2JieVJlc3BvbnNlEhcKAWgYASABKAsyCS5wYi5Ib2JieVIBaA==');

@$core.Deprecated('Use updateHobbyRequestDescriptor instead')
const UpdateHobbyRequest$json = {
  '1': 'UpdateHobbyRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'Era', '3': 2, '4': 1, '5': 5, '10': 'Era'},
    {'1': 'City', '3': 3, '4': 1, '5': 9, '10': 'City'},
    {'1': 'Gender', '3': 4, '4': 1, '5': 9, '10': 'Gender'},
    {'1': 'Height', '3': 5, '4': 1, '5': 5, '10': 'Height'},
    {'1': 'Weight', '3': 6, '4': 1, '5': 5, '10': 'Weight'},
    {'1': 'Speaklanguage', '3': 7, '4': 1, '5': 9, '10': 'Speaklanguage'},
    {'1': 'FindType', '3': 8, '4': 1, '5': 9, '10': 'FindType'},
    {'1': 'FindTarget', '3': 9, '4': 1, '5': 9, '10': 'FindTarget'},
    {'1': 'Experience', '3': 10, '4': 1, '5': 5, '10': 'Experience'},
    {'1': 'Sociability', '3': 11, '4': 1, '5': 9, '10': 'Sociability'},
    {'1': 'Certification', '3': 12, '4': 1, '5': 8, '10': 'Certification'},
  ],
};

/// Descriptor for `UpdateHobbyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateHobbyRequestDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVIb2JieVJlcXVlc3QSHAoJU2Vzc2lvbklEGAEgASgJUglTZXNzaW9uSUQSEAoDRX'
    'JhGAIgASgFUgNFcmESEgoEQ2l0eRgDIAEoCVIEQ2l0eRIWCgZHZW5kZXIYBCABKAlSBkdlbmRl'
    'chIWCgZIZWlnaHQYBSABKAVSBkhlaWdodBIWCgZXZWlnaHQYBiABKAVSBldlaWdodBIkCg1TcG'
    'Vha2xhbmd1YWdlGAcgASgJUg1TcGVha2xhbmd1YWdlEhoKCEZpbmRUeXBlGAggASgJUghGaW5k'
    'VHlwZRIeCgpGaW5kVGFyZ2V0GAkgASgJUgpGaW5kVGFyZ2V0Eh4KCkV4cGVyaWVuY2UYCiABKA'
    'VSCkV4cGVyaWVuY2USIAoLU29jaWFiaWxpdHkYCyABKAlSC1NvY2lhYmlsaXR5EiQKDUNlcnRp'
    'ZmljYXRpb24YDCABKAhSDUNlcnRpZmljYXRpb24=');

@$core.Deprecated('Use updateHobbyResponseDescriptor instead')
const UpdateHobbyResponse$json = {
  '1': 'UpdateHobbyResponse',
  '2': [
    {'1': 'h', '3': 1, '4': 1, '5': 11, '6': '.pb.Hobby', '10': 'h'},
  ],
};

/// Descriptor for `UpdateHobbyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateHobbyResponseDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVIb2JieVJlc3BvbnNlEhcKAWgYASABKAsyCS5wYi5Ib2JieVIBaA==');

@$core.Deprecated('Use deleteHobbyRequestDescriptor instead')
const DeleteHobbyRequest$json = {
  '1': 'DeleteHobbyRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
  ],
};

/// Descriptor for `DeleteHobbyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteHobbyRequestDescriptor = $convert.base64Decode(
    'ChJEZWxldGVIb2JieVJlcXVlc3QSHAoJU2Vzc2lvbklEGAEgASgJUglTZXNzaW9uSUQ=');

