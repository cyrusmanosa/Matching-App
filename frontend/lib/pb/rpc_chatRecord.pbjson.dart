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

@$core.Deprecated('Use createChatTableRequestDescriptor instead')
const CreateChatTableRequest$json = {
  '1': 'CreateChatTableRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
  ],
};

/// Descriptor for `CreateChatTableRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChatTableRequestDescriptor = $convert.base64Decode(
    'ChZDcmVhdGVDaGF0VGFibGVSZXF1ZXN0EhYKBlVzZXJJRBgBIAEoBVIGVXNlcklE');

@$core.Deprecated('Use createChatRecordRequestDescriptor instead')
const CreateChatRecordRequest$json = {
  '1': 'CreateChatRecordRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'TargetID', '3': 2, '4': 1, '5': 5, '10': 'TargetID'},
    {'1': 'RoleType', '3': 3, '4': 1, '5': 9, '10': 'RoleType'},
    {'1': 'MediaType', '3': 4, '4': 1, '5': 9, '10': 'MediaType'},
    {'1': 'Media', '3': 6, '4': 1, '5': 12, '10': 'Media'},
  ],
};

/// Descriptor for `CreateChatRecordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createChatRecordRequestDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVDaGF0UmVjb3JkUmVxdWVzdBIWCgZVc2VySUQYASABKAVSBlVzZXJJRBIaCghUYX'
    'JnZXRJRBgCIAEoBVIIVGFyZ2V0SUQSGgoIUm9sZVR5cGUYAyABKAlSCFJvbGVUeXBlEhwKCU1l'
    'ZGlhVHlwZRgEIAEoCVIJTWVkaWFUeXBlEhQKBU1lZGlhGAYgASgMUgVNZWRpYQ==');

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
    {'1': 'ChatRecordNoID', '3': 1, '4': 3, '5': 11, '6': '.pb.ChatRecordNoID', '10': 'ChatRecordNoID'},
  ],
};

/// Descriptor for `GetChatRecordResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatRecordResponseDescriptor = $convert.base64Decode(
    'ChVHZXRDaGF0UmVjb3JkUmVzcG9uc2USOgoOQ2hhdFJlY29yZE5vSUQYASADKAsyEi5wYi5DaG'
    'F0UmVjb3JkTm9JRFIOQ2hhdFJlY29yZE5vSUQ=');

@$core.Deprecated('Use getTargetIDRequestDescriptor instead')
const GetTargetIDRequest$json = {
  '1': 'GetTargetIDRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
  ],
};

/// Descriptor for `GetTargetIDRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTargetIDRequestDescriptor = $convert.base64Decode(
    'ChJHZXRUYXJnZXRJRFJlcXVlc3QSFgoGVXNlcklEGAEgASgFUgZVc2VySUQ=');

@$core.Deprecated('Use getTargetIDResponseDescriptor instead')
const GetTargetIDResponse$json = {
  '1': 'GetTargetIDResponse',
  '2': [
    {'1': 'TargetID', '3': 1, '4': 3, '5': 5, '10': 'TargetID'},
  ],
};

/// Descriptor for `GetTargetIDResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTargetIDResponseDescriptor = $convert.base64Decode(
    'ChNHZXRUYXJnZXRJRFJlc3BvbnNlEhoKCFRhcmdldElEGAEgAygFUghUYXJnZXRJRA==');

@$core.Deprecated('Use getLastMsgRequestDescriptor instead')
const GetLastMsgRequest$json = {
  '1': 'GetLastMsgRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'TargetID', '3': 2, '4': 1, '5': 5, '10': 'TargetID'},
  ],
};

/// Descriptor for `GetLastMsgRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLastMsgRequestDescriptor = $convert.base64Decode(
    'ChFHZXRMYXN0TXNnUmVxdWVzdBIWCgZVc2VySUQYASABKAVSBlVzZXJJRBIaCghUYXJnZXRJRB'
    'gCIAEoBVIIVGFyZ2V0SUQ=');

