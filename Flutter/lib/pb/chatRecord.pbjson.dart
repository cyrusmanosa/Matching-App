//
//  Generated code. Do not modify.
//  source: chatRecord.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use chatRecordDescriptor instead')
const ChatRecord$json = {
  '1': 'ChatRecord',
  '2': [
    {'1': 'TargetID', '3': 1, '4': 1, '5': 5, '10': 'TargetID'},
    {'1': 'RoleType', '3': 2, '4': 1, '5': 9, '10': 'RoleType'},
    {'1': 'MediaType', '3': 3, '4': 1, '5': 9, '10': 'MediaType'},
    {'1': 'Message', '3': 4, '4': 1, '5': 9, '10': 'Message'},
    {'1': 'Media', '3': 5, '4': 1, '5': 9, '10': 'Media'},
    {'1': 'Isread', '3': 6, '4': 1, '5': 8, '10': 'Isread'},
    {'1': 'CreatedAt', '3': 7, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'CreatedAt'},
  ],
};

/// Descriptor for `ChatRecord`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chatRecordDescriptor = $convert.base64Decode(
    'CgpDaGF0UmVjb3JkEhoKCFRhcmdldElEGAEgASgFUghUYXJnZXRJRBIaCghSb2xlVHlwZRgCIA'
    'EoCVIIUm9sZVR5cGUSHAoJTWVkaWFUeXBlGAMgASgJUglNZWRpYVR5cGUSGAoHTWVzc2FnZRgE'
    'IAEoCVIHTWVzc2FnZRIUCgVNZWRpYRgFIAEoCVIFTWVkaWESFgoGSXNyZWFkGAYgASgIUgZJc3'
    'JlYWQSOAoJQ3JlYXRlZEF0GAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJQ3Jl'
    'YXRlZEF0');

