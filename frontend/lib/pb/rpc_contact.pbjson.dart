//
//  Generated code. Do not modify.
//  source: rpc_contact.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createContactRequestDescriptor instead')
const CreateContactRequest$json = {
  '1': 'CreateContactRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'ContactType', '3': 2, '4': 1, '5': 9, '10': 'ContactType'},
    {'1': 'Message', '3': 3, '4': 1, '5': 9, '10': 'Message'},
    {'1': 'status', '3': 4, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `CreateContactRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createContactRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVDb250YWN0UmVxdWVzdBIcCglTZXNzaW9uSUQYASABKAlSCVNlc3Npb25JRBIgCg'
    'tDb250YWN0VHlwZRgCIAEoCVILQ29udGFjdFR5cGUSGAoHTWVzc2FnZRgDIAEoCVIHTWVzc2Fn'
    'ZRIWCgZzdGF0dXMYBCABKAlSBnN0YXR1cw==');

@$core.Deprecated('Use createContactResponseDescriptor instead')
const CreateContactResponse$json = {
  '1': 'CreateContactResponse',
  '2': [
    {'1': 'c', '3': 1, '4': 1, '5': 11, '6': '.pb.Contact', '10': 'c'},
  ],
};

/// Descriptor for `CreateContactResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createContactResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVDb250YWN0UmVzcG9uc2USGQoBYxgBIAEoCzILLnBiLkNvbnRhY3RSAWM=');

@$core.Deprecated('Use getContactRequestDescriptor instead')
const GetContactRequest$json = {
  '1': 'GetContactRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'ContactID', '3': 2, '4': 1, '5': 5, '10': 'ContactID'},
  ],
};

/// Descriptor for `GetContactRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getContactRequestDescriptor = $convert.base64Decode(
    'ChFHZXRDb250YWN0UmVxdWVzdBIcCglTZXNzaW9uSUQYASABKAlSCVNlc3Npb25JRBIcCglDb2'
    '50YWN0SUQYAiABKAVSCUNvbnRhY3RJRA==');

@$core.Deprecated('Use getContactResponseDescriptor instead')
const GetContactResponse$json = {
  '1': 'GetContactResponse',
  '2': [
    {'1': 'c', '3': 1, '4': 1, '5': 11, '6': '.pb.Contact', '10': 'c'},
  ],
};

/// Descriptor for `GetContactResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getContactResponseDescriptor = $convert.base64Decode(
    'ChJHZXRDb250YWN0UmVzcG9uc2USGQoBYxgBIAEoCzILLnBiLkNvbnRhY3RSAWM=');

@$core.Deprecated('Use updateContactRequestDescriptor instead')
const UpdateContactRequest$json = {
  '1': 'UpdateContactRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'ContactID', '3': 2, '4': 1, '5': 5, '10': 'ContactID'},
    {'1': 'ContactType', '3': 3, '4': 1, '5': 9, '10': 'ContactType'},
    {'1': 'Message', '3': 4, '4': 1, '5': 9, '10': 'Message'},
    {'1': 'status', '3': 5, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `UpdateContactRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateContactRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVDb250YWN0UmVxdWVzdBIcCglTZXNzaW9uSUQYASABKAlSCVNlc3Npb25JRBIcCg'
    'lDb250YWN0SUQYAiABKAVSCUNvbnRhY3RJRBIgCgtDb250YWN0VHlwZRgDIAEoCVILQ29udGFj'
    'dFR5cGUSGAoHTWVzc2FnZRgEIAEoCVIHTWVzc2FnZRIWCgZzdGF0dXMYBSABKAlSBnN0YXR1cw'
    '==');

@$core.Deprecated('Use updateContactResponseDescriptor instead')
const UpdateContactResponse$json = {
  '1': 'UpdateContactResponse',
  '2': [
    {'1': 'c', '3': 1, '4': 1, '5': 11, '6': '.pb.Contact', '10': 'c'},
  ],
};

/// Descriptor for `UpdateContactResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateContactResponseDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVDb250YWN0UmVzcG9uc2USGQoBYxgBIAEoCzILLnBiLkNvbnRhY3RSAWM=');

@$core.Deprecated('Use deleteContactRequestDescriptor instead')
const DeleteContactRequest$json = {
  '1': 'DeleteContactRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'ContactID', '3': 2, '4': 1, '5': 5, '10': 'ContactID'},
  ],
};

/// Descriptor for `DeleteContactRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteContactRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVDb250YWN0UmVxdWVzdBIcCglTZXNzaW9uSUQYASABKAlSCVNlc3Npb25JRBIcCg'
    'lDb250YWN0SUQYAiABKAVSCUNvbnRhY3RJRA==');