@$core.Deprecated('Use getLastMsgResponseDescriptor instead')
const GetLastMsgResponse$json = {
  '1': 'GetLastMsgResponse',
  '2': [
    {'1': 'MediaType', '3': 1, '4': 1, '5': 9, '10': 'MediaType'},
    {'1': 'Media', '3': 2, '4': 1, '5': 12, '10': 'Media'},
    {'1': 'IsRead', '3': 3, '4': 1, '5': 8, '10': 'IsRead'},
  ],
};

/// Descriptor for `GetLastMsgResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLastMsgResponseDescriptor = $convert.base64Decode(
    'ChJHZXRMYXN0TXNnUmVzcG9uc2USHAoJTWVkaWFUeXBlGAEgASgJUglNZWRpYVR5cGUSFAoFTW'
    'VkaWEYAiABKAxSBU1lZGlhEhYKBklzUmVhZBgDIAEoCFIGSXNSZWFk');

@$core.Deprecated('Use getChatRowRequestDescriptor instead')
const GetChatRowRequest$json = {
  '1': 'GetChatRowRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
  ],
};

/// Descriptor for `GetChatRowRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatRowRequestDescriptor = $convert.base64Decode(
    'ChFHZXRDaGF0Um93UmVxdWVzdBIWCgZVc2VySUQYASABKAVSBlVzZXJJRA==');

@$core.Deprecated('Use getChatRowResponseDescriptor instead')
const GetChatRowResponse$json = {
  '1': 'GetChatRowResponse',
  '2': [
    {'1': 'Row', '3': 1, '4': 1, '5': 5, '10': 'Row'},
  ],
};

/// Descriptor for `GetChatRowResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getChatRowResponseDescriptor = $convert.base64Decode(
    'ChJHZXRDaGF0Um93UmVzcG9uc2USEAoDUm93GAEgASgFUgNSb3c=');

@$core.Deprecated('Use updateChatRecordRequestDescriptor instead')
const UpdateChatRecordRequest$json = {
  '1': 'UpdateChatRecordRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'TargetID', '3': 2, '4': 1, '5': 5, '10': 'TargetID'},
    {'1': 'RoleType', '3': 3, '4': 1, '5': 9, '10': 'RoleType'},
    {'1': 'MediaType', '3': 4, '4': 1, '5': 9, '10': 'MediaType'},
    {'1': 'Media', '3': 5, '4': 1, '5': 12, '10': 'Media'},
    {'1': 'CreateAt', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'CreateAt'},
  ],
};

/// Descriptor for `UpdateChatRecordRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateChatRecordRequestDescriptor = $convert.base64Decode(
    'ChdVcGRhdGVDaGF0UmVjb3JkUmVxdWVzdBIWCgZVc2VySUQYASABKAVSBlVzZXJJRBIaCghUYX'
    'JnZXRJRBgCIAEoBVIIVGFyZ2V0SUQSGgoIUm9sZVR5cGUYAyABKAlSCFJvbGVUeXBlEhwKCU1l'
    'ZGlhVHlwZRgEIAEoCVIJTWVkaWFUeXBlEhQKBU1lZGlhGAUgASgMUgVNZWRpYRI2CghDcmVhdG'
    'VBdBgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCENyZWF0ZUF0');

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

@$core.Deprecated('Use updateReadRequestDescriptor instead')
const UpdateReadRequest$json = {
  '1': 'UpdateReadRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'TargetID', '3': 2, '4': 1, '5': 5, '10': 'TargetID'},
  ],
};

/// Descriptor for `UpdateReadRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateReadRequestDescriptor = $convert.base64Decode(
    'ChFVcGRhdGVSZWFkUmVxdWVzdBIWCgZVc2VySUQYASABKAVSBlVzZXJJRBIaCghUYXJnZXRJRB'
    'gCIAEoBVIIVGFyZ2V0SUQ=');

@$core.Deprecated('Use deleteChatTableRequestDescriptor instead')
const DeleteChatTableRequest$json = {
  '1': 'DeleteChatTableRequest',
  '2': [
    {'1': 'UserID', '3': 1, '4': 1, '5': 5, '10': 'UserID'},
  ],
};

/// Descriptor for `DeleteChatTableRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteChatTableRequestDescriptor = $convert.base64Decode(
    'ChZEZWxldGVDaGF0VGFibGVSZXF1ZXN0EhYKBlVzZXJJRBgBIAEoBVIGVXNlcklE');

