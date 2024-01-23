//
//  Generated code. Do not modify.
//  source: rpc_socialmedia.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createSocialMediaRequestDescriptor instead')
const CreateSocialMediaRequest$json = {
  '1': 'CreateSocialMediaRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'TargetID', '3': 2, '4': 1, '5': 5, '10': 'TargetID'},
    {'1': 'Image', '3': 3, '4': 1, '5': 8, '10': 'Image'},
    {'1': 'Contact', '3': 4, '4': 1, '5': 8, '10': 'Contact'},
    {'1': 'Location', '3': 5, '4': 1, '5': 8, '10': 'Location'},
    {'1': 'Appointment', '3': 6, '4': 1, '5': 8, '10': 'Appointment'},
    {'1': 'Sns', '3': 7, '4': 1, '5': 8, '10': 'Sns'},
  ],
};

/// Descriptor for `CreateSocialMediaRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSocialMediaRequestDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVTb2NpYWxNZWRpYVJlcXVlc3QSFgoGVXNlcklEGAEgASgFUgZVc2VySUQSGgoIVG'
    'FyZ2V0SUQYAiABKAVSCFRhcmdldElEEhQKBUltYWdlGAMgASgIUgVJbWFnZRIYCgdDb250YWN0'
    'GAQgASgIUgdDb250YWN0EhoKCExvY2F0aW9uGAUgASgIUghMb2NhdGlvbhIgCgtBcHBvaW50bW'
    'VudBgGIAEoCFILQXBwb2ludG1lbnQSEAoDU25zGAcgASgIUgNTbnM=');

@$core.Deprecated('Use createSocialMediaResponseDescriptor instead')
const CreateSocialMediaResponse$json = {
  '1': 'CreateSocialMediaResponse',
  '2': [
    {'1': 'sm', '3': 1, '4': 1, '5': 11, '6': '.pb.SocialMedia', '10': 'sm'},
  ],
};

/// Descriptor for `CreateSocialMediaResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSocialMediaResponseDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVTb2NpYWxNZWRpYVJlc3BvbnNlEh8KAnNtGAEgASgLMg8ucGIuU29jaWFsTWVkaW'
    'FSAnNt');

@$core.Deprecated('Use updateSocialMediaRequestDescriptor instead')
const UpdateSocialMediaRequest$json = {
  '1': 'UpdateSocialMediaRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'TargetID', '3': 2, '4': 1, '5': 5, '10': 'TargetID'},
    {'1': 'Image', '3': 3, '4': 1, '5': 8, '10': 'Image'},
    {'1': 'Contact', '3': 4, '4': 1, '5': 8, '10': 'Contact'},
    {'1': 'Location', '3': 5, '4': 1, '5': 8, '10': 'Location'},
    {'1': 'Appointment', '3': 6, '4': 1, '5': 8, '10': 'Appointment'},
    {'1': 'Sns', '3': 7, '4': 1, '5': 8, '10': 'Sns'},
  ],
};

/// Descriptor for `UpdateSocialMediaRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSocialMediaRequestDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVTb2NpYWxNZWRpYVJlcXVlc3QSFgoGVXNlcklEGAEgASgFUgZVc2VySUQSGgoIVG'
    'FyZ2V0SUQYAiABKAVSCFRhcmdldElEEhQKBUltYWdlGAMgASgIUgVJbWFnZRIYCgdDb250YWN0'
    'GAQgASgIUgdDb250YWN0EhoKCExvY2F0aW9uGAUgASgIUghMb2NhdGlvbhIgCgtBcHBvaW50bW'
    'VudBgGIAEoCFILQXBwb2ludG1lbnQSEAoDU25zGAcgASgIUgNTbnM=');

@$core.Deprecated('Use updateSocialMediaResponseDescriptor instead')
const UpdateSocialMediaResponse$json = {
  '1': 'UpdateSocialMediaResponse',
  '2': [
    {'1': 'sm', '3': 1, '4': 1, '5': 11, '6': '.pb.SocialMedia', '10': 'sm'},
  ],
};

/// Descriptor for `UpdateSocialMediaResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSocialMediaResponseDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVTb2NpYWxNZWRpYVJlc3BvbnNlEh8KAnNtGAEgASgLMg8ucGIuU29jaWFsTWVkaW'
    'FSAnNt');

@$core.Deprecated('Use getSocialMediaRequestDescriptor instead')
const GetSocialMediaRequest$json = {
  '1': 'GetSocialMediaRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'TargetID', '3': 2, '4': 1, '5': 5, '10': 'TargetID'},
  ],
};

/// Descriptor for `GetSocialMediaRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSocialMediaRequestDescriptor = $convert.base64Decode(
    'ChVHZXRTb2NpYWxNZWRpYVJlcXVlc3QSFgoGVXNlcklEGAEgASgFUgZVc2VySUQSGgoIVGFyZ2'
    'V0SUQYAiABKAVSCFRhcmdldElE');

@$core.Deprecated('Use getSocialMediaResponseDescriptor instead')
const GetSocialMediaResponse$json = {
  '1': 'GetSocialMediaResponse',
  '2': [
    {'1': 'sm', '3': 1, '4': 1, '5': 11, '6': '.pb.SocialMedia', '10': 'sm'},
  ],
};

/// Descriptor for `GetSocialMediaResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSocialMediaResponseDescriptor = $convert.base64Decode(
    'ChZHZXRTb2NpYWxNZWRpYVJlc3BvbnNlEh8KAnNtGAEgASgLMg8ucGIuU29jaWFsTWVkaWFSAn'
    'Nt');

@$core.Deprecated('Use deleteSocialMediaRequestDescriptor instead')
const DeleteSocialMediaRequest$json = {
  '1': 'DeleteSocialMediaRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
  ],
};

/// Descriptor for `DeleteSocialMediaRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSocialMediaRequestDescriptor = $convert.base64Decode(
    'ChhEZWxldGVTb2NpYWxNZWRpYVJlcXVlc3QSFgoGVXNlcklEGAEgASgFUgZVc2VySUQ=');

