//
//  Generated code. Do not modify.
//  source: rpc_images.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'images.pb.dart' as $25;

/// Create
class CreateImagesRequest extends $pb.GeneratedMessage {
  factory CreateImagesRequest({
    $core.String? sessionID,
    $core.List<$core.int>? img1,
    $core.List<$core.int>? img2,
    $core.List<$core.int>? img3,
    $core.List<$core.int>? img4,
    $core.List<$core.int>? img5,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (img1 != null) {
      $result.img1 = img1;
    }
    if (img2 != null) {
      $result.img2 = img2;
    }
    if (img3 != null) {
      $result.img3 = img3;
    }
    if (img4 != null) {
      $result.img4 = img4;
    }
    if (img5 != null) {
      $result.img5 = img5;
    }
    return $result;
  }
  CreateImagesRequest._() : super();
  factory CreateImagesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateImagesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateImagesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'Img1', $pb.PbFieldType.OY, protoName: 'Img1')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'Img2', $pb.PbFieldType.OY, protoName: 'Img2')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'Img3', $pb.PbFieldType.OY, protoName: 'Img3')
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'Img4', $pb.PbFieldType.OY, protoName: 'Img4')
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'img5', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateImagesRequest clone() => CreateImagesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateImagesRequest copyWith(void Function(CreateImagesRequest) updates) => super.copyWith((message) => updates(message as CreateImagesRequest)) as CreateImagesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateImagesRequest create() => CreateImagesRequest._();
  CreateImagesRequest createEmptyInstance() => create();
  static $pb.PbList<CreateImagesRequest> createRepeated() => $pb.PbList<CreateImagesRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateImagesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateImagesRequest>(create);
  static CreateImagesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get img1 => $_getN(1);
  @$pb.TagNumber(2)
  set img1($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasImg1() => $_has(1);
  @$pb.TagNumber(2)
  void clearImg1() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get img2 => $_getN(2);
  @$pb.TagNumber(3)
  set img2($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImg2() => $_has(2);
  @$pb.TagNumber(3)
  void clearImg2() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get img3 => $_getN(3);
  @$pb.TagNumber(4)
  set img3($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasImg3() => $_has(3);
  @$pb.TagNumber(4)
  void clearImg3() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get img4 => $_getN(4);
  @$pb.TagNumber(5)
  set img4($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasImg4() => $_has(4);
  @$pb.TagNumber(5)
  void clearImg4() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get img5 => $_getN(5);
  @$pb.TagNumber(6)
  set img5($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasImg5() => $_has(5);
  @$pb.TagNumber(6)
  void clearImg5() => clearField(6);
}

class CreateImagesResponse extends $pb.GeneratedMessage {
  factory CreateImagesResponse({
    $25.Images? img,
  }) {
    final $result = create();
    if (img != null) {
      $result.img = img;
    }
    return $result;
  }
  CreateImagesResponse._() : super();
  factory CreateImagesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateImagesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateImagesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$25.Images>(1, _omitFieldNames ? '' : 'Img', protoName: 'Img', subBuilder: $25.Images.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateImagesResponse clone() => CreateImagesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateImagesResponse copyWith(void Function(CreateImagesResponse) updates) => super.copyWith((message) => updates(message as CreateImagesResponse)) as CreateImagesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateImagesResponse create() => CreateImagesResponse._();
  CreateImagesResponse createEmptyInstance() => create();
  static $pb.PbList<CreateImagesResponse> createRepeated() => $pb.PbList<CreateImagesResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateImagesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateImagesResponse>(create);
  static CreateImagesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $25.Images get img => $_getN(0);
  @$pb.TagNumber(1)
  set img($25.Images v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasImg() => $_has(0);
  @$pb.TagNumber(1)
  void clearImg() => clearField(1);
  @$pb.TagNumber(1)
  $25.Images ensureImg() => $_ensure(0);
}

/// Get
class GetImagesRequest extends $pb.GeneratedMessage {
  factory GetImagesRequest({
    $core.String? sessionID,
    $core.int? userID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (userID != null) {
      $result.userID = userID;
    }
    return $result;
  }
  GetImagesRequest._() : super();
  factory GetImagesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetImagesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetImagesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'UserID', $pb.PbFieldType.O3, protoName: 'UserID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetImagesRequest clone() => GetImagesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetImagesRequest copyWith(void Function(GetImagesRequest) updates) => super.copyWith((message) => updates(message as GetImagesRequest)) as GetImagesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetImagesRequest create() => GetImagesRequest._();
  GetImagesRequest createEmptyInstance() => create();
  static $pb.PbList<GetImagesRequest> createRepeated() => $pb.PbList<GetImagesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetImagesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetImagesRequest>(create);
  static GetImagesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get userID => $_getIZ(1);
  @$pb.TagNumber(2)
  set userID($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUserID() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserID() => clearField(2);
}

class GetImagesResponse extends $pb.GeneratedMessage {
  factory GetImagesResponse({
    $25.Images? img,
  }) {
    final $result = create();
    if (img != null) {
      $result.img = img;
    }
    return $result;
  }
  GetImagesResponse._() : super();
  factory GetImagesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetImagesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetImagesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$25.Images>(1, _omitFieldNames ? '' : 'Img', protoName: 'Img', subBuilder: $25.Images.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetImagesResponse clone() => GetImagesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetImagesResponse copyWith(void Function(GetImagesResponse) updates) => super.copyWith((message) => updates(message as GetImagesResponse)) as GetImagesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetImagesResponse create() => GetImagesResponse._();
  GetImagesResponse createEmptyInstance() => create();
  static $pb.PbList<GetImagesResponse> createRepeated() => $pb.PbList<GetImagesResponse>();
  @$core.pragma('dart2js:noInline')
  static GetImagesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetImagesResponse>(create);
  static GetImagesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $25.Images get img => $_getN(0);
  @$pb.TagNumber(1)
  set img($25.Images v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasImg() => $_has(0);
  @$pb.TagNumber(1)
  void clearImg() => clearField(1);
  @$pb.TagNumber(1)
  $25.Images ensureImg() => $_ensure(0);
}

/// Updat
class UpdateImagesRequest extends $pb.GeneratedMessage {
  factory UpdateImagesRequest({
    $core.String? sessionID,
    $core.List<$core.int>? img1,
    $core.List<$core.int>? img2,
    $core.List<$core.int>? img3,
    $core.List<$core.int>? img4,
    $core.List<$core.int>? img5,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    if (img1 != null) {
      $result.img1 = img1;
    }
    if (img2 != null) {
      $result.img2 = img2;
    }
    if (img3 != null) {
      $result.img3 = img3;
    }
    if (img4 != null) {
      $result.img4 = img4;
    }
    if (img5 != null) {
      $result.img5 = img5;
    }
    return $result;
  }
  UpdateImagesRequest._() : super();
  factory UpdateImagesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateImagesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateImagesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'Img1', $pb.PbFieldType.OY, protoName: 'Img1')
    ..a<$core.List<$core.int>>(3, _omitFieldNames ? '' : 'Img2', $pb.PbFieldType.OY, protoName: 'Img2')
    ..a<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'Img3', $pb.PbFieldType.OY, protoName: 'Img3')
    ..a<$core.List<$core.int>>(5, _omitFieldNames ? '' : 'Img4', $pb.PbFieldType.OY, protoName: 'Img4')
    ..a<$core.List<$core.int>>(6, _omitFieldNames ? '' : 'img5', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateImagesRequest clone() => UpdateImagesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateImagesRequest copyWith(void Function(UpdateImagesRequest) updates) => super.copyWith((message) => updates(message as UpdateImagesRequest)) as UpdateImagesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateImagesRequest create() => UpdateImagesRequest._();
  UpdateImagesRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateImagesRequest> createRepeated() => $pb.PbList<UpdateImagesRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateImagesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateImagesRequest>(create);
  static UpdateImagesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<$core.int> get img1 => $_getN(1);
  @$pb.TagNumber(2)
  set img1($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasImg1() => $_has(1);
  @$pb.TagNumber(2)
  void clearImg1() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<$core.int> get img2 => $_getN(2);
  @$pb.TagNumber(3)
  set img2($core.List<$core.int> v) { $_setBytes(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasImg2() => $_has(2);
  @$pb.TagNumber(3)
  void clearImg2() => clearField(3);

  @$pb.TagNumber(4)
  $core.List<$core.int> get img3 => $_getN(3);
  @$pb.TagNumber(4)
  set img3($core.List<$core.int> v) { $_setBytes(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasImg3() => $_has(3);
  @$pb.TagNumber(4)
  void clearImg3() => clearField(4);

  @$pb.TagNumber(5)
  $core.List<$core.int> get img4 => $_getN(4);
  @$pb.TagNumber(5)
  set img4($core.List<$core.int> v) { $_setBytes(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasImg4() => $_has(4);
  @$pb.TagNumber(5)
  void clearImg4() => clearField(5);

  @$pb.TagNumber(6)
  $core.List<$core.int> get img5 => $_getN(5);
  @$pb.TagNumber(6)
  set img5($core.List<$core.int> v) { $_setBytes(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasImg5() => $_has(5);
  @$pb.TagNumber(6)
  void clearImg5() => clearField(6);
}

class UpdateImagesResponse extends $pb.GeneratedMessage {
  factory UpdateImagesResponse({
    $25.Images? img,
  }) {
    final $result = create();
    if (img != null) {
      $result.img = img;
    }
    return $result;
  }
  UpdateImagesResponse._() : super();
  factory UpdateImagesResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateImagesResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateImagesResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$25.Images>(1, _omitFieldNames ? '' : 'Img', protoName: 'Img', subBuilder: $25.Images.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateImagesResponse clone() => UpdateImagesResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateImagesResponse copyWith(void Function(UpdateImagesResponse) updates) => super.copyWith((message) => updates(message as UpdateImagesResponse)) as UpdateImagesResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateImagesResponse create() => UpdateImagesResponse._();
  UpdateImagesResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateImagesResponse> createRepeated() => $pb.PbList<UpdateImagesResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateImagesResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateImagesResponse>(create);
  static UpdateImagesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $25.Images get img => $_getN(0);
  @$pb.TagNumber(1)
  set img($25.Images v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasImg() => $_has(0);
  @$pb.TagNumber(1)
  void clearImg() => clearField(1);
  @$pb.TagNumber(1)
  $25.Images ensureImg() => $_ensure(0);
}

/// Delete
class DeleteImagesRequest extends $pb.GeneratedMessage {
  factory DeleteImagesRequest({
    $core.String? sessionID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    return $result;
  }
  DeleteImagesRequest._() : super();
  factory DeleteImagesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteImagesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteImagesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteImagesRequest clone() => DeleteImagesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteImagesRequest copyWith(void Function(DeleteImagesRequest) updates) => super.copyWith((message) => updates(message as DeleteImagesRequest)) as DeleteImagesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteImagesRequest create() => DeleteImagesRequest._();
  DeleteImagesRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteImagesRequest> createRepeated() => $pb.PbList<DeleteImagesRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteImagesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteImagesRequest>(create);
  static DeleteImagesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);
}

class DeleteResponse extends $pb.GeneratedMessage {
  factory DeleteResponse({
    $core.String? msg,
  }) {
    final $result = create();
    if (msg != null) {
      $result.msg = msg;
    }
    return $result;
  }
  DeleteResponse._() : super();
  factory DeleteResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'msg')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteResponse clone() => DeleteResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteResponse copyWith(void Function(DeleteResponse) updates) => super.copyWith((message) => updates(message as DeleteResponse)) as DeleteResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteResponse create() => DeleteResponse._();
  DeleteResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteResponse> createRepeated() => $pb.PbList<DeleteResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteResponse>(create);
  static DeleteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get msg => $_getSZ(0);
  @$pb.TagNumber(1)
  set msg($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMsg() => $_has(0);
  @$pb.TagNumber(1)
  void clearMsg() => clearField(1);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
