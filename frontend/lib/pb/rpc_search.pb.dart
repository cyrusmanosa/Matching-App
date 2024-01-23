//
//  Generated code. Do not modify.
//  source: rpc_search.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'search.pb.dart' as $31;

class SearchRequestH extends $pb.GeneratedMessage {
  factory SearchRequestH({
    $core.String? sessionID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    return $result;
  }
  SearchRequestH._() : super();
  factory SearchRequestH.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchRequestH.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchRequestH', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchRequestH clone() => SearchRequestH()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchRequestH copyWith(void Function(SearchRequestH) updates) => super.copyWith((message) => updates(message as SearchRequestH)) as SearchRequestH;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchRequestH create() => SearchRequestH._();
  SearchRequestH createEmptyInstance() => create();
  static $pb.PbList<SearchRequestH> createRepeated() => $pb.PbList<SearchRequestH>();
  @$core.pragma('dart2js:noInline')
  static SearchRequestH getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchRequestH>(create);
  static SearchRequestH? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);
}

class SearchResponseH extends $pb.GeneratedMessage {
  factory SearchResponseH({
    $31.sH? resu,
  }) {
    final $result = create();
    if (resu != null) {
      $result.resu = resu;
    }
    return $result;
  }
  SearchResponseH._() : super();
  factory SearchResponseH.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchResponseH.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchResponseH', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$31.sH>(1, _omitFieldNames ? '' : 'resu', subBuilder: $31.sH.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchResponseH clone() => SearchResponseH()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchResponseH copyWith(void Function(SearchResponseH) updates) => super.copyWith((message) => updates(message as SearchResponseH)) as SearchResponseH;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchResponseH create() => SearchResponseH._();
  SearchResponseH createEmptyInstance() => create();
  static $pb.PbList<SearchResponseH> createRepeated() => $pb.PbList<SearchResponseH>();
  @$core.pragma('dart2js:noInline')
  static SearchResponseH getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchResponseH>(create);
  static SearchResponseH? _defaultInstance;

  @$pb.TagNumber(1)
  $31.sH get resu => $_getN(0);
  @$pb.TagNumber(1)
  set resu($31.sH v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResu() => $_has(0);
  @$pb.TagNumber(1)
  void clearResu() => clearField(1);
  @$pb.TagNumber(1)
  $31.sH ensureResu() => $_ensure(0);
}

class SearchRequestL extends $pb.GeneratedMessage {
  factory SearchRequestL({
    $core.String? sessionID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    return $result;
  }
  SearchRequestL._() : super();
  factory SearchRequestL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchRequestL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchRequestL', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchRequestL clone() => SearchRequestL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchRequestL copyWith(void Function(SearchRequestL) updates) => super.copyWith((message) => updates(message as SearchRequestL)) as SearchRequestL;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchRequestL create() => SearchRequestL._();
  SearchRequestL createEmptyInstance() => create();
  static $pb.PbList<SearchRequestL> createRepeated() => $pb.PbList<SearchRequestL>();
  @$core.pragma('dart2js:noInline')
  static SearchRequestL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchRequestL>(create);
  static SearchRequestL? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);
}

class SearchResponseL extends $pb.GeneratedMessage {
  factory SearchResponseL({
    $31.sL? resu,
  }) {
    final $result = create();
    if (resu != null) {
      $result.resu = resu;
    }
    return $result;
  }
  SearchResponseL._() : super();
  factory SearchResponseL.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchResponseL.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchResponseL', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$31.sL>(1, _omitFieldNames ? '' : 'resu', subBuilder: $31.sL.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchResponseL clone() => SearchResponseL()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchResponseL copyWith(void Function(SearchResponseL) updates) => super.copyWith((message) => updates(message as SearchResponseL)) as SearchResponseL;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchResponseL create() => SearchResponseL._();
  SearchResponseL createEmptyInstance() => create();
  static $pb.PbList<SearchResponseL> createRepeated() => $pb.PbList<SearchResponseL>();
  @$core.pragma('dart2js:noInline')
  static SearchResponseL getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchResponseL>(create);
  static SearchResponseL? _defaultInstance;

  @$pb.TagNumber(1)
  $31.sL get resu => $_getN(0);
  @$pb.TagNumber(1)
  set resu($31.sL v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResu() => $_has(0);
  @$pb.TagNumber(1)
  void clearResu() => clearField(1);
  @$pb.TagNumber(1)
  $31.sL ensureResu() => $_ensure(0);
}

class SearchRequestA extends $pb.GeneratedMessage {
  factory SearchRequestA({
    $core.String? sessionID,
  }) {
    final $result = create();
    if (sessionID != null) {
      $result.sessionID = sessionID;
    }
    return $result;
  }
  SearchRequestA._() : super();
  factory SearchRequestA.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchRequestA.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchRequestA', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'SessionID', protoName: 'SessionID')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchRequestA clone() => SearchRequestA()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchRequestA copyWith(void Function(SearchRequestA) updates) => super.copyWith((message) => updates(message as SearchRequestA)) as SearchRequestA;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchRequestA create() => SearchRequestA._();
  SearchRequestA createEmptyInstance() => create();
  static $pb.PbList<SearchRequestA> createRepeated() => $pb.PbList<SearchRequestA>();
  @$core.pragma('dart2js:noInline')
  static SearchRequestA getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchRequestA>(create);
  static SearchRequestA? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get sessionID => $_getSZ(0);
  @$pb.TagNumber(1)
  set sessionID($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSessionID() => $_has(0);
  @$pb.TagNumber(1)
  void clearSessionID() => clearField(1);
}

class SearchResponseA extends $pb.GeneratedMessage {
  factory SearchResponseA({
    $31.sA? resu,
  }) {
    final $result = create();
    if (resu != null) {
      $result.resu = resu;
    }
    return $result;
  }
  SearchResponseA._() : super();
  factory SearchResponseA.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SearchResponseA.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SearchResponseA', package: const $pb.PackageName(_omitMessageNames ? '' : 'pb'), createEmptyInstance: create)
    ..aOM<$31.sA>(1, _omitFieldNames ? '' : 'resu', subBuilder: $31.sA.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SearchResponseA clone() => SearchResponseA()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SearchResponseA copyWith(void Function(SearchResponseA) updates) => super.copyWith((message) => updates(message as SearchResponseA)) as SearchResponseA;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchResponseA create() => SearchResponseA._();
  SearchResponseA createEmptyInstance() => create();
  static $pb.PbList<SearchResponseA> createRepeated() => $pb.PbList<SearchResponseA>();
  @$core.pragma('dart2js:noInline')
  static SearchResponseA getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SearchResponseA>(create);
  static SearchResponseA? _defaultInstance;

  @$pb.TagNumber(1)
  $31.sA get resu => $_getN(0);
  @$pb.TagNumber(1)
  set resu($31.sA v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResu() => $_has(0);
  @$pb.TagNumber(1)
  void clearResu() => clearField(1);
  @$pb.TagNumber(1)
  $31.sA ensureResu() => $_ensure(0);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
