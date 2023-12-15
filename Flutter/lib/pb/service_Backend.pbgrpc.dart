//
//  Generated code. Do not modify.
//  source: service_Backend.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'rpc_accompany.pb.dart' as $5;
import 'rpc_canChange.pb.dart' as $4;
import 'rpc_changeTarget.pb.dart' as $10;
import 'rpc_checkEmail.pb.dart' as $1;
import 'rpc_complaint.pb.dart' as $8;
import 'rpc_fix.pb.dart' as $3;
import 'rpc_hobby.pb.dart' as $6;
import 'rpc_images.pb.dart' as $11;
import 'rpc_login.pb.dart' as $0;
import 'rpc_lover.pb.dart' as $7;
import 'rpc_password.pb.dart' as $2;
import 'rpc_targetList.pb.dart' as $9;

export 'service_Backend.pb.dart';

@$pb.GrpcServiceName('pb.Backend')
class BackendClient extends $grpc.Client {
  static final _$loginUser = $grpc.ClientMethod<$0.LoginUserRequest, $0.LoginUserResponse>('/pb.Backend/LoginUser',
      ($0.LoginUserRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $0.LoginUserResponse.fromBuffer(value));
  static final _$checkEmail = $grpc.ClientMethod<$1.CheckEmailRequest, $1.CheckEmailResponse>('/pb.Backend/CheckEmail',
      ($1.CheckEmailRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $1.CheckEmailResponse.fromBuffer(value));
  static final _$checkEmailCode = $grpc.ClientMethod<$1.SendEmailRequest, $1.CheckedEmailResponse>('/pb.Backend/CheckEmailCode',
      ($1.SendEmailRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $1.CheckedEmailResponse.fromBuffer(value));
  static final _$inputPassword = $grpc.ClientMethod<$2.InputPasswordRequest, $2.InputPasswordResponse>(
      '/pb.Backend/InputPassword',
      ($2.InputPasswordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.InputPasswordResponse.fromBuffer(value));
  static final _$resetPassword = $grpc.ClientMethod<$2.ResetPasswordRequest, $2.ResetPasswordResponse>(
      '/pb.Backend/ResetPassword',
      ($2.ResetPasswordRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $2.ResetPasswordResponse.fromBuffer(value));
  static final _$createFix = $grpc.ClientMethod<$3.CreateFixRequest, $3.CreateFixResponse>('/pb.Backend/CreateFix',
      ($3.CreateFixRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $3.CreateFixResponse.fromBuffer(value));
  static final _$createCanChange = $grpc.ClientMethod<$4.CreateCanChangeRequest, $4.CreateCanChangeResponse>(
      '/pb.Backend/CreateCanChange',
      ($4.CreateCanChangeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.CreateCanChangeResponse.fromBuffer(value));
  static final _$getCanChange = $grpc.ClientMethod<$4.GetCanChangeRequest, $4.GetCanChangeResponse>('/pb.Backend/GetCanChange',
      ($4.GetCanChangeRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $4.GetCanChangeResponse.fromBuffer(value));
  static final _$updateCanChange = $grpc.ClientMethod<$4.UpdateCanChangeRequest, $4.UpdateCanChangeResponse>(
      '/pb.Backend/UpdateCanChange',
      ($4.UpdateCanChangeRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $4.UpdateCanChangeResponse.fromBuffer(value));
  static final _$createAccompany = $grpc.ClientMethod<$5.CreateAccompanyRequest, $5.CreateAccompanyResponse>(
      '/pb.Backend/CreateAccompany',
      ($5.CreateAccompanyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.CreateAccompanyResponse.fromBuffer(value));
  static final _$getAccompany = $grpc.ClientMethod<$5.GetAccompanyRequest, $5.GetAccompanyResponse>('/pb.Backend/GetAccompany',
      ($5.GetAccompanyRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $5.GetAccompanyResponse.fromBuffer(value));
  static final _$updateAccompany = $grpc.ClientMethod<$5.UpdateAccompanyRequest, $5.UpdateAccompanyResponse>(
      '/pb.Backend/UpdateAccompany',
      ($5.UpdateAccompanyRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $5.UpdateAccompanyResponse.fromBuffer(value));
  static final _$createHobby = $grpc.ClientMethod<$6.CreateHobbyRequest, $6.CreateHobbyResponse>('/pb.Backend/CreateHobby',
      ($6.CreateHobbyRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $6.CreateHobbyResponse.fromBuffer(value));
  static final _$getHobby = $grpc.ClientMethod<$6.GetHobbyRequest, $6.GetHobbyResponse>('/pb.Backend/GetHobby',
      ($6.GetHobbyRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $6.GetHobbyResponse.fromBuffer(value));
  static final _$updateHobby = $grpc.ClientMethod<$6.UpdateHobbyRequest, $6.UpdateHobbyResponse>('/pb.Backend/UpdateHobby',
      ($6.UpdateHobbyRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $6.UpdateHobbyResponse.fromBuffer(value));
  static final _$createLover = $grpc.ClientMethod<$7.CreateLoverRequest, $7.CreateLoverResponse>('/pb.Backend/CreateLover',
      ($7.CreateLoverRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $7.CreateLoverResponse.fromBuffer(value));
  static final _$getLover = $grpc.ClientMethod<$7.GetLoverRequest, $7.GetLoverResponse>('/pb.Backend/GetLover',
      ($7.GetLoverRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $7.GetLoverResponse.fromBuffer(value));
  static final _$updateLover = $grpc.ClientMethod<$7.UpdateLoverRequest, $7.UpdateLoverResponse>('/pb.Backend/UpdateLover',
      ($7.UpdateLoverRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $7.UpdateLoverResponse.fromBuffer(value));
  static final _$createComplaint = $grpc.ClientMethod<$8.CreateComplaintRequest, $8.CreateComplaintResponse>(
      '/pb.Backend/CreateComplaint',
      ($8.CreateComplaintRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.CreateComplaintResponse.fromBuffer(value));
  static final _$getComplaint = $grpc.ClientMethod<$8.GetComplaintRequest, $8.GetComplaintResponse>('/pb.Backend/GetComplaint',
      ($8.GetComplaintRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $8.GetComplaintResponse.fromBuffer(value));
  static final _$updateComplaint = $grpc.ClientMethod<$8.UpdateComplaintRequest, $8.UpdateComplaintResponse>(
      '/pb.Backend/UpdateComplaint',
      ($8.UpdateComplaintRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $8.UpdateComplaintResponse.fromBuffer(value));
  static final _$createTargetList = $grpc.ClientMethod<$9.CreateTargetListRequest, $9.CreateTargetListResponse>(
      '/pb.Backend/CreateTargetList',
      ($9.CreateTargetListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.CreateTargetListResponse.fromBuffer(value));
  static final _$getTargetList = $grpc.ClientMethod<$9.GetTargetListRequest, $9.GetTargetListResponse>(
      '/pb.Backend/GetTargetList',
      ($9.GetTargetListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.GetTargetListResponse.fromBuffer(value));
  static final _$updateTargetList = $grpc.ClientMethod<$9.UpdateTargetListRequest, $9.UpdateTargetListResponse>(
      '/pb.Backend/UpdateTargetList',
      ($9.UpdateTargetListRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $9.UpdateTargetListResponse.fromBuffer(value));
  static final _$createChangeTarget = $grpc.ClientMethod<$10.CreateChangeTargetRequest, $10.CreateChangeTargetResponse>(
      '/pb.Backend/CreateChangeTarget',
      ($10.CreateChangeTargetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.CreateChangeTargetResponse.fromBuffer(value));
  static final _$getChangeTarget = $grpc.ClientMethod<$10.GetChangeTargetRequest, $10.GetChangeTargetResponse>(
      '/pb.Backend/GetChangeTarget',
      ($10.GetChangeTargetRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $10.GetChangeTargetResponse.fromBuffer(value));
  static final _$createImages = $grpc.ClientMethod<$11.CreateImagesRequest, $11.CreateImagesResponse>(
      '/pb.Backend/CreateImages',
      ($11.CreateImagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $11.CreateImagesResponse.fromBuffer(value));
  static final _$getImages = $grpc.ClientMethod<$11.GetImagesRequest, $11.GetImagesResponse>('/pb.Backend/GetImages',
      ($11.GetImagesRequest value) => value.writeToBuffer(), ($core.List<$core.int> value) => $11.GetImagesResponse.fromBuffer(value));
  static final _$updateImages = $grpc.ClientMethod<$11.UpdateImagesRequest, $11.UpdateImagesResponse>(
      '/pb.Backend/UpdateImages',
      ($11.UpdateImagesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $11.UpdateImagesResponse.fromBuffer(value));

  BackendClient($grpc.ClientChannel channel, {$grpc.CallOptions? options, $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.LoginUserResponse> loginUser($0.LoginUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$loginUser, request, options: options);
  }

  $grpc.ResponseFuture<$1.CheckEmailResponse> checkEmail($1.CheckEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkEmail, request, options: options);
  }

  $grpc.ResponseFuture<$1.CheckedEmailResponse> checkEmailCode($1.SendEmailRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$checkEmailCode, request, options: options);
  }

  $grpc.ResponseFuture<$2.InputPasswordResponse> inputPassword($2.InputPasswordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$inputPassword, request, options: options);
  }

  $grpc.ResponseFuture<$2.ResetPasswordResponse> resetPassword($2.ResetPasswordRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$resetPassword, request, options: options);
  }

  $grpc.ResponseFuture<$3.CreateFixResponse> createFix($3.CreateFixRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createFix, request, options: options);
  }

  $grpc.ResponseFuture<$4.CreateCanChangeResponse> createCanChange($4.CreateCanChangeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createCanChange, request, options: options);
  }

  $grpc.ResponseFuture<$4.GetCanChangeResponse> getCanChange($4.GetCanChangeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getCanChange, request, options: options);
  }

  $grpc.ResponseFuture<$4.UpdateCanChangeResponse> updateCanChange($4.UpdateCanChangeRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateCanChange, request, options: options);
  }

  $grpc.ResponseFuture<$5.CreateAccompanyResponse> createAccompany($5.CreateAccompanyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createAccompany, request, options: options);
  }

  $grpc.ResponseFuture<$5.GetAccompanyResponse> getAccompany($5.GetAccompanyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getAccompany, request, options: options);
  }

  $grpc.ResponseFuture<$5.UpdateAccompanyResponse> updateAccompany($5.UpdateAccompanyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateAccompany, request, options: options);
  }

  $grpc.ResponseFuture<$6.CreateHobbyResponse> createHobby($6.CreateHobbyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createHobby, request, options: options);
  }

  $grpc.ResponseFuture<$6.GetHobbyResponse> getHobby($6.GetHobbyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getHobby, request, options: options);
  }

  $grpc.ResponseFuture<$6.UpdateHobbyResponse> updateHobby($6.UpdateHobbyRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateHobby, request, options: options);
  }

  $grpc.ResponseFuture<$7.CreateLoverResponse> createLover($7.CreateLoverRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createLover, request, options: options);
  }

  $grpc.ResponseFuture<$7.GetLoverResponse> getLover($7.GetLoverRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getLover, request, options: options);
  }

  $grpc.ResponseFuture<$7.UpdateLoverResponse> updateLover($7.UpdateLoverRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateLover, request, options: options);
  }

  $grpc.ResponseFuture<$8.CreateComplaintResponse> createComplaint($8.CreateComplaintRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createComplaint, request, options: options);
  }

  $grpc.ResponseFuture<$8.GetComplaintResponse> getComplaint($8.GetComplaintRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getComplaint, request, options: options);
  }

  $grpc.ResponseFuture<$8.UpdateComplaintResponse> updateComplaint($8.UpdateComplaintRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateComplaint, request, options: options);
  }

  $grpc.ResponseFuture<$9.CreateTargetListResponse> createTargetList($9.CreateTargetListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createTargetList, request, options: options);
  }

  $grpc.ResponseFuture<$9.GetTargetListResponse> getTargetList($9.GetTargetListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getTargetList, request, options: options);
  }

  $grpc.ResponseFuture<$9.UpdateTargetListResponse> updateTargetList($9.UpdateTargetListRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateTargetList, request, options: options);
  }

  $grpc.ResponseFuture<$10.CreateChangeTargetResponse> createChangeTarget($10.CreateChangeTargetRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createChangeTarget, request, options: options);
  }

  $grpc.ResponseFuture<$10.GetChangeTargetResponse> getChangeTarget($10.GetChangeTargetRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getChangeTarget, request, options: options);
  }

  $grpc.ResponseFuture<$11.CreateImagesResponse> createImages($11.CreateImagesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createImages, request, options: options);
  }

  $grpc.ResponseFuture<$11.GetImagesResponse> getImages($11.GetImagesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getImages, request, options: options);
  }

  $grpc.ResponseFuture<$11.UpdateImagesResponse> updateImages($11.UpdateImagesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateImages, request, options: options);
  }
}

@$pb.GrpcServiceName('pb.Backend')
abstract class BackendServiceBase extends $grpc.Service {
  $core.String get $name => 'pb.Backend';

  BackendServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.LoginUserRequest, $0.LoginUserResponse>('LoginUser', loginUser_Pre, false, false,
        ($core.List<$core.int> value) => $0.LoginUserRequest.fromBuffer(value), ($0.LoginUserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.CheckEmailRequest, $1.CheckEmailResponse>('CheckEmail', checkEmail_Pre, false, false,
        ($core.List<$core.int> value) => $1.CheckEmailRequest.fromBuffer(value), ($1.CheckEmailResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.SendEmailRequest, $1.CheckedEmailResponse>('CheckEmailCode', checkEmailCode_Pre, false, false,
        ($core.List<$core.int> value) => $1.SendEmailRequest.fromBuffer(value), ($1.CheckedEmailResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.InputPasswordRequest, $2.InputPasswordResponse>(
        'InputPassword',
        inputPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.InputPasswordRequest.fromBuffer(value),
        ($2.InputPasswordResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$2.ResetPasswordRequest, $2.ResetPasswordResponse>(
        'ResetPassword',
        resetPassword_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $2.ResetPasswordRequest.fromBuffer(value),
        ($2.ResetPasswordResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$3.CreateFixRequest, $3.CreateFixResponse>('CreateFix', createFix_Pre, false, false,
        ($core.List<$core.int> value) => $3.CreateFixRequest.fromBuffer(value), ($3.CreateFixResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.CreateCanChangeRequest, $4.CreateCanChangeResponse>(
        'CreateCanChange',
        createCanChange_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.CreateCanChangeRequest.fromBuffer(value),
        ($4.CreateCanChangeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.GetCanChangeRequest, $4.GetCanChangeResponse>(
        'GetCanChange',
        getCanChange_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.GetCanChangeRequest.fromBuffer(value),
        ($4.GetCanChangeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$4.UpdateCanChangeRequest, $4.UpdateCanChangeResponse>(
        'UpdateCanChange',
        updateCanChange_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $4.UpdateCanChangeRequest.fromBuffer(value),
        ($4.UpdateCanChangeResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.CreateAccompanyRequest, $5.CreateAccompanyResponse>(
        'CreateAccompany',
        createAccompany_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.CreateAccompanyRequest.fromBuffer(value),
        ($5.CreateAccompanyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.GetAccompanyRequest, $5.GetAccompanyResponse>(
        'GetAccompany',
        getAccompany_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.GetAccompanyRequest.fromBuffer(value),
        ($5.GetAccompanyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$5.UpdateAccompanyRequest, $5.UpdateAccompanyResponse>(
        'UpdateAccompany',
        updateAccompany_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $5.UpdateAccompanyRequest.fromBuffer(value),
        ($5.UpdateAccompanyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.CreateHobbyRequest, $6.CreateHobbyResponse>('CreateHobby', createHobby_Pre, false, false,
        ($core.List<$core.int> value) => $6.CreateHobbyRequest.fromBuffer(value), ($6.CreateHobbyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.GetHobbyRequest, $6.GetHobbyResponse>('GetHobby', getHobby_Pre, false, false,
        ($core.List<$core.int> value) => $6.GetHobbyRequest.fromBuffer(value), ($6.GetHobbyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$6.UpdateHobbyRequest, $6.UpdateHobbyResponse>('UpdateHobby', updateHobby_Pre, false, false,
        ($core.List<$core.int> value) => $6.UpdateHobbyRequest.fromBuffer(value), ($6.UpdateHobbyResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.CreateLoverRequest, $7.CreateLoverResponse>('CreateLover', createLover_Pre, false, false,
        ($core.List<$core.int> value) => $7.CreateLoverRequest.fromBuffer(value), ($7.CreateLoverResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.GetLoverRequest, $7.GetLoverResponse>('GetLover', getLover_Pre, false, false,
        ($core.List<$core.int> value) => $7.GetLoverRequest.fromBuffer(value), ($7.GetLoverResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$7.UpdateLoverRequest, $7.UpdateLoverResponse>('UpdateLover', updateLover_Pre, false, false,
        ($core.List<$core.int> value) => $7.UpdateLoverRequest.fromBuffer(value), ($7.UpdateLoverResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.CreateComplaintRequest, $8.CreateComplaintResponse>(
        'CreateComplaint',
        createComplaint_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.CreateComplaintRequest.fromBuffer(value),
        ($8.CreateComplaintResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.GetComplaintRequest, $8.GetComplaintResponse>(
        'GetComplaint',
        getComplaint_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.GetComplaintRequest.fromBuffer(value),
        ($8.GetComplaintResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$8.UpdateComplaintRequest, $8.UpdateComplaintResponse>(
        'UpdateComplaint',
        updateComplaint_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $8.UpdateComplaintRequest.fromBuffer(value),
        ($8.UpdateComplaintResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.CreateTargetListRequest, $9.CreateTargetListResponse>(
        'CreateTargetList',
        createTargetList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.CreateTargetListRequest.fromBuffer(value),
        ($9.CreateTargetListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.GetTargetListRequest, $9.GetTargetListResponse>(
        'GetTargetList',
        getTargetList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.GetTargetListRequest.fromBuffer(value),
        ($9.GetTargetListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$9.UpdateTargetListRequest, $9.UpdateTargetListResponse>(
        'UpdateTargetList',
        updateTargetList_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $9.UpdateTargetListRequest.fromBuffer(value),
        ($9.UpdateTargetListResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.CreateChangeTargetRequest, $10.CreateChangeTargetResponse>(
        'CreateChangeTarget',
        createChangeTarget_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.CreateChangeTargetRequest.fromBuffer(value),
        ($10.CreateChangeTargetResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$10.GetChangeTargetRequest, $10.GetChangeTargetResponse>(
        'GetChangeTarget',
        getChangeTarget_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $10.GetChangeTargetRequest.fromBuffer(value),
        ($10.GetChangeTargetResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.CreateImagesRequest, $11.CreateImagesResponse>(
        'CreateImages',
        createImages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $11.CreateImagesRequest.fromBuffer(value),
        ($11.CreateImagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.GetImagesRequest, $11.GetImagesResponse>('GetImages', getImages_Pre, false, false,
        ($core.List<$core.int> value) => $11.GetImagesRequest.fromBuffer(value), ($11.GetImagesResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$11.UpdateImagesRequest, $11.UpdateImagesResponse>(
        'UpdateImages',
        updateImages_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $11.UpdateImagesRequest.fromBuffer(value),
        ($11.UpdateImagesResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.LoginUserResponse> loginUser_Pre($grpc.ServiceCall call, $async.Future<$0.LoginUserRequest> request) async {
    return loginUser(call, await request);
  }

  $async.Future<$1.CheckEmailResponse> checkEmail_Pre($grpc.ServiceCall call, $async.Future<$1.CheckEmailRequest> request) async {
    return checkEmail(call, await request);
  }

  $async.Future<$1.CheckedEmailResponse> checkEmailCode_Pre($grpc.ServiceCall call, $async.Future<$1.SendEmailRequest> request) async {
    return checkEmailCode(call, await request);
  }

  $async.Future<$2.InputPasswordResponse> inputPassword_Pre($grpc.ServiceCall call, $async.Future<$2.InputPasswordRequest> request) async {
    return inputPassword(call, await request);
  }

  $async.Future<$2.ResetPasswordResponse> resetPassword_Pre($grpc.ServiceCall call, $async.Future<$2.ResetPasswordRequest> request) async {
    return resetPassword(call, await request);
  }

  $async.Future<$3.CreateFixResponse> createFix_Pre($grpc.ServiceCall call, $async.Future<$3.CreateFixRequest> request) async {
    return createFix(call, await request);
  }

  $async.Future<$4.CreateCanChangeResponse> createCanChange_Pre(
      $grpc.ServiceCall call, $async.Future<$4.CreateCanChangeRequest> request) async {
    return createCanChange(call, await request);
  }

  $async.Future<$4.GetCanChangeResponse> getCanChange_Pre($grpc.ServiceCall call, $async.Future<$4.GetCanChangeRequest> request) async {
    return getCanChange(call, await request);
  }

  $async.Future<$4.UpdateCanChangeResponse> updateCanChange_Pre(
      $grpc.ServiceCall call, $async.Future<$4.UpdateCanChangeRequest> request) async {
    return updateCanChange(call, await request);
  }

  $async.Future<$5.CreateAccompanyResponse> createAccompany_Pre(
      $grpc.ServiceCall call, $async.Future<$5.CreateAccompanyRequest> request) async {
    return createAccompany(call, await request);
  }

  $async.Future<$5.GetAccompanyResponse> getAccompany_Pre($grpc.ServiceCall call, $async.Future<$5.GetAccompanyRequest> request) async {
    return getAccompany(call, await request);
  }

  $async.Future<$5.UpdateAccompanyResponse> updateAccompany_Pre(
      $grpc.ServiceCall call, $async.Future<$5.UpdateAccompanyRequest> request) async {
    return updateAccompany(call, await request);
  }

  $async.Future<$6.CreateHobbyResponse> createHobby_Pre($grpc.ServiceCall call, $async.Future<$6.CreateHobbyRequest> request) async {
    return createHobby(call, await request);
  }

  $async.Future<$6.GetHobbyResponse> getHobby_Pre($grpc.ServiceCall call, $async.Future<$6.GetHobbyRequest> request) async {
    return getHobby(call, await request);
  }

  $async.Future<$6.UpdateHobbyResponse> updateHobby_Pre($grpc.ServiceCall call, $async.Future<$6.UpdateHobbyRequest> request) async {
    return updateHobby(call, await request);
  }

  $async.Future<$7.CreateLoverResponse> createLover_Pre($grpc.ServiceCall call, $async.Future<$7.CreateLoverRequest> request) async {
    return createLover(call, await request);
  }

  $async.Future<$7.GetLoverResponse> getLover_Pre($grpc.ServiceCall call, $async.Future<$7.GetLoverRequest> request) async {
    return getLover(call, await request);
  }

  $async.Future<$7.UpdateLoverResponse> updateLover_Pre($grpc.ServiceCall call, $async.Future<$7.UpdateLoverRequest> request) async {
    return updateLover(call, await request);
  }

  $async.Future<$8.CreateComplaintResponse> createComplaint_Pre(
      $grpc.ServiceCall call, $async.Future<$8.CreateComplaintRequest> request) async {
    return createComplaint(call, await request);
  }

  $async.Future<$8.GetComplaintResponse> getComplaint_Pre($grpc.ServiceCall call, $async.Future<$8.GetComplaintRequest> request) async {
    return getComplaint(call, await request);
  }

  $async.Future<$8.UpdateComplaintResponse> updateComplaint_Pre(
      $grpc.ServiceCall call, $async.Future<$8.UpdateComplaintRequest> request) async {
    return updateComplaint(call, await request);
  }

  $async.Future<$9.CreateTargetListResponse> createTargetList_Pre(
      $grpc.ServiceCall call, $async.Future<$9.CreateTargetListRequest> request) async {
    return createTargetList(call, await request);
  }

  $async.Future<$9.GetTargetListResponse> getTargetList_Pre($grpc.ServiceCall call, $async.Future<$9.GetTargetListRequest> request) async {
    return getTargetList(call, await request);
  }

  $async.Future<$9.UpdateTargetListResponse> updateTargetList_Pre(
      $grpc.ServiceCall call, $async.Future<$9.UpdateTargetListRequest> request) async {
    return updateTargetList(call, await request);
  }

  $async.Future<$10.CreateChangeTargetResponse> createChangeTarget_Pre(
      $grpc.ServiceCall call, $async.Future<$10.CreateChangeTargetRequest> request) async {
    return createChangeTarget(call, await request);
  }

  $async.Future<$10.GetChangeTargetResponse> getChangeTarget_Pre(
      $grpc.ServiceCall call, $async.Future<$10.GetChangeTargetRequest> request) async {
    return getChangeTarget(call, await request);
  }

  $async.Future<$11.CreateImagesResponse> createImages_Pre($grpc.ServiceCall call, $async.Future<$11.CreateImagesRequest> request) async {
    return createImages(call, await request);
  }

  $async.Future<$11.GetImagesResponse> getImages_Pre($grpc.ServiceCall call, $async.Future<$11.GetImagesRequest> request) async {
    return getImages(call, await request);
  }

  $async.Future<$11.UpdateImagesResponse> updateImages_Pre($grpc.ServiceCall call, $async.Future<$11.UpdateImagesRequest> request) async {
    return updateImages(call, await request);
  }

  $async.Future<$0.LoginUserResponse> loginUser($grpc.ServiceCall call, $0.LoginUserRequest request);
  $async.Future<$1.CheckEmailResponse> checkEmail($grpc.ServiceCall call, $1.CheckEmailRequest request);
  $async.Future<$1.CheckedEmailResponse> checkEmailCode($grpc.ServiceCall call, $1.SendEmailRequest request);
  $async.Future<$2.InputPasswordResponse> inputPassword($grpc.ServiceCall call, $2.InputPasswordRequest request);
  $async.Future<$2.ResetPasswordResponse> resetPassword($grpc.ServiceCall call, $2.ResetPasswordRequest request);
  $async.Future<$3.CreateFixResponse> createFix($grpc.ServiceCall call, $3.CreateFixRequest request);
  $async.Future<$4.CreateCanChangeResponse> createCanChange($grpc.ServiceCall call, $4.CreateCanChangeRequest request);
  $async.Future<$4.GetCanChangeResponse> getCanChange($grpc.ServiceCall call, $4.GetCanChangeRequest request);
  $async.Future<$4.UpdateCanChangeResponse> updateCanChange($grpc.ServiceCall call, $4.UpdateCanChangeRequest request);
  $async.Future<$5.CreateAccompanyResponse> createAccompany($grpc.ServiceCall call, $5.CreateAccompanyRequest request);
  $async.Future<$5.GetAccompanyResponse> getAccompany($grpc.ServiceCall call, $5.GetAccompanyRequest request);
  $async.Future<$5.UpdateAccompanyResponse> updateAccompany($grpc.ServiceCall call, $5.UpdateAccompanyRequest request);
  $async.Future<$6.CreateHobbyResponse> createHobby($grpc.ServiceCall call, $6.CreateHobbyRequest request);
  $async.Future<$6.GetHobbyResponse> getHobby($grpc.ServiceCall call, $6.GetHobbyRequest request);
  $async.Future<$6.UpdateHobbyResponse> updateHobby($grpc.ServiceCall call, $6.UpdateHobbyRequest request);
  $async.Future<$7.CreateLoverResponse> createLover($grpc.ServiceCall call, $7.CreateLoverRequest request);
  $async.Future<$7.GetLoverResponse> getLover($grpc.ServiceCall call, $7.GetLoverRequest request);
  $async.Future<$7.UpdateLoverResponse> updateLover($grpc.ServiceCall call, $7.UpdateLoverRequest request);
  $async.Future<$8.CreateComplaintResponse> createComplaint($grpc.ServiceCall call, $8.CreateComplaintRequest request);
  $async.Future<$8.GetComplaintResponse> getComplaint($grpc.ServiceCall call, $8.GetComplaintRequest request);
  $async.Future<$8.UpdateComplaintResponse> updateComplaint($grpc.ServiceCall call, $8.UpdateComplaintRequest request);
  $async.Future<$9.CreateTargetListResponse> createTargetList($grpc.ServiceCall call, $9.CreateTargetListRequest request);
  $async.Future<$9.GetTargetListResponse> getTargetList($grpc.ServiceCall call, $9.GetTargetListRequest request);
  $async.Future<$9.UpdateTargetListResponse> updateTargetList($grpc.ServiceCall call, $9.UpdateTargetListRequest request);
  $async.Future<$10.CreateChangeTargetResponse> createChangeTarget($grpc.ServiceCall call, $10.CreateChangeTargetRequest request);
  $async.Future<$10.GetChangeTargetResponse> getChangeTarget($grpc.ServiceCall call, $10.GetChangeTargetRequest request);
  $async.Future<$11.CreateImagesResponse> createImages($grpc.ServiceCall call, $11.CreateImagesRequest request);
  $async.Future<$11.GetImagesResponse> getImages($grpc.ServiceCall call, $11.GetImagesRequest request);
  $async.Future<$11.UpdateImagesResponse> updateImages($grpc.ServiceCall call, $11.UpdateImagesRequest request);
}
