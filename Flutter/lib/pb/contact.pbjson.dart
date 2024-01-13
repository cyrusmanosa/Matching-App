//
//  Generated code. Do not modify.
//  source: contact.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use contactDescriptor instead')
const Contact$json = {
  '1': 'Contact',
  '2': [
    {'1': 'ContactID', '3': 1, '4': 1, '5': 5, '10': 'ContactID'},
    {'1': 'UserID', '3': 2, '4': 1, '5': 5, '10': 'UserID'},
    {'1': 'ContactType', '3': 3, '4': 1, '5': 9, '10': 'ContactType'},
    {'1': 'Message', '3': 4, '4': 1, '5': 9, '10': 'Message'},
    {'1': 'Status', '3': 5, '4': 1, '5': 9, '10': 'Status'},
    {'1': 'ContactAt', '3': 6, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'ContactAt'},
  ],
};

/// Descriptor for `Contact`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List contactDescriptor = $convert.base64Decode(
    'CgdDb250YWN0EhwKCUNvbnRhY3RJRBgBIAEoBVIJQ29udGFjdElEEhYKBlVzZXJJRBgCIAEoBV'
    'IGVXNlcklEEiAKC0NvbnRhY3RUeXBlGAMgASgJUgtDb250YWN0VHlwZRIYCgdNZXNzYWdlGAQg'
    'ASgJUgdNZXNzYWdlEhYKBlN0YXR1cxgFIAEoCVIGU3RhdHVzEjgKCUNvbnRhY3RBdBgGIAEoCz'
    'IaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCUNvbnRhY3RBdA==');

