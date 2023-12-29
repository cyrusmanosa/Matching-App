//
//  Generated code. Do not modify.
//  source: rpc_chatRecord.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createChatRecordRequestDescriptor instead')
const CreateChatRecordRequest$json = {
  '1': 'CreateChatRecordRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'TargetID', '3': 2, '4': 1, '5': 5, '10': 'TargetID'},
    {'1': 'MsgType', '3': 3, '4': 1, '5': 9, '10': 'MsgType'},
    {'1': 'Message', '3': 4, '4': 1, '5': 9, '10': 'Message'},
    {'1': 'Images', '3': 5, '4': 1, '5': 9, '10': 'Images'},
  ],
};

/// Descriptor for `CreateChatRecordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChatRecordRequestDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVDaGF0UmVjb3JkUmVxdWVzdBIWCgZVc2VySUQYASABKAVSBlVzZXJJRBIaCghUYX'
    'JnZXRJRBgCIAEoBVIIVGFyZ2V0SUQSGAoHTXNnVHlwZRgDIAEoCVIHTXNnVHlwZRIYCgdNZXNz'
    'YWdlGAQgASgJUgdNZXNzYWdlEhYKBkltYWdlcxgFIAEoCVIGSW1hZ2Vz');

@$core.Deprecated('Use createChatRecordResponseDescriptor instead')
const CreateChatRecordResponse$json = {
  '1': 'CreateChatRecordResponse',
  '2': [
    {'1': 'ChatRecord', '3': 1, '4': 1, '5': 11, '6': '.pb.ChatRecord', '10': 'ChatRecord'},
  ],
};

/// Descriptor for `CreateChatRecordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChatRecordResponseDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVDaGF0UmVjb3JkUmVzcG9uc2USLgoKQ2hhdFJlY29yZBgBIAEoCzIOLnBiLkNoYX'
    'RSZWNvcmRSCkNoYXRSZWNvcmQ=');

@$core.Deprecated('Use getChatRecordRequestDescriptor instead')
const GetChatRecordRequest$json = {
  '1': 'GetChatRecordRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'TargetID', '3': 2, '4': 1, '5': 5, '10': 'TargetID'},
  ],
};

/// Descriptor for `GetChatRecordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatRecordRequestDescriptor = $convert.base64Decode(
    'ChRHZXRDaGF0UmVjb3JkUmVxdWVzdBIWCgZVc2VySUQYASABKAVSBlVzZXJJRBIaCghUYXJnZX'
    'RJRBgCIAEoBVIIVGFyZ2V0SUQ=');

@$core.Deprecated('Use getChatRecordResponseDescriptor instead')
const GetChatRecordResponse$json = {
  '1': 'GetChatRecordResponse',
  '2': [
    {'1': 'ChatRecord', '3': 1, '4': 3, '5': 11, '6': '.pb.ChatRecord', '10': 'ChatRecord'},
  ],
};

/// Descriptor for `GetChatRecordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatRecordResponseDescriptor = $convert.base64Decode(
    'ChVHZXRDaGF0UmVjb3JkUmVzcG9uc2USLgoKQ2hhdFJlY29yZBgBIAMoCzIOLnBiLkNoYXRSZW'
    'NvcmRSCkNoYXRSZWNvcmQ=');

@$core.Deprecated('Use updateChatRecordRequestDescriptor instead')
const UpdateChatRecordRequest$json = {
  '1': 'UpdateChatRecordRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'TargetID', '3': 2, '4': 1, '5': 5, '10': 'TargetID'},
    {'1': 'MsgType', '3': 3, '4': 1, '5': 9, '10': 'MsgType'},
    {'1': 'Message', '3': 4, '4': 1, '5': 9, '10': 'Message'},
    {'1': 'CreateAt', '3': 5, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'CreateAt'},
  ],
};

/// Descriptor for `UpdateChatRecordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateChatRecordRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVDaGF0UmVjb3JkUmVxdWVzdBIWCgZVc2VySUQYASABKAVSBlVzZXJJRBIaCghUYX'
    'JnZXRJRBgCIAEoBVIIVGFyZ2V0SUQSGAoHTXNnVHlwZRgDIAEoCVIHTXNnVHlwZRIYCgdNZXNz'
    'YWdlGAQgASgJUgdNZXNzYWdlEjYKCENyZWF0ZUF0GAUgASgLMhouZ29vZ2xlLnByb3RvYnVmLl'
    'RpbWVzdGFtcFIIQ3JlYXRlQXQ=');

@$core.Deprecated('Use updateChatRecordResponseDescriptor instead')
const UpdateChatRecordResponse$json = {
  '1': 'UpdateChatRecordResponse',
  '2': [
    {'1': 'ChatRecord', '3': 1, '4': 1, '5': 11, '6': '.pb.ChatRecord', '10': 'ChatRecord'},
  ],
};

/// Descriptor for `UpdateChatRecordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateChatRecordResponseDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVDaGF0UmVjb3JkUmVzcG9uc2USLgoKQ2hhdFJlY29yZBgBIAEoCzIOLnBiLkNoYX'
    'RSZWNvcmRSCkNoYXRSZWNvcmQ=');

