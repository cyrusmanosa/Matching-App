//
//  Generated code. Do not modify.
//  source: search.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class sH extends $pb.GeneratedMessage {
  factory sH({
    $core.Iterable<$core.int>? resultID,
    $core.String? rank,
    $core.int? len,
  }) {
    final $result = create();
    if (resultID != null) {
      $result.resultID.addAll(resultID);
    }
    if (rank != null) {
      $result.rank = rank;
    }
    if (len != null) {
      $result.len = len;
    }
    return $result;
  }
  sH._() : super();
  factory sH.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory sH.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'sH', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'resultID', $pb.PbFieldType.K3, protoName: 'resultID')
    ..aOS(2, _omitFieldNames ? '' : 'rank')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'len', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  sH clone() => sH()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  sH copyWith(void Function(sH) updates) => super.copyWith((message) => updates(message as sH)) as sH;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static sH create() => sH._();
  sH createEmptyInstance() => create();
  static $pb.PbList<sH> createRepeated() => $pb.PbList<sH>();
  @$core.pragma('dart2js:noInline')
  static sH getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<sH>(create);
  static sH? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get resultID => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get rank => $_getSZ(1);
  @$pb.TagNumber(2)
  set rank($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearRank() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get len => $_getIZ(2);
  @$pb.TagNumber(3)
  set len($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLen() => $_has(2);
  @$pb.TagNumber(3)
  void clearLen() => clearField(3);
}

class sL extends $pb.GeneratedMessage {
  factory sL({
    $core.Iterable<$core.int>? resultID,
    $core.String? rank,
    $core.int? len,
  }) {
    final $result = create();
    if (resultID != null) {
      $result.resultID.addAll(resultID);
    }
    if (rank != null) {
      $result.rank = rank;
    }
    if (len != null) {
      $result.len = len;
    }
    return $result;
  }
  sL._() : super();
  factory sL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory sL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'sL', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'resultID', $pb.PbFieldType.K3, protoName: 'resultID')
    ..aOS(2, _omitFieldNames ? '' : 'rank')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'len', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  sL clone() => sL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  sL copyWith(void Function(sL) updates) => super.copyWith((message) => updates(message as sL)) as sL;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static sL create() => sL._();
  sL createEmptyInstance() => create();
  static $pb.PbList<sL> createRepeated() => $pb.PbList<sL>();
  @$core.pragma('dart2js:noInline')
  static sL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<sL>(create);
  static sL? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get resultID => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get rank => $_getSZ(1);
  @$pb.TagNumber(2)
  set rank($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearRank() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get len => $_getIZ(2);
  @$pb.TagNumber(3)
  set len($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLen() => $_has(2);
  @$pb.TagNumber(3)
  void clearLen() => clearField(3);
}

class sA extends $pb.GeneratedMessage {
  factory sA({
    $core.Iterable<$core.int>? resultID,
    $core.String? rank,
    $core.int? len,
  }) {
    final $result = create();
    if (resultID != null) {
      $result.resultID.addAll(resultID);
    }
    if (rank != null) {
      $result.rank = rank;
    }
    if (len != null) {
      $result.len = len;
    }
    return $result;
  }
  sA._() : super();
  factory sA.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory sA.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'sA', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..p<$core.int>(1, _omitFieldNames ? '' : 'resultID', $pb.PbFieldType.K3, protoName: 'resultID')
    ..aOS(2, _omitFieldNames ? '' : 'rank')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'len', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  sA clone() => sA()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  sA copyWith(void Function(sA) updates) => super.copyWith((message) => updates(message as sA)) as sA;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static sA create() => sA._();
  sA createEmptyInstance() => create();
  static $pb.PbList<sA> createRepeated() => $pb.PbList<sA>();
  @$core.pragma('dart2js:noInline')
  static sA getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<sA>(create);
  static sA? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<$core.int> get resultID => $_getList(0);

  @$pb.TagNumber(2)
  $core.String get rank => $_getSZ(1);
  @$pb.TagNumber(2)
  set rank($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRank() => $_has(1);
  @$pb.TagNumber(2)
  void clearRank() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get len => $_getIZ(2);
  @$pb.TagNumber(3)
  set len($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLen() => $_has(2);
  @$pb.TagNumber(3)
  void clearLen() => clearField(3);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
