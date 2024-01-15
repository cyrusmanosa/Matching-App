//
//  Generated code. Do not modify.
//  source: rpc_images.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use createImagesRequestDescriptor instead')
const CreateImagesRequest$json = {
  '1': 'CreateImagesRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'Img1', '3': 2, '4': 1, '5': 12, '10': 'Img1'},
    {'1': 'Img2', '3': 3, '4': 1, '5': 12, '10': 'Img2'},
    {'1': 'Img3', '3': 4, '4': 1, '5': 12, '10': 'Img3'},
    {'1': 'Img4', '3': 5, '4': 1, '5': 12, '10': 'Img4'},
    {'1': 'img5', '3': 6, '4': 1, '5': 12, '10': 'img5'},
  ],
};

/// Descriptor for `CreateImagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createImagesRequestDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVJbWFnZXNSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklEEhIKBE'
    'ltZzEYAiABKAxSBEltZzESEgoESW1nMhgDIAEoDFIESW1nMhISCgRJbWczGAQgASgMUgRJbWcz'
    'EhIKBEltZzQYBSABKAxSBEltZzQSEgoEaW1nNRgGIAEoDFIEaW1nNQ==');

@$core.Deprecated('Use createImagesResponseDescriptor instead')
const CreateImagesResponse$json = {
  '1': 'CreateImagesResponse',
  '2': [
    {'1': 'Img', '3': 1, '4': 1, '5': 11, '6': '.pb.Images', '10': 'Img'},
  ],
};

/// Descriptor for `CreateImagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createImagesResponseDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVJbWFnZXNSZXNwb25zZRIcCgNJbWcYASABKAsyCi5wYi5JbWFnZXNSA0ltZw==');

@$core.Deprecated('Use getImagesRequestDescriptor instead')
const GetImagesRequest$json = {
  '1': 'GetImagesRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'UserID', '3': 2, '4': 1, '5': 5, '10': 'UserID'},
  ],
};

/// Descriptor for `GetImagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getImagesRequestDescriptor = $convert.base64Decode(
    'ChBHZXRJbWFnZXNSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklEEhYKBlVzZX'
    'JJRBgCIAEoBVIGVXNlcklE');

@$core.Deprecated('Use getImagesResponseDescriptor instead')
const GetImagesResponse$json = {
  '1': 'GetImagesResponse',
  '2': [
    {'1': 'Img', '3': 1, '4': 1, '5': 11, '6': '.pb.Images', '10': 'Img'},
  ],
};

/// Descriptor for `GetImagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getImagesResponseDescriptor = $convert.base64Decode(
    'ChFHZXRJbWFnZXNSZXNwb25zZRIcCgNJbWcYASABKAsyCi5wYi5JbWFnZXNSA0ltZw==');

@$core.Deprecated('Use updateImagesRequestDescriptor instead')
const UpdateImagesRequest$json = {
  '1': 'UpdateImagesRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
    {'1': 'Img1', '3': 2, '4': 1, '5': 12, '10': 'Img1'},
    {'1': 'Img2', '3': 3, '4': 1, '5': 12, '10': 'Img2'},
    {'1': 'Img3', '3': 4, '4': 1, '5': 12, '10': 'Img3'},
    {'1': 'Img4', '3': 5, '4': 1, '5': 12, '10': 'Img4'},
    {'1': 'img5', '3': 6, '4': 1, '5': 12, '10': 'img5'},
  ],
};

/// Descriptor for `UpdateImagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateImagesRequestDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVJbWFnZXNSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklEEhIKBE'
    'ltZzEYAiABKAxSBEltZzESEgoESW1nMhgDIAEoDFIESW1nMhISCgRJbWczGAQgASgMUgRJbWcz'
    'EhIKBEltZzQYBSABKAxSBEltZzQSEgoEaW1nNRgGIAEoDFIEaW1nNQ==');

@$core.Deprecated('Use updateImagesResponseDescriptor instead')
const UpdateImagesResponse$json = {
  '1': 'UpdateImagesResponse',
  '2': [
    {'1': 'Img', '3': 1, '4': 1, '5': 11, '6': '.pb.Images', '10': 'Img'},
  ],
};

/// Descriptor for `UpdateImagesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateImagesResponseDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVJbWFnZXNSZXNwb25zZRIcCgNJbWcYASABKAsyCi5wYi5JbWFnZXNSA0ltZw==');

@$core.Deprecated('Use deleteImagesRequestDescriptor instead')
const DeleteImagesRequest$json = {
  '1': 'DeleteImagesRequest',
  '2': [
    {'1': 'SessionID', '3': 1, '4': 1, '5': 9, '10': 'SessionID'},
  ],
};

/// Descriptor for `DeleteImagesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteImagesRequestDescriptor = $convert.base64Decode(
    'ChNEZWxldGVJbWFnZXNSZXF1ZXN0EhwKCVNlc3Npb25JRBgBIAEoCVIJU2Vzc2lvbklE');

@$core.Deprecated('Use deleteResponseDescriptor instead')
const DeleteResponse$json = {
  '1': 'DeleteResponse',
  '2': [
    {'1': 'msg', '3': 1, '4': 1, '5': 9, '10': 'msg'},
  ],
};

/// Descriptor for `DeleteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteResponseDescriptor = $convert.base64Decode(
    'Cg5EZWxldGVSZXNwb25zZRIQCgNtc2cYASABKAlSA21zZw==');

